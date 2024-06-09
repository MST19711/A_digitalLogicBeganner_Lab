`timescale 1ns / 1ps
`define NVB

module SingleCycleCPU_top(
    input CLK,
    input BTNC,
    output [15:0] dataout_L16b,
    input PS2_CLK,    //���Լ��̵�ʱ���ź�
    input PS2_DATA,  //���Լ��̵Ĵ�������λ
`ifdef NVB
    output [7:0] o_seg0,
    output [7:0] o_seg1,
    output [7:0] o_seg2,
    output [7:0] o_seg3,
    output [7:0] o_seg4,
    output [7:0] o_seg5,
    output [7:0] o_seg6,
    output [7:0] o_seg7,
    // for nvboard
    output VALID,
`else
    output [6:0]SEG,     
    output [7:0]AN,          
`endif
    output [3:0] VGA_R,
    output [3:0] VGA_G,
    output [3:0] VGA_B,
    output  VGA_HS,
    output  VGA_VS
);
    reg [31:0] clk_counter = 0;
    wire RST = BTNC;
    wire cpuclk;
    reg cpuclk_reg = 0;
    assign cpuclk = CLK;//cpuclk_reg;//CLK;
    reg [31:0] cpuclk_cnt = 0;
    always @(negedge CLK) begin
        if(clk_counter == 49) begin
            clk_counter <= 0;
            cpuclk_reg <= ~cpuclk_reg;
            /*
            if(cpuclk_reg) begin
                cpuclk_cnt <= cpuclk_cnt + 1;
                $display("cycle : %d",cpuclk_cnt);
            end
            */
        end else begin
            clk_counter <= clk_counter + 1;
        end
    end
    wire [31:0] InstrMemaddr_W;
    wire [31:0] InstrMemdataout_W;
    wire InstrMemclk_W;
    wire [31:0] DataMemaddr_W;
    wire [31:0] DataMemdataout_W;
    wire [31:0] DataMemdatain_W;
    wire DataMemrdclk_W;
    wire DataMemwrclk_W;
    wire [2:0] DataMemop_W;
    wire DataMemwe_W;
    wire [15:0] dbgdata_W;
    wire rst_sig;
    reg [31:0] i;
    reg rsting = 0;

    wire pix_clk = CLK;
    wire [11:0] vram_output[2];
    wire [31:0] vram_addr;
    assign vram_output[0] = 12'b111111111111;
    reg vram_chose = 0;
    VGASim display(
        .ram_addr(vram_addr),
        .CLK(pix_clk),
        .BTNC(BTNC),
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .VALID(VALID),
        .vramd_read(vram_output[vram_chose])
    );

    SingleCycleCPU CPU0(
        .clock(cpuclk),
        .reset(rst_sig),
        .InstrMemaddr(InstrMemaddr_W),        // 指令存储器地址
        .InstrMemdataout(InstrMemdataout_W),     // 指令内容
        .InstrMemclk(InstrMemclk_W),         // 指令存储器读取时钟，为了实现异步读取，设置读取时钟和写入时钟反相
        .DataMemaddr(DataMemaddr_W),         // 数据存储器地址
        .DataMemdataout(DataMemdataout_W),      // 数据存储器输出数据
        .DataMemdatain(DataMemdatain_W),       // 数据存储器写入数据
        .DataMemrdclk(DataMemrdclk_W),        // 数据存储器读取时钟，为了实现异步读取，设置读取时钟和写入时钟反相
        .DataMemwrclk(DataMemwrclk_W),        // 数据存储器写入时钟
        .DataMemop(DataMemop_W),           // 数据读写字节数控制信号
        .DataMemwe(DataMemwe_W),           // 数据存储器写入使能信号
        .dbgdata(dbgdata_W)              // debug调试信号，输出16位指令存储器地址有效地址
    );
    assign dataout_L16b = dbgdata_W;
    ram_64k InstrMem(
        .dataout(InstrMemdataout_W), 
        .Rclk(InstrMemclk_W),   
        .Wclk(1'b0),             
        .MemOp(3'b010),      
        .datain(32'd0),    
        .addr(InstrMemaddr_W[17:0]),      
        .we(1'b0)
    );
    // 栈空间从0xFFFFFFFF开始向下
    // 32M栈地址空间
    // 256kb栈空间，如果没有设置c语言运行时的话程序中请不要写全局变量
    // 堆区地址空间为0xb0000000开始的32M
    // 堆空间也只有256kb，请节约使用
    // 0xa0000000 到 0xa0000FFF 为终端窗口，显示模块只能read, cpu可以写入或读取。
    // 对该区域的所有load/store指令都只有最低的一字节是有效的，编写程序时请注意语义正确
    // 终端窗口的指针地址为0xa0000FFF，该指针由于未知原因最好将其视作只写变量，在其上做自增可能会出现未知原因的错误
    // 0xa0001000 到 0xa0001FFF 为键盘IO区域
    // 从0xa0001000 到 0xa00010FF为键盘扫描吗映射区域，
    // 该区域相应位置读结果为1(0xFFFFFFFF)则表明已经该按键为按下状态，反之认为该按键为抬起状态
    // cpu只能从该区域读取而不能写入，键盘控制器负责向键盘IO区域写入当前键盘状态。
    // 0x1004F000 为数码管
    wire [31:0] KB_memmap_addr;
    assign KB_memmap_addr = (DataMemaddr_W >= 32'ha0001000 && DataMemaddr_W <= 32'ha00010FF) ? DataMemaddr_W : 0;
    wire [31:0] KB_memmap_output;
    KeyboardCtrl kb_0(
        .CLK100MHZ(CLK),   //ϵͳʱ���ź�
        .PS2_CLK(PS2_CLK),    //���Լ��̵�ʱ���ź�
        .PS2_DATA(PS2_DATA),  //���Լ��̵Ĵ�������λ
        .BTNC(BTNC),      //Reset
        .memmap_addr(KB_memmap_addr),
        .memmap_output(KB_memmap_output)
    );
    wire [31:0] consoles_0_bufferout;
    wire [17:0] consoles_0_CPU_addr;
    wire consoles_0_we = (DataMemaddr_W >= 32'ha0000000 && DataMemaddr_W <= 32'ha0000FFF) ? DataMemwe_W : 0;
    assign consoles_0_CPU_addr = (DataMemaddr_W >= 32'ha0000000 && DataMemaddr_W <= 32'ha0000FFF) ? DataMemaddr_W[17:0] : 0;
    wire [17:0] con0_charaddr;
    wire con0_rclk;
    wire [7:0] con0_charread;
    consoles_ctrl consoles_0_ctrl(
        .dataout(consoles_0_bufferout), 
        .textdataout(con0_charread),
        .Rclk_A(DataMemrdclk_W),  
        .Rclk_B(con0_rclk),  
        .Wclk(DataMemwrclk_W),                
        .MemOp(DataMemop_W),      
        .datain(DataMemdatain_W),    
        .addr_A(consoles_0_CPU_addr),      
        .addr_B(con0_charaddr),      
        .we(consoles_0_we)
    );
    reg [31:0] con0_ptr = 0;
    consoles_display consoles_0_display(
        .addra(vram_addr),
        .clk(CLK),
        .char_addr(con0_charaddr),
        .memread_clk(con0_rclk),
        .text_read(con0_charread),
        .color(vram_output[0]),
        .ptr(con0_ptr)
    );
    wire [17:0] dataram_stack_addr;
    assign dataram_stack_addr = (DataMemaddr_W >= 2**32 - 32*1024*1024) ? DataMemaddr_W[17:0] : 0;
    wire darm_stack_we;
    assign darm_stack_we = (DataMemaddr_W >= 2**32 - 32*1024*1024) ? DataMemwe_W : 0;
    wire [31:0] DataMemdataout_RAM_stack;

    wire [17:0] dataram_heap_addr;
    assign dataram_heap_addr = (DataMemaddr_W >= 32'hb0000000 && DataMemaddr_W <= 32'hb0000000 + 32*1024*1024) ? DataMemaddr_W[17:0] : 0;
    wire darm_heap_we;
    assign darm_heap_we =  (DataMemaddr_W >= 32'hb0000000 && DataMemaddr_W <= 32'hb0000000 + 32*1024*1024) ? DataMemwe_W : 0;
    wire [31:0] DataMemdataout_RAM_heap;

    assign DataMemdataout_W = (DataMemaddr_W >= 2**32 - 32*1024*1024) ? DataMemdataout_RAM_stack :
                                (DataMemaddr_W >= 32'hb0000000 && DataMemaddr_W <= 32'hb0000000 + 32*1024*1024) ? DataMemdataout_RAM_heap :
                                (DataMemaddr_W >= 32'ha0000000 && DataMemaddr_W <= 32'ha0000FFF) ? consoles_0_bufferout : 
                                (DataMemaddr_W == 32'ha0000FFF) ? con0_ptr :
                                (DataMemaddr_W >= 32'ha0001000 && DataMemaddr_W <= 32'ha00010FF) ? KB_memmap_output :
                                32'd0;
    /*
    always @(DataMemaddr_W) begin
        if(DataMemaddr_W >= 32'hb0000000 && DataMemaddr_W <= 32'hb0000000 + 32*1024*1024) begin
            if(DataMemdataout_RAM_heap != 0) begin
                $display("read heap : %h at %h", DataMemdataout_RAM_heap, DataMemaddr_W);
            end
            if(darm_heap_we == 1) begin
                $display("write heap : %h to %h", DataMemdatain_W, DataMemaddr_W);
            end
        end
    end
    */
    
    DataRam_64k stack(
        .dataout(DataMemdataout_RAM_stack), 
        .Rclk(DataMemrdclk_W),            
        .Wclk(DataMemwrclk_W),    
        .MemOp(DataMemop_W),      
        .datain(DataMemdatain_W),    
        .addr(dataram_stack_addr),      
        .we(darm_stack_we)
    );
    DataRam_64k heap(
        .dataout(DataMemdataout_RAM_heap), 
        .Rclk(DataMemrdclk_W),            
        .Wclk(DataMemwrclk_W),    
        .MemOp(DataMemop_W),      
        .datain(DataMemdatain_W),    
        .addr(dataram_heap_addr),      
        .we(darm_heap_we)
    );
    // 将地址0x1004F000映射到数码管上
    reg [31:0] seg_R;
    always @(posedge DataMemwrclk_W) begin
        //if (DataMemwe_W)    $display("PC = %h, write %h to datamem %h", CPU0.pc, DataMemdatain_W, DataMemaddr_W);
        if (DataMemwe_W && DataMemaddr_W == 32'h1004F000) seg_R <= DataMemdatain_W;
        //if (DataMemwe_W && DataMemaddr_W == 32'h1004F000) $display("seg : %h", DataMemdatain_W);
        if (DataMemwe_W && DataMemaddr_W == 32'ha0000FFF) con0_ptr <= DataMemdatain_W;
        //if (DataMemwe_W && DataMemaddr_W == 32'ha0000FFF) $display("%h write to con0_ptr", DataMemdatain_W);
    end
    wire [31:0] segdata = seg_R;//CPU0.myregfile.regfiles[15];//{16'b0, dbgdata_W};

`ifdef NVB
    seg nvb_seg(
        .clk(CLK),
        .rst(BTNC),
        .num(segdata),
        .o_seg0(o_seg0),
        .o_seg1(o_seg1),
        .o_seg2(o_seg2),
        .o_seg3(o_seg3),
        .o_seg4(o_seg4),
        .o_seg5(o_seg5),
        .o_seg6(o_seg6),
        .o_seg7(o_seg7)
    );
`else
    seg7decimal my_seg7(
        .x(segdata),
        .clk(CLK),
        .seg(SEG),
        .an(AN),
        .dp(0)
    );
`endif
endmodule