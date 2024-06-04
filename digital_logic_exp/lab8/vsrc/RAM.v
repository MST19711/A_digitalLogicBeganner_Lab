`timescale 1ns / 1ps
//使用小端
module ram_64k(
    output [31:0] dataout, 
    input Rclk,  
    input Wclk,                
    input [2:0] MemOp,      
    input [31:0] datain,    
    input [15:0] addr,      
    input we
);
// Add your code here
    wire [3:0] we_W_T;
    reg [31:0] outreg;
    wire [31:0] out_valid_w;
    (* ram_style="block" *) reg [7:0] ram [2**11-1:0];
    initial begin
    // 使用$readmemh系统任务�?.hex文件中读取数据到寄存器文�?
        $readmemh("F:\\digitalLogic_Lab\\digital_logic_exp\\lab8\\testcase\\Fibonacci_with_call_littleEnd_1byte.hex", ram);
    end
    wire [31:0] outwire;
    assign outwire[7:0] = (addr > 2**16-1) ? 0 : ram[addr];
    assign outwire[15:8] = (addr + 1 > 2**16-1) ? 0 : ram[addr + 1];
    assign outwire[23:16] = (addr + 2 > 2**16-1) ? 0 : ram[addr + 2];
    assign outwire[31:24] = (addr + 3 > 2**16-1) ? 0 : ram[addr + 3];
    /*
    always @(negedge Rclk) begin
        outreg[7:0] <= (addr > 2**16-1) ? 0 : ram[addr];
        outreg[15:8] <= (addr + 1 > 2**16-1) ? 0 : ram[addr + 1];
        outreg[23:16] <= (addr + 2 > 2**16-1) ? 0 : ram[addr + 2];
        outreg[31:24] <= (addr + 3 > 2**16-1) ? 0 : ram[addr + 3];
        //$display("read %h at Instr %d", outreg, addr);
    end
    */
    assign we_W_T = 
                MemOp == 3'b000 ? ((we == 1) ? 4'b0001 : 4'd0000) :
                MemOp == 3'b001 ? ((we == 1) ? 4'b0011 : 4'd0000) :
                MemOp == 3'b010 ? ((we == 1) ? 4'b1111 : 4'd0000) :
                MemOp == 3'b100 ? (4'd0000) :
                MemOp == 3'b101 ? (4'd0000) :
                0;
    always @(posedge Wclk) begin
        /* verilator lint_off CMPCONST */
        if (we && addr <= 2**16-1 && we_W_T[0] == 1) ram[addr] <= datain[7:0];
        if (we && addr + 1 <= 2**16-1 && we_W_T[1] == 1) ram[addr + 1] <= datain[15:8];
        if (we && addr + 2 <= 2**16-1 && we_W_T[2] == 1) ram[addr + 2] <= datain[23:16];
        if (we && addr + 3 <= 2**16-1 && we_W_T[3] == 1) ram[addr + 3] <= datain[31:24];
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
    input [15:0] addr,      
    input we
);
// Add your code here
    wire [3:0] we_W_T;
    reg [31:0] outreg;
    wire [31:0] out_valid_w;
    (* ram_style="block" *) reg [7:0] ram [2**10-1:0];
    wire [31:0] outwire;
    assign outwire[7:0] = (addr > 2**16-1) ? 0 : ram[addr];
    assign outwire[15:8] = (addr + 1 > 2**16-1) ? 0 : ram[addr + 1];
    assign outwire[23:16] = (addr + 2 > 2**16-1) ? 0 : ram[addr + 2];
    assign outwire[31:24] = (addr + 3 > 2**16-1) ? 0 : ram[addr + 3];
    /*
    always @(negedge Rclk) begin
        outreg[7:0] <= (addr > 2**16-1) ? 0 : ram[addr];
        outreg[15:8] <= (addr + 1 > 2**16-1) ? 0 : ram[addr + 1];
        outreg[23:16] <= (addr + 2 > 2**16-1) ? 0 : ram[addr + 2];
        outreg[31:24] <= (addr + 3 > 2**16-1) ? 0 : ram[addr + 3];
        //$display("read Data %h from %h", outreg, addr);
    end*/
    assign we_W_T = 
                MemOp == 3'b000 ? ((we == 1) ? 4'b0001 : 4'd0000) :
                MemOp == 3'b001 ? ((we == 1) ? 4'b0011 : 4'd0000) :
                MemOp == 3'b010 ? ((we == 1) ? 4'b1111 : 4'd0000) :
                MemOp == 3'b100 ? (4'd0000) :
                MemOp == 3'b101 ? (4'd0000) :
                0;
    always @(posedge Wclk) begin
        /* verilator lint_off CMPCONST */
        if (we && addr <= 2**16-1 && we_W_T[0] == 1) begin 
            ram[addr] <= datain[7:0];
            //$display("write %h to %h", datain[7:0], addr);
        end
        if (we && addr + 1 <= 2**16-1 && we_W_T[1] == 1) begin 
            ram[addr + 1] <= datain[15:8];
            //$display("write %h to %h", datain[15:8], addr + 1);
        end
        if (we && addr + 2 <= 2**16-1 && we_W_T[2] == 1) begin 
            ram[addr + 2] <= datain[23:16];
            //$display("write %h to %h", datain[23:16], addr + 2);
        end
        if (we && addr + 3 <= 2**16-1 && we_W_T[3] == 1) begin 
            ram[addr + 3] <= datain[31:24];
            //$display("write %h to %h", datain[31:24], addr + 3);
        end
        //if(we) $display("write 0x%h to 0x%h", datain, addr);
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