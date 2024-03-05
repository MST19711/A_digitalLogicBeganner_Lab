`timescale 1ns / 1ps
module showstudentID_tb();
    reg timer = 0;
    wire T;
    wire [6:0] seg;
    wire [7:0] cled;
    assign T = timer;
    showstudentID test(
      .clock_sig(T),
      .SEG(seg),
      .choseLED(cled)
    );
    integer i;
    initial begin
      $dumpfile("showstudentID.vcd");
      $dumpvars(0, showstudentID_tb);
      for(i = 0; i <= 20005; i = i + 1)begin
        timer = ~timer;
        #20;
      end
    end
endmodule