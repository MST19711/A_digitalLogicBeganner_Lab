module seg(
  input clk,
  input rst,
  input [31:0]num,
  output [7:0] o_seg0,
  output [7:0] o_seg1,
  output [7:0] o_seg2,
  output [7:0] o_seg3,
  output [7:0] o_seg4,
  output [7:0] o_seg5,
  output [7:0] o_seg6,
  output [7:0] o_seg7
);

wire [7:0] segs [7:0];
reg [7:0] segsw [7:0];
assign segs = segsw;
/*
assign segs[0] = 8'b11111101;
assign segs[1] = 8'b01100000;
assign segs[2] = 8'b11011010;
assign segs[3] = 8'b11110010;
assign segs[4] = 8'b01100110;
assign segs[5] = 8'b10110110;
assign segs[6] = 8'b10111110;
assign segs[7] = 8'b11100000;
*/
parameter CLK_NUM = 5000000;

reg [31:0] count;
reg [2:0] offset;
reg [3:0] digit[7:0];

  always @(posedge clk) begin
    digit[0] = num[3:0]; // s is 00 -->0 ;  digit gets assigned 4 bit value assigned to x[3:0]
    digit[1] = num[7:4]; // s is 01 -->1 ;  digit gets assigned 4 bit value assigned to x[7:4]
    digit[2] = num[11:8]; // s is 10 -->2 ;  digit gets assigned 4 bit value assigned to x[11:8
    digit[3] = num[15:12]; // s is 11 -->3 ;  digit gets assigned 4 bit value assigned to x[15:12]
    digit[4] = num[19:16]; // s is 00 -->0 ;  digit gets assigned 4 bit value assigned to x[3:0]
    digit[5] = num[23:20]; // s is 01 -->1 ;  digit gets assigned 4 bit value assigned to x[7:4]
    digit[6] = num[27:24]; // s is 10 -->2 ;  digit gets assigned 4 bit value assigned to x[11:8
    digit[7] = num[31:28]; // s is 11 -->3 ;  digit gets assigned 4 bit value assigned to x[15:12]
  end
  generate
    genvar i;
    for(i = 0; i < 8; i ++)begin
      always @(posedge clk) begin
        case(digit[i])
          0:segsw[i] <= 8'b11111100;////0000												  	
          1:segsw[i] <= 8'b01100000;////0001									
          2:segsw[i] <= 8'b11011010;////0010												                                                                    __	
          3:segsw[i] <= 8'b11110010;////0011										
          4:segsw[i] <= 8'b01100110;////0100										 
          5:segsw[i] <= 8'b10110110;////0101                                       
          6:segsw[i] <= 8'b10111110;////0110
          7:segsw[i] <= 8'b11100000;////0111
          8:segsw[i] <= 8'b11111110;////1000
          9:segsw[i] <= 8'b11110110;////1001
          'hA:segsw[i] <= 8'b11101110; 
          'hB:segsw[i] <= 8'b00111110; 
          'hC:segsw[i] <= 8'b10011100;
          'hD:segsw[i] <= 8'b01111010;
          'hE:segsw[i] <= 8'b10011110;
          'hF:segsw[i] <= 8'b10001110;
          default: segsw[i] <= 8'b00000000; // U
        endcase
      end
    end
  endgenerate
  assign o_seg0 = ~segs[offset + 3'd0];
  assign o_seg1 = ~segs[offset + 3'd1];
  assign o_seg2 = ~segs[offset + 3'd2];
  assign o_seg3 = ~segs[offset + 3'd3];
  assign o_seg4 = ~segs[offset + 3'd4];
  assign o_seg5 = ~segs[offset + 3'd5];
  assign o_seg6 = ~segs[offset + 3'd6];
  assign o_seg7 = ~segs[offset + 3'd7];
endmodule
