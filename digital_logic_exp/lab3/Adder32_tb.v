`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/17 22:02:27
// Design Name: 
// Module Name: Adder32_tb
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


module Adder32_tb(    );
  parameter N = 32;      // Operand widths
  reg [N-1:0] A, B;
  reg CIN;
  wire [N-1:0] S;
  wire COUT;
  wire OF,SF,ZF,CF;
  integer i, errors;
  reg xpectCF,xpectOF;
  reg [N-1:0] xpectS;
  
   Adder32 adder_inst(.f(S),.OF(OF),.SF(SF),.ZF(ZF),.CF(CF),.cout(COUT),.x(A),.y(B),.sub(CIN));
  task checkadd;
    begin
      //$display("%d,%d,%d,%d,%d,%d,%d,%d", CIN, A, B, S, OF, SF, ZF, CF);
       {xpectCF,xpectS} = (CIN ? (A-B):(A+B));         
      if ( (xpectCF!==CF) || (xpectS!==S) ) begin
        errors = errors + 1;
        $display("ERROR: CIN,A,B = %1b,%8h,%8h, CF,S = %1b,%8h, should be %1b,%8h, OF,SF,ZF,COUT=%1b, %1b, %1b, %1b." ,
                 CIN, A, B, CF, S, xpectCF, xpectS ,OF,SF,ZF,COUT);
      end
      if ((B==A) && (CIN==1)&&(ZF==0 )) begin
        errors = errors + 1;
        $display("ERROR: CIN,A,B = %1b,%8h,%8h, CF,S = %1b,%8h, should be %1b,%8h, OF,SF,ZF,COUT=%1b, %1b, %1b, %1b." ,
                 CIN, A, B, CF, S, xpectCF, xpectS ,OF,SF,ZF,COUT);
      end
      if(CIN) xpectOF=(~B[N-1]&A[N-1]&~S[N-1]) |(~A[N-1]&B[N-1]&S[N-1]); 
       else   xpectOF=(B[N-1]&A[N-1]&~S[N-1]) |(~A[N-1]&~B[N-1]&S[N-1]);
      if (xpectOF!=OF) begin
        errors = errors + 1;
        $display("ERROR: CIN,A,B = %1b,%8h,%8h, CF,S = %1b,%8h, should be %1b,%8h, OF,SF,ZF,COUT=%1b, %1b, %1b, %1b." ,
                 CIN, A, B, CF, S, xpectCF, xpectS ,OF,SF,ZF,COUT);
      end
    end
  endtask
  integer SEED;
  initial begin
    SEED = $time;
    $dumpfile("Adder32_tb.vcd");
    $dumpvars(0, Adder32_tb);
    errors = 0;
    A = $random(SEED);                           
   for (i=0; i<10000; i=i+1) begin          
          B = ~A; CIN = 0;  #10 ; checkadd;  
          B = ~A; CIN = 1;  #10 ; checkadd;     
          B = A;  CIN = 1;  #10 ; checkadd;    
          A = $random; B= $random;                          
          CIN = 0; #10 ; checkadd;     
          CIN = 1; #10 ; checkadd;        
    end
    $display("Adder32 test done. Errors: %0d .", errors);
    $stop(1);
  end

endmodule
