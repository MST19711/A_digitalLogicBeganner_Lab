`timescale 1ns / 1ps
`define NVB

module SingleCycleCPU_top(
    input CLK,
    input BTNC,
    output [15:0] dataout_L16b,
`ifdef NVB
    output [7:0] o_seg0,
    output [7:0] o_seg1,
    output [7:0] o_seg2,
    output [7:0] o_seg3,
    output [7:0] o_seg4,
    output [7:0] o_seg5,
    output [7:0] o_seg6,
    output [7:0] o_seg7
`else
    output [6:0]SEG,     
    output [7:0]AN          
`endif
);
    wire RST = BTNC;
    wire cpuclk;
    assign cpuclk = CLK;
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
        .addr(InstrMemaddr_W[15:0]),      
        .we(1'b0)
    );
    DataRam_64k DataMem(
        .dataout(DataMemdataout_W), 
        .Rclk(DataMemrdclk_W),            
        .Wclk(DataMemwrclk_W),    
        .MemOp(DataMemop_W),      
        .datain(DataMemdatain_W),    
        .addr(DataMemaddr_W[15:0]),      
        .we(DataMemwe_W)
    );
    // 将地址0x1004F000映射到数码管上
    reg [31:0] seg_R;
    always @(posedge DataMemwrclk_W) begin
        //if (DataMemwe_W)    $display("PC = %h, write %h to datamem %h", CPU0.pc, DataMemdatain_W, DataMemaddr_W);
        if (DataMemwe_W && DataMemaddr_W == 32'h1004F000) seg_R <= DataMemdatain_W;
        //if (DataMemwe_W && DataMemaddr_W == 32'h1004F000) $display("seg : %h", DataMemdatain_W);
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