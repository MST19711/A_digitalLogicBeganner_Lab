`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/09 21:28:19
// Design Name: 
// Module Name: hamming7check_tb
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


module hamming16check_tb(   );

  wire [15:1] DC;//纠错输出 7 位正确的结果
  wire NOERROR;//校验结果正确标志位
  wire [3:0] ERR_adr;//错误位地址
  wire [6:0] O_seg;//7 段数据
  wire [7:0] O_led;//数码管选择
  wire [15:1] DU;//输入 7 位汉明码

  reg DI;

  integer nib, i, errors;

hamming16check hamming16check_tst (
  .DC(DC), 
  .NOERROR(NOERROR), 
  .O_seg(O_seg), 
  .O_led(O_led), 
  .DU(DU)
);

  reg [7:0] DATA;
  reg [16:1] DU_in;
  assign DU = DU_in;
initial begin
    $dumpfile("hamming16check_wave.vcd");        
    $dumpvars(0, hamming16check_tb);   
  errors = 0;
  for (nib=0; nib<=255; nib=nib+1) begin
    DATA[7:0] = nib;
    DU_in[3] = DATA[0];
    DU_in[5] = DATA[1];
    DU_in[6] = DATA[2];
    DU_in[7] = DATA[3];
    DU_in[9] = DATA[4];
    DU_in[10] = DATA[5];
    DU_in[11] = DATA[6];
    DU_in[12] = DATA[7];
    DU_in[13] = 1'b0;
    DU_in[14] = 1'b0;
    DU_in[15] = 1'b0;

    DU_in[1] = DU_in[3] ^ DU_in[5] ^ DU_in[7] ^ DU_in[9] ^ DU_in[11] ^ DU_in[13] ^ DU_in[15];
    DU_in[2] = DU_in[3] ^ DU_in[6] ^ DU_in[7] ^ DU_in[10] ^ DU_in[11] ^ DU_in[14] ^ DU_in[15];
    DU_in[4] = DU_in[5] ^ DU_in[6] ^ DU_in[7] ^ DU_in[12] ^ DU_in[13] ^ DU_in[14] ^ DU_in[15];
    DU_in[8] = DU_in[9] ^ DU_in[10] ^ DU_in[11] ^ DU_in[12] ^ DU_in[13] ^ DU_in[14] ^ DU_in[15];
    #2
    if ((DC!=DU_in) || (NOERROR!=1'b1)) begin
      errors = errors + 1;
      $display("Error, DU=%b, DC=%b, NOERR=%b",DU,DC,NOERROR);
    end
    for (i=1; i<=3; i=i+1) begin      // Insert error in each bit position
      DI = DU_in[i]; DU_in[i] = ~DI; #2 ;  // and check that it's corrected
        if ((DC!=DU_in) || (NOERROR!=1'b0)) begin
          errors = errors + 1;
          $display("Error, DU=%b, DC=%b, NOERR=%b",DU,DC,NOERROR);
        end
      DU_in[i] = DI;
    end
  end
  $display("Test completed, %0d errors",errors);
  $stop(1); $fflush;
end     
endmodule
