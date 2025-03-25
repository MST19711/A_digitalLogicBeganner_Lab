`timescale 1ns / 1ps
//使用小端
module ram_64k(
    output [31:0] dataout, 
    input Rclk,  
    input Wclk,                
    input [2:0] MemOp,      
    input [31:0] datain,    
    input [17:0] addr,      
    input we
);
// Add your code here
/* verilator lint_off WIDTHTRUNC */
    wire [3:0] we_W_T;
    reg [31:0] outreg;
    wire [31:0] out_valid_w;
    (* ram_style="block" *) reg [31:0] ram [2**16-1:0];
    initial begin
    // 使用$readmemh系统任务从.hex文件中读取数据到寄存器文件
        $readmemh("/Users/cx_li/Documents/Github/digitalLogic_Lab/digital_logic_exp/lab8/testcase/Fibonacci.hex", ram);
    end  
    always @(negedge Rclk) begin
        outreg <= ram[addr >> 2];
    end
    wire [31:0] outwire;
    assign outwire = outreg;
    assign we_W_T = 
                MemOp == 3'b000 ? ((we == 1) ? 4'b0001 : 4'd0000) :
                MemOp == 3'b001 ? ((we == 1) ? 4'b0011 : 4'd0000) :
                MemOp == 3'b010 ? ((we == 1) ? 4'b1111 : 4'd0000) :
                MemOp == 3'b100 ? (4'd0000) :
                MemOp == 3'b101 ? (4'd0000) :
                0;
    always @(posedge Wclk) begin
        /* verilator lint_off CMPCONST */
        if (we && addr <= 2**16-1 && we_W_T[0] == 1) ram[addr >> 2] <= datain;
        /* verilator lint_on CMPCONST */
    end

    wire [31:0] outW_T;
    assign outW_T = outwire;
    assign dataout = 
                    MemOp == 3'b000 ? ({outW_T[7] == 1 ? 24'b111111111111111111111111 : 24'd0, outW_T[7:0]}) :
                    MemOp == 3'b001 ? ({outW_T[15] == 1 ? 16'b1111111111111111 : 16'd0, outW_T[15:0]}) :
                    MemOp == 3'b010 ? (outW_T[31:0]) :
                    MemOp == 3'b100 ? ({24'd0, outW_T[7:0]}) :
                    MemOp == 3'b101 ? ({16'd0, outW_T[15:0]}) :
                    0;
endmodule


`timescale 1ns / 1ps

module DataRam_64k(
    output [31:0] dataout, 
    input Rclk,  
    input Wclk,                
    input [2:0] MemOp,      
    input [31:0] datain,    
    input [17:0] addr,      
    input we
);
// Add your code here
/* verilator lint_off WIDTHTRUNC */
    wire [3:0] we_W_T;
    reg [31:0] outreg;
    wire [31:0] out_valid_w;
    wire [31:0] outwire;
    wire [7:0] memwire [3:0];
    wire [3:0] memwe;
    wire [15:0] memaddr [3:0];
    wire [7:0] memdatain [3:0];
    mem8b mem_0(.dataout(memwire[0]), .datain(memdatain[0]), .we(memwe[0]), .addr(memaddr[0]), .Rclk(Rclk), .Wclk(Wclk));
    mem8b mem_1(.dataout(memwire[1]), .datain(memdatain[1]), .we(memwe[1]), .addr(memaddr[1]), .Rclk(Rclk), .Wclk(Wclk));
    mem8b mem_2(.dataout(memwire[2]), .datain(memdatain[2]), .we(memwe[2]), .addr(memaddr[2]), .Rclk(Rclk), .Wclk(Wclk));
    mem8b mem_3(.dataout(memwire[3]), .datain(memdatain[3]), .we(memwe[3]), .addr(memaddr[3]), .Rclk(Rclk), .Wclk(Wclk));
    assign memaddr[0] = (addr % 4 > 0) ? (addr >> 2) : (addr >> 2) + 1;
    assign memaddr[1] = (addr % 4 > 1) ? (addr >> 2) : (addr >> 2) + 1;
    assign memaddr[2] = (addr % 4 > 2) ? (addr >> 2) : (addr >> 2) + 1;
    assign memaddr[3] = (addr % 4 > 3) ? (addr >> 2) : (addr >> 2) + 1;
    assign outwire[7:0] = (addr % 4 == 0) ? memwire[0] :
                            (addr % 4 == 1) ? memwire[1] :
                            (addr % 4 == 2) ? memwire[2] :
                            memwire[3];
    assign outwire[15:8] = (addr % 4 == 0) ? memwire[1] :
                            (addr % 4 == 1) ? memwire[2] :
                            (addr % 4 == 2) ? memwire[3] :
                            memwire[0];
    assign outwire[23:16] = (addr % 4 == 0) ? memwire[2] :
                            (addr % 4 == 1) ? memwire[3] :
                            (addr % 4 == 2) ? memwire[0] :
                            memwire[1];
    assign outwire[31:24] = (addr % 4 == 0) ? memwire[3] :
                            (addr % 4 == 1) ? memwire[0] :
                            (addr % 4 == 2) ? memwire[1] :
                            memwire[2];

    assign memwe[0] = (addr % 4 == 0) ? we_W_T[0] : 
                        (addr % 4 == 1) ? we_W_T[3] :
                        (addr % 4 == 2) ? we_W_T[2] :
                        we_W_T[1];
    assign memwe[1] = (addr % 4 == 0) ? we_W_T[1] : 
                        (addr % 4 == 1) ? we_W_T[0] :
                        (addr % 4 == 2) ? we_W_T[3] :
                        we_W_T[2];          
    assign memwe[2] = (addr % 4 == 0) ? we_W_T[2] :
                        (addr % 4 == 1) ? we_W_T[1] :
                        (addr % 4 == 2) ? we_W_T[0] :
                        we_W_T[3];
    assign memwe[3] = (addr % 4 == 0) ? we_W_T[3] : 
                        (addr % 4 == 1) ? we_W_T[2] :
                        (addr % 4 == 2) ? we_W_T[1] :
                        we_W_T[0];
    assign memdatain[0] = (addr % 4 == 0) ? datain[7:0] :
                            (addr % 4 == 1) ? datain[31:24] :
                            (addr % 4 == 2) ? datain[23:16] :
                            datain[15:8];
    assign memdatain[1] = (addr % 4 == 0) ? datain[15:8] :
                            (addr % 4 == 1) ? datain[7:0] :
                            (addr % 4 == 2) ? datain[31:24] :
                            datain[23:16];
    assign memdatain[2] = (addr % 4 == 0) ? datain[23:16] :
                            (addr % 4 == 1) ? datain[15:8] :
                            (addr % 4 == 2) ? datain[7:0] :
                            datain[31:24];
    assign memdatain[3] = (addr % 4 == 0) ? datain[31:24] :
                            (addr % 4 == 1) ? datain[23:16] :
                            (addr % 4 == 2) ? datain[15:8] :
                            datain[7:0];
    /* verilator lint_off WIDTHTRUNC */
    assign we_W_T = 
                MemOp == 3'b000 ? ((we == 1) ? 4'b0001 : 4'd0000) :
                MemOp == 3'b001 ? ((we == 1) ? 4'b0011 : 4'd0000) :
                MemOp == 3'b010 ? ((we == 1) ? 4'b1111 : 4'd0000) :
                MemOp == 3'b100 ? (4'd0000) :
                MemOp == 3'b101 ? (4'd0000) :
                0;
    
    wire [31:0] outW_T;
    assign outW_T = outwire;
    assign dataout = 
                    MemOp == 3'b000 ? ({outW_T[7] == 1 ? 24'b111111111111111111111111 : 24'd0, outW_T[7:0]}) :
                    MemOp == 3'b001 ? ({outW_T[15] == 1 ? 16'b1111111111111111 : 16'd0, outW_T[15:0]}) :
                    MemOp == 3'b010 ? (outW_T[31:0]) :
                    MemOp == 3'b100 ? ({24'd0, outW_T[7:0]}) :
                    MemOp == 3'b101 ? ({16'd0, outW_T[15:0]}) :
                    0;
endmodule

module mem8b (
    output reg [7:0] dataout,
    input [7:0] datain,
    input we,
    input [15:0] addr,
    input Rclk,
    input Wclk
);
    (* ram_style="block" *) reg [7:0] data [2**15-1:0];
    always @(negedge Rclk)begin
        dataout <= data[addr];
    end
    always @(posedge Wclk) begin
        if(we) data[addr] <= datain;
    end
endmodule