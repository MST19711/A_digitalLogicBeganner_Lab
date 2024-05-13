`timescale 1ns / 1ps

module mem8b(
   output reg [7:0] dataout,   //???????
   input cs,                   //????????????��????��????��??????????
   input clk,                   //??????
   input we,                   //?��??��????????????????��??????
   input [7:0] datain,        //??????????
   input [15:0] addr,           //16��?��????????��????64KB
   input rst,
   output out_valid
);
   (* ram_style=" distributed " *) reg [7:0] ram [2**16-1:0];  //????????RAM????��??
// Add your code here
   reg [31:0] rstcnt = 0;
   reg out_valid_R = 1;
   assign out_valid = out_valid_R;
   always @(posedge clk) begin
      dataout <= ram[addr];
   end
   always @(negedge clk) begin
      if(rst != 1 && rstcnt == 0) begin
         out_valid_R <= 1;
         ram[addr] <= (cs == 1 && we == 1) ? datain : ram[addr];
      end else if (rst == 1 && rstcnt == 0) begin
         out_valid_R <= 0;
         ram[rstcnt] <= 0;
         rstcnt <= rstcnt + 1;
      end else if(rstcnt < 2**16) begin
         out_valid_R <= 0;
         ram[rstcnt] <= 0;
         rstcnt <= rstcnt + 1;
      end else if (rstcnt == 2**16) begin
         rstcnt <= 0;
         out_valid_R <= 1;
      end
   end
endmodule
