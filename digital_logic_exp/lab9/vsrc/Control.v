`timescale 1ns / 1ps

module Control(
    output reg [2:0] ExtOp,
    output reg RegWr,
    output reg ALUASrc,
    output reg [1:0] ALUBSrc,
    output reg [3:0] ALUctr,
    output reg [2:0] Branch,
    output reg MemtoReg,
    output reg MemWr,
    output reg [2:0] MemOp,
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7    
);
/* verilator lint_off LATCH */
    always@(*) begin
/* verilator lint_on LATCH */
        case(opcode)
            7'b0110111: begin
                ExtOp = 3'b001;
                RegWr = 1'b1;
                ALUBSrc = 2'b10;
                ALUctr = 4'b1111;
                Branch = 3'b000;
                MemtoReg = 1'b0;
                MemWr = 1'b0;
            end
            7'b0010111: begin
                ExtOp = 3'b001;
                RegWr = 1'b1;
                ALUASrc = 1'b1;
                ALUBSrc = 2'b10;
                ALUctr = 4'b0000;
                Branch = 3'b000;
                MemtoReg = 1'b0;
                MemWr = 1'b0;
            end
            7'b0010011: begin
                ExtOp = 3'b000;
                RegWr = 1'b1;
                ALUASrc = 1'b0;
                ALUBSrc = 2'b10;
                ALUctr = {(funct3 == 3'b101) ? funct7[5] : 1'b0, funct3};
                Branch = 3'b000;
                MemtoReg = 1'b0;
                MemWr = 1'b0;
            end
            7'b0110011: begin
                // ExtOp = 3'b000;
                RegWr = 1'b1;
                ALUASrc = 1'b0;
                ALUBSrc = 2'b00;
                ALUctr = {funct7[5], funct3};
                Branch = 3'b000;
                MemtoReg = 1'b0;
                MemWr = 1'b0;
                // MemOp = 1'b0;
            end
            7'b1101111: begin
                ExtOp = 3'b100;
                RegWr = 1'b1;
                ALUASrc = 1'b1;
                ALUBSrc = 2'b01;
                ALUctr = 4'b0000;
                Branch = 3'b001;
                MemtoReg = 1'b0;
                MemWr = 1'b0;
                // MemOp = 1'b0;
            end
            7'b1100111: begin
                ExtOp = 3'b000;
                RegWr = 1'b1;
                ALUASrc = 1'b1;
                ALUBSrc = 2'b01;
                ALUctr = 4'b0000;
                Branch = 3'b010;
                MemtoReg = 1'b0;
                MemWr = 1'b0;
                // MemOp = 0;
            end
            7'b1100011: begin
                ExtOp = 3'b011;
                RegWr = 1'b0;
                ALUASrc = 1'b0;
                ALUBSrc = 2'b00;
                ALUctr = {3'b001, funct3[1]};
                Branch = {1'b1, funct3[2], funct3[0]};
                // MemtoReg = 1'b0;
                MemWr = 1'b0;
                // MemOp = 0;
            end
            7'b0000011: begin
                ExtOp = 3'b000;
                RegWr = 1'b1;
                ALUASrc = 1'b0;
                ALUBSrc = 2'b10;
                ALUctr = 4'b0000;
                Branch = 3'b000;
                MemtoReg = 1'b1;
                MemWr = 1'b0;
                MemOp = funct3;
            end
            7'b0100011: begin
                ExtOp = 3'b010;
                RegWr = 1'b0;
                ALUASrc = 1'b0;
                ALUBSrc = 2'b10;
                ALUctr = 4'b0000;
                Branch = 3'b000;
                // MemtoReg = 1'b1;
                MemWr = 1'b1;
                MemOp = funct3;
            end
            default: begin
                ExtOp = 3'b000;
                RegWr = 1'b0;
                ALUASrc = 1'b0;
                ALUBSrc = 2'b00;
                ALUctr = 4'b0000;
                Branch = 3'b000;
                MemtoReg = 1'b0;
                MemWr = 1'b0;
                MemOp = 0;
            end
        endcase
    end
endmodule
