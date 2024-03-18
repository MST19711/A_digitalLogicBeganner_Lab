module chose_2to1(
      input a,// 0
      input b,// 1
      input c,
      output o
);
      assign o = (~c & a) | (c & b);
endmodule
