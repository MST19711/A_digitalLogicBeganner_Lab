`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/16 20:17:44
// Design Name: 
// Module Name: regfile32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module regfile32(
   output  [31:0] busa,
   output  [31:0] busb,
   input [31:0] busw,
   input [4:0] ra,
   input [4:0] rb,
   input [4:0] rw,
   input clk, we
);
// add your code 
   reg [31:0] GPRs [0:31];
   wire [31:0] GPR_OUTPUT [0:31];
   genvar i; 
   generate
      for (i = 0; i < 32; i = i + 1)begin 
         assign GPR_OUTPUT[i] = GPRs[i]; 
      end 
   endgenerate 
   assign busa = GPR_OUTPUT[ra];
   assign busb = GPR_OUTPUT[rb];
   always@(negedge clk) begin
      GPRs[rw] <= (we == 1) ? ((rw == 0) ? 32'b0000000000000000 : busw): GPRs[rw];
   end
endmodule

