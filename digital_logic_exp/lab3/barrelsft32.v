`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/17 22:02:49
// Design Name: 
// Module Name: barrelsft32
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

module chose_2to1(
      input a,// 0
      input b,// 1
      input c,
      output o
);
      assign o = (~c & a) | (c & b);
endmodule

module shift_left(
    output [31:0] dout,
    input [31:0] din,
    input [4:0] shamt
);
    wire [31:0] l2;
    wire [31:0] l4;
    wire [31:0] l8;
    wire [31:0] l16;
    /*
    ```python3
        j = 1
        for i in range(0, 32):
            shift_l = ''
            if i - j < 0:
                shift_l = '1\'b0'
            else:
                shift_l = "din[" + str(i-j) + "]"
            print("chose_2to1 l2_" + str(i) + "(")
            print("    .a(din[" + str(i) + "]),")
            print("    .b(" + shift_l + "),")
            print("    .c(shamt[0]),")
            print("    .o(l2["  + str(i) + "])")
            print(");")

        j = 2
        for i in range(0, 32):
            shift_l = ''
            if i - j < 0:
                shift_l = '1\'b0'
            else:
                shift_l = "l2[" + str(i-j) + "]"
            print("chose_2to1 l4_" + str(i) + "(")
            print("    .a(l2[" + str(i) + "]),")
            print("    .b(" + shift_l + "),")
            print("    .c(shamt[1]),")
            print("    .o(l4["  + str(i) + "])")
            print(");")

        j = 4
        for i in range(0, 32):
            shift_l = ''
            if i - j < 0:
                shift_l = '1\'b0'
            else:
                shift_l = "l4[" + str(i-j) + "]"
            print("chose_2to1 l8_" + str(i) + "(")
            print("    .a(l4[" + str(i) + "]),")
            print("    .b(" + shift_l + "),")
            print("    .c(shamt[2]),")
            print("    .o(l8["  + str(i) + "])")
            print(");")

        j = 8
        for i in range(0, 32):
            shift_l = ''
            if i - j < 0:
                shift_l = '1\'b0'
            else:
                shift_l = "l8[" + str(i-j) + "]"
            print("chose_2to1 l16_" + str(i) + "(")
            print("    .a(l8[" + str(i) + "]),")
            print("    .b(" + shift_l + "),")
            print("    .c(shamt[3]),")
            print("    .o(l16["  + str(i) + "])")
            print(");")

        j = 16
        for i in range(0, 32):
            shift_l = ''
            if i - j < 0:
                shift_l = '1\'b0'
            else:
                shift_l = "l16[" + str(i-j) + "]"
            print("chose_2to1 l32_" + str(i) + "(")
            print("    .a(l16[" + str(i) + "]),")
            print("    .b(" + shift_l + "),")
            print("    .c(shamt[4]),")
            print("    .o(dout["  + str(i) + "])")
            print(");")
    ```
    */
    chose_2to1 l2_0(
        .a(din[0]),
        .b(1'b0),
        .c(shamt[0]),
        .o(l2[0])
    );
    chose_2to1 l2_1(
        .a(din[1]),
        .b(din[0]),
        .c(shamt[0]),
        .o(l2[1])
    );
    chose_2to1 l2_2(
        .a(din[2]),
        .b(din[1]),
        .c(shamt[0]),
        .o(l2[2])
    );
    chose_2to1 l2_3(
        .a(din[3]),
        .b(din[2]),
        .c(shamt[0]),
        .o(l2[3])
    );
    chose_2to1 l2_4(
        .a(din[4]),
        .b(din[3]),
        .c(shamt[0]),
        .o(l2[4])
    );
    chose_2to1 l2_5(
        .a(din[5]),
        .b(din[4]),
        .c(shamt[0]),
        .o(l2[5])
    );
    chose_2to1 l2_6(
        .a(din[6]),
        .b(din[5]),
        .c(shamt[0]),
        .o(l2[6])
    );
    chose_2to1 l2_7(
        .a(din[7]),
        .b(din[6]),
        .c(shamt[0]),
        .o(l2[7])
    );
    chose_2to1 l2_8(
        .a(din[8]),
        .b(din[7]),
        .c(shamt[0]),
        .o(l2[8])
    );
    chose_2to1 l2_9(
        .a(din[9]),
        .b(din[8]),
        .c(shamt[0]),
        .o(l2[9])
    );
    chose_2to1 l2_10(
        .a(din[10]),
        .b(din[9]),
        .c(shamt[0]),
        .o(l2[10])
    );
    chose_2to1 l2_11(
        .a(din[11]),
        .b(din[10]),
        .c(shamt[0]),
        .o(l2[11])
    );
    chose_2to1 l2_12(
        .a(din[12]),
        .b(din[11]),
        .c(shamt[0]),
        .o(l2[12])
    );
    chose_2to1 l2_13(
        .a(din[13]),
        .b(din[12]),
        .c(shamt[0]),
        .o(l2[13])
    );
    chose_2to1 l2_14(
        .a(din[14]),
        .b(din[13]),
        .c(shamt[0]),
        .o(l2[14])
    );
    chose_2to1 l2_15(
        .a(din[15]),
        .b(din[14]),
        .c(shamt[0]),
        .o(l2[15])
    );
    chose_2to1 l2_16(
        .a(din[16]),
        .b(din[15]),
        .c(shamt[0]),
        .o(l2[16])
    );
    chose_2to1 l2_17(
        .a(din[17]),
        .b(din[16]),
        .c(shamt[0]),
        .o(l2[17])
    );
    chose_2to1 l2_18(
        .a(din[18]),
        .b(din[17]),
        .c(shamt[0]),
        .o(l2[18])
    );
    chose_2to1 l2_19(
        .a(din[19]),
        .b(din[18]),
        .c(shamt[0]),
        .o(l2[19])
    );
    chose_2to1 l2_20(
        .a(din[20]),
        .b(din[19]),
        .c(shamt[0]),
        .o(l2[20])
    );
    chose_2to1 l2_21(
        .a(din[21]),
        .b(din[20]),
        .c(shamt[0]),
        .o(l2[21])
    );
    chose_2to1 l2_22(
        .a(din[22]),
        .b(din[21]),
        .c(shamt[0]),
        .o(l2[22])
    );
    chose_2to1 l2_23(
        .a(din[23]),
        .b(din[22]),
        .c(shamt[0]),
        .o(l2[23])
    );
    chose_2to1 l2_24(
        .a(din[24]),
        .b(din[23]),
        .c(shamt[0]),
        .o(l2[24])
    );
    chose_2to1 l2_25(
        .a(din[25]),
        .b(din[24]),
        .c(shamt[0]),
        .o(l2[25])
    );
    chose_2to1 l2_26(
        .a(din[26]),
        .b(din[25]),
        .c(shamt[0]),
        .o(l2[26])
    );
    chose_2to1 l2_27(
        .a(din[27]),
        .b(din[26]),
        .c(shamt[0]),
        .o(l2[27])
    );
    chose_2to1 l2_28(
        .a(din[28]),
        .b(din[27]),
        .c(shamt[0]),
        .o(l2[28])
    );
    chose_2to1 l2_29(
        .a(din[29]),
        .b(din[28]),
        .c(shamt[0]),
        .o(l2[29])
    );
    chose_2to1 l2_30(
        .a(din[30]),
        .b(din[29]),
        .c(shamt[0]),
        .o(l2[30])
    );
    chose_2to1 l2_31(
        .a(din[31]),
        .b(din[30]),
        .c(shamt[0]),
        .o(l2[31])
    );
    chose_2to1 l4_0(
        .a(l2[0]),
        .b(1'b0),
        .c(shamt[1]),
        .o(l4[0])
    );
    chose_2to1 l4_1(
        .a(l2[1]),
        .b(1'b0),
        .c(shamt[1]),
        .o(l4[1])
    );
    chose_2to1 l4_2(
        .a(l2[2]),
        .b(l2[0]),
        .c(shamt[1]),
        .o(l4[2])
    );
    chose_2to1 l4_3(
        .a(l2[3]),
        .b(l2[1]),
        .c(shamt[1]),
        .o(l4[3])
    );
    chose_2to1 l4_4(
        .a(l2[4]),
        .b(l2[2]),
        .c(shamt[1]),
        .o(l4[4])
    );
    chose_2to1 l4_5(
        .a(l2[5]),
        .b(l2[3]),
        .c(shamt[1]),
        .o(l4[5])
    );
    chose_2to1 l4_6(
        .a(l2[6]),
        .b(l2[4]),
        .c(shamt[1]),
        .o(l4[6])
    );
    chose_2to1 l4_7(
        .a(l2[7]),
        .b(l2[5]),
        .c(shamt[1]),
        .o(l4[7])
    );
    chose_2to1 l4_8(
        .a(l2[8]),
        .b(l2[6]),
        .c(shamt[1]),
        .o(l4[8])
    );
    chose_2to1 l4_9(
        .a(l2[9]),
        .b(l2[7]),
        .c(shamt[1]),
        .o(l4[9])
    );
    chose_2to1 l4_10(
        .a(l2[10]),
        .b(l2[8]),
        .c(shamt[1]),
        .o(l4[10])
    );
    chose_2to1 l4_11(
        .a(l2[11]),
        .b(l2[9]),
        .c(shamt[1]),
        .o(l4[11])
    );
    chose_2to1 l4_12(
        .a(l2[12]),
        .b(l2[10]),
        .c(shamt[1]),
        .o(l4[12])
    );
    chose_2to1 l4_13(
        .a(l2[13]),
        .b(l2[11]),
        .c(shamt[1]),
        .o(l4[13])
    );
    chose_2to1 l4_14(
        .a(l2[14]),
        .b(l2[12]),
        .c(shamt[1]),
        .o(l4[14])
    );
    chose_2to1 l4_15(
        .a(l2[15]),
        .b(l2[13]),
        .c(shamt[1]),
        .o(l4[15])
    );
    chose_2to1 l4_16(
        .a(l2[16]),
        .b(l2[14]),
        .c(shamt[1]),
        .o(l4[16])
    );
    chose_2to1 l4_17(
        .a(l2[17]),
        .b(l2[15]),
        .c(shamt[1]),
        .o(l4[17])
    );
    chose_2to1 l4_18(
        .a(l2[18]),
        .b(l2[16]),
        .c(shamt[1]),
        .o(l4[18])
    );
    chose_2to1 l4_19(
        .a(l2[19]),
        .b(l2[17]),
        .c(shamt[1]),
        .o(l4[19])
    );
    chose_2to1 l4_20(
        .a(l2[20]),
        .b(l2[18]),
        .c(shamt[1]),
        .o(l4[20])
    );
    chose_2to1 l4_21(
        .a(l2[21]),
        .b(l2[19]),
        .c(shamt[1]),
        .o(l4[21])
    );
    chose_2to1 l4_22(
        .a(l2[22]),
        .b(l2[20]),
        .c(shamt[1]),
        .o(l4[22])
    );
    chose_2to1 l4_23(
        .a(l2[23]),
        .b(l2[21]),
        .c(shamt[1]),
        .o(l4[23])
    );
    chose_2to1 l4_24(
        .a(l2[24]),
        .b(l2[22]),
        .c(shamt[1]),
        .o(l4[24])
    );
    chose_2to1 l4_25(
        .a(l2[25]),
        .b(l2[23]),
        .c(shamt[1]),
        .o(l4[25])
    );
    chose_2to1 l4_26(
        .a(l2[26]),
        .b(l2[24]),
        .c(shamt[1]),
        .o(l4[26])
    );
    chose_2to1 l4_27(
        .a(l2[27]),
        .b(l2[25]),
        .c(shamt[1]),
        .o(l4[27])
    );
    chose_2to1 l4_28(
        .a(l2[28]),
        .b(l2[26]),
        .c(shamt[1]),
        .o(l4[28])
    );
    chose_2to1 l4_29(
        .a(l2[29]),
        .b(l2[27]),
        .c(shamt[1]),
        .o(l4[29])
    );
    chose_2to1 l4_30(
        .a(l2[30]),
        .b(l2[28]),
        .c(shamt[1]),
        .o(l4[30])
    );
    chose_2to1 l4_31(
        .a(l2[31]),
        .b(l2[29]),
        .c(shamt[1]),
        .o(l4[31])
    );
    chose_2to1 l8_0(
        .a(l4[0]),
        .b(1'b0),
        .c(shamt[2]),
        .o(l8[0])
    );
    chose_2to1 l8_1(
        .a(l4[1]),
        .b(1'b0),
        .c(shamt[2]),
        .o(l8[1])
    );
    chose_2to1 l8_2(
        .a(l4[2]),
        .b(1'b0),
        .c(shamt[2]),
        .o(l8[2])
    );
    chose_2to1 l8_3(
        .a(l4[3]),
        .b(1'b0),
        .c(shamt[2]),
        .o(l8[3])
    );
    chose_2to1 l8_4(
        .a(l4[4]),
        .b(l4[0]),
        .c(shamt[2]),
        .o(l8[4])
    );
    chose_2to1 l8_5(
        .a(l4[5]),
        .b(l4[1]),
        .c(shamt[2]),
        .o(l8[5])
    );
    chose_2to1 l8_6(
        .a(l4[6]),
        .b(l4[2]),
        .c(shamt[2]),
        .o(l8[6])
    );
    chose_2to1 l8_7(
        .a(l4[7]),
        .b(l4[3]),
        .c(shamt[2]),
        .o(l8[7])
    );
    chose_2to1 l8_8(
        .a(l4[8]),
        .b(l4[4]),
        .c(shamt[2]),
        .o(l8[8])
    );
    chose_2to1 l8_9(
        .a(l4[9]),
        .b(l4[5]),
        .c(shamt[2]),
        .o(l8[9])
    );
    chose_2to1 l8_10(
        .a(l4[10]),
        .b(l4[6]),
        .c(shamt[2]),
        .o(l8[10])
    );
    chose_2to1 l8_11(
        .a(l4[11]),
        .b(l4[7]),
        .c(shamt[2]),
        .o(l8[11])
    );
    chose_2to1 l8_12(
        .a(l4[12]),
        .b(l4[8]),
        .c(shamt[2]),
        .o(l8[12])
    );
    chose_2to1 l8_13(
        .a(l4[13]),
        .b(l4[9]),
        .c(shamt[2]),
        .o(l8[13])
    );
    chose_2to1 l8_14(
        .a(l4[14]),
        .b(l4[10]),
        .c(shamt[2]),
        .o(l8[14])
    );
    chose_2to1 l8_15(
        .a(l4[15]),
        .b(l4[11]),
        .c(shamt[2]),
        .o(l8[15])
    );
    chose_2to1 l8_16(
        .a(l4[16]),
        .b(l4[12]),
        .c(shamt[2]),
        .o(l8[16])
    );
    chose_2to1 l8_17(
        .a(l4[17]),
        .b(l4[13]),
        .c(shamt[2]),
        .o(l8[17])
    );
    chose_2to1 l8_18(
        .a(l4[18]),
        .b(l4[14]),
        .c(shamt[2]),
        .o(l8[18])
    );
    chose_2to1 l8_19(
        .a(l4[19]),
        .b(l4[15]),
        .c(shamt[2]),
        .o(l8[19])
    );
    chose_2to1 l8_20(
        .a(l4[20]),
        .b(l4[16]),
        .c(shamt[2]),
        .o(l8[20])
    );
    chose_2to1 l8_21(
        .a(l4[21]),
        .b(l4[17]),
        .c(shamt[2]),
        .o(l8[21])
    );
    chose_2to1 l8_22(
        .a(l4[22]),
        .b(l4[18]),
        .c(shamt[2]),
        .o(l8[22])
    );
    chose_2to1 l8_23(
        .a(l4[23]),
        .b(l4[19]),
        .c(shamt[2]),
        .o(l8[23])
    );
    chose_2to1 l8_24(
        .a(l4[24]),
        .b(l4[20]),
        .c(shamt[2]),
        .o(l8[24])
    );
    chose_2to1 l8_25(
        .a(l4[25]),
        .b(l4[21]),
        .c(shamt[2]),
        .o(l8[25])
    );
    chose_2to1 l8_26(
        .a(l4[26]),
        .b(l4[22]),
        .c(shamt[2]),
        .o(l8[26])
    );
    chose_2to1 l8_27(
        .a(l4[27]),
        .b(l4[23]),
        .c(shamt[2]),
        .o(l8[27])
    );
    chose_2to1 l8_28(
        .a(l4[28]),
        .b(l4[24]),
        .c(shamt[2]),
        .o(l8[28])
    );
    chose_2to1 l8_29(
        .a(l4[29]),
        .b(l4[25]),
        .c(shamt[2]),
        .o(l8[29])
    );
    chose_2to1 l8_30(
        .a(l4[30]),
        .b(l4[26]),
        .c(shamt[2]),
        .o(l8[30])
    );
    chose_2to1 l8_31(
        .a(l4[31]),
        .b(l4[27]),
        .c(shamt[2]),
        .o(l8[31])
    );
    chose_2to1 l16_0(
        .a(l8[0]),
        .b(1'b0),
        .c(shamt[3]),
        .o(l16[0])
    );
    chose_2to1 l16_1(
        .a(l8[1]),
        .b(1'b0),
        .c(shamt[3]),
        .o(l16[1])
    );
    chose_2to1 l16_2(
        .a(l8[2]),
        .b(1'b0),
        .c(shamt[3]),
        .o(l16[2])
    );
    chose_2to1 l16_3(
        .a(l8[3]),
        .b(1'b0),
        .c(shamt[3]),
        .o(l16[3])
    );
    chose_2to1 l16_4(
        .a(l8[4]),
        .b(1'b0),
        .c(shamt[3]),
        .o(l16[4])
    );
    chose_2to1 l16_5(
        .a(l8[5]),
        .b(1'b0),
        .c(shamt[3]),
        .o(l16[5])
    );
    chose_2to1 l16_6(
        .a(l8[6]),
        .b(1'b0),
        .c(shamt[3]),
        .o(l16[6])
    );
    chose_2to1 l16_7(
        .a(l8[7]),
        .b(1'b0),
        .c(shamt[3]),
        .o(l16[7])
    );
    chose_2to1 l16_8(
        .a(l8[8]),
        .b(l8[0]),
        .c(shamt[3]),
        .o(l16[8])
    );
    chose_2to1 l16_9(
        .a(l8[9]),
        .b(l8[1]),
        .c(shamt[3]),
        .o(l16[9])
    );
    chose_2to1 l16_10(
        .a(l8[10]),
        .b(l8[2]),
        .c(shamt[3]),
        .o(l16[10])
    );
    chose_2to1 l16_11(
        .a(l8[11]),
        .b(l8[3]),
        .c(shamt[3]),
        .o(l16[11])
    );
    chose_2to1 l16_12(
        .a(l8[12]),
        .b(l8[4]),
        .c(shamt[3]),
        .o(l16[12])
    );
    chose_2to1 l16_13(
        .a(l8[13]),
        .b(l8[5]),
        .c(shamt[3]),
        .o(l16[13])
    );
    chose_2to1 l16_14(
        .a(l8[14]),
        .b(l8[6]),
        .c(shamt[3]),
        .o(l16[14])
    );
    chose_2to1 l16_15(
        .a(l8[15]),
        .b(l8[7]),
        .c(shamt[3]),
        .o(l16[15])
    );
    chose_2to1 l16_16(
        .a(l8[16]),
        .b(l8[8]),
        .c(shamt[3]),
        .o(l16[16])
    );
    chose_2to1 l16_17(
        .a(l8[17]),
        .b(l8[9]),
        .c(shamt[3]),
        .o(l16[17])
    );
    chose_2to1 l16_18(
        .a(l8[18]),
        .b(l8[10]),
        .c(shamt[3]),
        .o(l16[18])
    );
    chose_2to1 l16_19(
        .a(l8[19]),
        .b(l8[11]),
        .c(shamt[3]),
        .o(l16[19])
    );
    chose_2to1 l16_20(
        .a(l8[20]),
        .b(l8[12]),
        .c(shamt[3]),
        .o(l16[20])
    );
    chose_2to1 l16_21(
        .a(l8[21]),
        .b(l8[13]),
        .c(shamt[3]),
        .o(l16[21])
    );
    chose_2to1 l16_22(
        .a(l8[22]),
        .b(l8[14]),
        .c(shamt[3]),
        .o(l16[22])
    );
    chose_2to1 l16_23(
        .a(l8[23]),
        .b(l8[15]),
        .c(shamt[3]),
        .o(l16[23])
    );
    chose_2to1 l16_24(
        .a(l8[24]),
        .b(l8[16]),
        .c(shamt[3]),
        .o(l16[24])
    );
    chose_2to1 l16_25(
        .a(l8[25]),
        .b(l8[17]),
        .c(shamt[3]),
        .o(l16[25])
    );
    chose_2to1 l16_26(
        .a(l8[26]),
        .b(l8[18]),
        .c(shamt[3]),
        .o(l16[26])
    );
    chose_2to1 l16_27(
        .a(l8[27]),
        .b(l8[19]),
        .c(shamt[3]),
        .o(l16[27])
    );
    chose_2to1 l16_28(
        .a(l8[28]),
        .b(l8[20]),
        .c(shamt[3]),
        .o(l16[28])
    );
    chose_2to1 l16_29(
        .a(l8[29]),
        .b(l8[21]),
        .c(shamt[3]),
        .o(l16[29])
    );
    chose_2to1 l16_30(
        .a(l8[30]),
        .b(l8[22]),
        .c(shamt[3]),
        .o(l16[30])
    );
    chose_2to1 l16_31(
        .a(l8[31]),
        .b(l8[23]),
        .c(shamt[3]),
        .o(l16[31])
    );
    chose_2to1 l32_0(
        .a(l16[0]),
        .b(1'b0),
        .c(shamt[4]),
        .o(dout[0])
    );
    chose_2to1 l32_1(
        .a(l16[1]),
        .b(1'b0),
        .c(shamt[4]),
        .o(dout[1])
    );
    chose_2to1 l32_2(
        .a(l16[2]),
        .b(1'b0),
        .c(shamt[4]),
        .o(dout[2])
    );
    chose_2to1 l32_3(
        .a(l16[3]),
        .b(1'b0),
        .c(shamt[4]),
        .o(dout[3])
    );
    chose_2to1 l32_4(
        .a(l16[4]),
        .b(1'b0),
        .c(shamt[4]),
        .o(dout[4])
    );
    chose_2to1 l32_5(
        .a(l16[5]),
        .b(1'b0),
        .c(shamt[4]),
        .o(dout[5])
    );
    chose_2to1 l32_6(
        .a(l16[6]),
        .b(1'b0),
        .c(shamt[4]),
        .o(dout[6])
    );
    chose_2to1 l32_7(
        .a(l16[7]),
        .b(1'b0),
        .c(shamt[4]),
        .o(dout[7])
    );
    chose_2to1 l32_8(
        .a(l16[8]),
        .b(1'b0),
        .c(shamt[4]),
        .o(dout[8])
    );
    chose_2to1 l32_9(
        .a(l16[9]),
        .b(1'b0),
        .c(shamt[4]),
        .o(dout[9])
    );
    chose_2to1 l32_10(
        .a(l16[10]),
        .b(1'b0),
        .c(shamt[4]),
        .o(dout[10])
    );
    chose_2to1 l32_11(
        .a(l16[11]),
        .b(1'b0),
        .c(shamt[4]),
        .o(dout[11])
    );
    chose_2to1 l32_12(
        .a(l16[12]),
        .b(1'b0),
        .c(shamt[4]),
        .o(dout[12])
    );
    chose_2to1 l32_13(
        .a(l16[13]),
        .b(1'b0),
        .c(shamt[4]),
        .o(dout[13])
    );
    chose_2to1 l32_14(
        .a(l16[14]),
        .b(1'b0),
        .c(shamt[4]),
        .o(dout[14])
    );
    chose_2to1 l32_15(
        .a(l16[15]),
        .b(1'b0),
        .c(shamt[4]),
        .o(dout[15])
    );
    chose_2to1 l32_16(
        .a(l16[16]),
        .b(l16[0]),
        .c(shamt[4]),
        .o(dout[16])
    );
    chose_2to1 l32_17(
        .a(l16[17]),
        .b(l16[1]),
        .c(shamt[4]),
        .o(dout[17])
    );
    chose_2to1 l32_18(
        .a(l16[18]),
        .b(l16[2]),
        .c(shamt[4]),
        .o(dout[18])
    );
    chose_2to1 l32_19(
        .a(l16[19]),
        .b(l16[3]),
        .c(shamt[4]),
        .o(dout[19])
    );
    chose_2to1 l32_20(
        .a(l16[20]),
        .b(l16[4]),
        .c(shamt[4]),
        .o(dout[20])
    );
    chose_2to1 l32_21(
        .a(l16[21]),
        .b(l16[5]),
        .c(shamt[4]),
        .o(dout[21])
    );
    chose_2to1 l32_22(
        .a(l16[22]),
        .b(l16[6]),
        .c(shamt[4]),
        .o(dout[22])
    );
    chose_2to1 l32_23(
        .a(l16[23]),
        .b(l16[7]),
        .c(shamt[4]),
        .o(dout[23])
    );
    chose_2to1 l32_24(
        .a(l16[24]),
        .b(l16[8]),
        .c(shamt[4]),
        .o(dout[24])
    );
    chose_2to1 l32_25(
        .a(l16[25]),
        .b(l16[9]),
        .c(shamt[4]),
        .o(dout[25])
    );
    chose_2to1 l32_26(
        .a(l16[26]),
        .b(l16[10]),
        .c(shamt[4]),
        .o(dout[26])
    );
    chose_2to1 l32_27(
        .a(l16[27]),
        .b(l16[11]),
        .c(shamt[4]),
        .o(dout[27])
    );
    chose_2to1 l32_28(
        .a(l16[28]),
        .b(l16[12]),
        .c(shamt[4]),
        .o(dout[28])
    );
    chose_2to1 l32_29(
        .a(l16[29]),
        .b(l16[13]),
        .c(shamt[4]),
        .o(dout[29])
    );
    chose_2to1 l32_30(
        .a(l16[30]),
        .b(l16[14]),
        .c(shamt[4]),
        .o(dout[30])
    );
    chose_2to1 l32_31(
        .a(l16[31]),
        .b(l16[15]),
        .c(shamt[4]),
        .o(dout[31])
    );
endmodule

module shift_right(
    output [31:0] dout,
    input [31:0] din,
    input [4:0] shamt,
    input AL
);
    wire [31:0] r2;
    wire [31:0] r4;
    wire [31:0] r8;
    wire [31:0] r16;
    /*
    ```python3
    j = 1
    for i in range(0, 32):
        shift_l = ''
        if i + j >31:
            shift_l = str("AL & din[31]")
        else:
            shift_l = "din[" + str(i+j) + "]"
        print("chose_2to1 l2_" + str(i) + "(")
        print("    .a(din[" + str(i) + "]),")
        print("    .b(" + shift_l + "),")
        print("    .c(shamt[0]),")
        print("    .o(l2["  + str(i) + "])")
        print(");")

    j = 2
    for i in range(0, 32):
        shift_l = ''
        if i + j >31:
            shift_l = str("AL & din[31]")
        else:
            shift_l = "l2[" + str(i+j) + "]"
        print("chose_2to1 l4_" + str(i) + "(")
        print("    .a(l2[" + str(i) + "]),")
        print("    .b(" + shift_l + "),")
        print("    .c(shamt[1]),")
        print("    .o(l4["  + str(i) + "])")
        print(");")

    j = 4
    for i in range(0, 32):
        shift_l = ''
        if i + j >31:
            shift_l = str("AL & din[31]")
        else:
            shift_l = "l4[" + str(i+j) + "]"
        print("chose_2to1 l8_" + str(i) + "(")
        print("    .a(l4[" + str(i) + "]),")
        print("    .b(" + shift_l + "),")
        print("    .c(shamt[2]),")
        print("    .o(l8["  + str(i) + "])")
        print(");")

    j = 8
    for i in range(0, 32):
        shift_l = ''
        if i + j >31:
            shift_l = str("AL & din[31]")
        else:
            shift_l = "l8[" + str(i+j) + "]"
        print("chose_2to1 l16_" + str(i) + "(")
        print("    .a(l8[" + str(i) + "]),")
        print("    .b(" + shift_l + "),")
        print("    .c(shamt[3]),")
        print("    .o(l16["  + str(i) + "])")
        print(");")

    j = 16
    for i in range(0, 32):
        shift_l = ''
        if i + j >31:
            shift_l = str("AL & din[31]")
        else:
            shift_l = "l16[" + str(i+j) + "]"
        print("chose_2to1 l32_" + str(i) + "(")
        print("    .a(l16[" + str(i) + "]),")
        print("    .b(" + shift_l + "),")
        print("    .c(shamt[4]),")
        print("    .o(dout["  + str(i) + "])")
        print(");")
    ```
    */
    chose_2to1 r2_0(
        .a(din[0]),
        .b(din[1]),
        .c(shamt[0]),
        .o(r2[0])
    );
    chose_2to1 r2_1(
        .a(din[1]),
        .b(din[2]),
        .c(shamt[0]),
        .o(r2[1])
    );
    chose_2to1 r2_2(
        .a(din[2]),
        .b(din[3]),
        .c(shamt[0]),
        .o(r2[2])
    );
    chose_2to1 r2_3(
        .a(din[3]),
        .b(din[4]),
        .c(shamt[0]),
        .o(r2[3])
    );
    chose_2to1 r2_4(
        .a(din[4]),
        .b(din[5]),
        .c(shamt[0]),
        .o(r2[4])
    );
    chose_2to1 r2_5(
        .a(din[5]),
        .b(din[6]),
        .c(shamt[0]),
        .o(r2[5])
    );
    chose_2to1 r2_6(
        .a(din[6]),
        .b(din[7]),
        .c(shamt[0]),
        .o(r2[6])
    );
    chose_2to1 r2_7(
        .a(din[7]),
        .b(din[8]),
        .c(shamt[0]),
        .o(r2[7])
    );
    chose_2to1 r2_8(
        .a(din[8]),
        .b(din[9]),
        .c(shamt[0]),
        .o(r2[8])
    );
    chose_2to1 r2_9(
        .a(din[9]),
        .b(din[10]),
        .c(shamt[0]),
        .o(r2[9])
    );
    chose_2to1 r2_10(
        .a(din[10]),
        .b(din[11]),
        .c(shamt[0]),
        .o(r2[10])
    );
    chose_2to1 r2_11(
        .a(din[11]),
        .b(din[12]),
        .c(shamt[0]),
        .o(r2[11])
    );
    chose_2to1 r2_12(
        .a(din[12]),
        .b(din[13]),
        .c(shamt[0]),
        .o(r2[12])
    );
    chose_2to1 r2_13(
        .a(din[13]),
        .b(din[14]),
        .c(shamt[0]),
        .o(r2[13])
    );
    chose_2to1 r2_14(
        .a(din[14]),
        .b(din[15]),
        .c(shamt[0]),
        .o(r2[14])
    );
    chose_2to1 r2_15(
        .a(din[15]),
        .b(din[16]),
        .c(shamt[0]),
        .o(r2[15])
    );
    chose_2to1 r2_16(
        .a(din[16]),
        .b(din[17]),
        .c(shamt[0]),
        .o(r2[16])
    );
    chose_2to1 r2_17(
        .a(din[17]),
        .b(din[18]),
        .c(shamt[0]),
        .o(r2[17])
    );
    chose_2to1 r2_18(
        .a(din[18]),
        .b(din[19]),
        .c(shamt[0]),
        .o(r2[18])
    );
    chose_2to1 r2_19(
        .a(din[19]),
        .b(din[20]),
        .c(shamt[0]),
        .o(r2[19])
    );
    chose_2to1 r2_20(
        .a(din[20]),
        .b(din[21]),
        .c(shamt[0]),
        .o(r2[20])
    );
    chose_2to1 r2_21(
        .a(din[21]),
        .b(din[22]),
        .c(shamt[0]),
        .o(r2[21])
    );
    chose_2to1 r2_22(
        .a(din[22]),
        .b(din[23]),
        .c(shamt[0]),
        .o(r2[22])
    );
    chose_2to1 r2_23(
        .a(din[23]),
        .b(din[24]),
        .c(shamt[0]),
        .o(r2[23])
    );
    chose_2to1 r2_24(
        .a(din[24]),
        .b(din[25]),
        .c(shamt[0]),
        .o(r2[24])
    );
    chose_2to1 r2_25(
        .a(din[25]),
        .b(din[26]),
        .c(shamt[0]),
        .o(r2[25])
    );
    chose_2to1 r2_26(
        .a(din[26]),
        .b(din[27]),
        .c(shamt[0]),
        .o(r2[26])
    );
    chose_2to1 r2_27(
        .a(din[27]),
        .b(din[28]),
        .c(shamt[0]),
        .o(r2[27])
    );
    chose_2to1 r2_28(
        .a(din[28]),
        .b(din[29]),
        .c(shamt[0]),
        .o(r2[28])
    );
    chose_2to1 r2_29(
        .a(din[29]),
        .b(din[30]),
        .c(shamt[0]),
        .o(r2[29])
    );
    chose_2to1 r2_30(
        .a(din[30]),
        .b(din[31]),
        .c(shamt[0]),
        .o(r2[30])
    );
    chose_2to1 r2_31(
        .a(din[31]),
        .b(AL & din[31]),
        .c(shamt[0]),
        .o(r2[31])
    );
    chose_2to1 r4_0(
        .a(r2[0]),
        .b(r2[2]),
        .c(shamt[1]),
        .o(r4[0])
    );
    chose_2to1 r4_1(
        .a(r2[1]),
        .b(r2[3]),
        .c(shamt[1]),
        .o(r4[1])
    );
    chose_2to1 r4_2(
        .a(r2[2]),
        .b(r2[4]),
        .c(shamt[1]),
        .o(r4[2])
    );
    chose_2to1 r4_3(
        .a(r2[3]),
        .b(r2[5]),
        .c(shamt[1]),
        .o(r4[3])
    );
    chose_2to1 r4_4(
        .a(r2[4]),
        .b(r2[6]),
        .c(shamt[1]),
        .o(r4[4])
    );
    chose_2to1 r4_5(
        .a(r2[5]),
        .b(r2[7]),
        .c(shamt[1]),
        .o(r4[5])
    );
    chose_2to1 r4_6(
        .a(r2[6]),
        .b(r2[8]),
        .c(shamt[1]),
        .o(r4[6])
    );
    chose_2to1 r4_7(
        .a(r2[7]),
        .b(r2[9]),
        .c(shamt[1]),
        .o(r4[7])
    );
    chose_2to1 r4_8(
        .a(r2[8]),
        .b(r2[10]),
        .c(shamt[1]),
        .o(r4[8])
    );
    chose_2to1 r4_9(
        .a(r2[9]),
        .b(r2[11]),
        .c(shamt[1]),
        .o(r4[9])
    );
    chose_2to1 r4_10(
        .a(r2[10]),
        .b(r2[12]),
        .c(shamt[1]),
        .o(r4[10])
    );
    chose_2to1 r4_11(
        .a(r2[11]),
        .b(r2[13]),
        .c(shamt[1]),
        .o(r4[11])
    );
    chose_2to1 r4_12(
        .a(r2[12]),
        .b(r2[14]),
        .c(shamt[1]),
        .o(r4[12])
    );
    chose_2to1 r4_13(
        .a(r2[13]),
        .b(r2[15]),
        .c(shamt[1]),
        .o(r4[13])
    );
    chose_2to1 r4_14(
        .a(r2[14]),
        .b(r2[16]),
        .c(shamt[1]),
        .o(r4[14])
    );
    chose_2to1 r4_15(
        .a(r2[15]),
        .b(r2[17]),
        .c(shamt[1]),
        .o(r4[15])
    );
    chose_2to1 r4_16(
        .a(r2[16]),
        .b(r2[18]),
        .c(shamt[1]),
        .o(r4[16])
    );
    chose_2to1 r4_17(
        .a(r2[17]),
        .b(r2[19]),
        .c(shamt[1]),
        .o(r4[17])
    );
    chose_2to1 r4_18(
        .a(r2[18]),
        .b(r2[20]),
        .c(shamt[1]),
        .o(r4[18])
    );
    chose_2to1 r4_19(
        .a(r2[19]),
        .b(r2[21]),
        .c(shamt[1]),
        .o(r4[19])
    );
    chose_2to1 r4_20(
        .a(r2[20]),
        .b(r2[22]),
        .c(shamt[1]),
        .o(r4[20])
    );
    chose_2to1 r4_21(
        .a(r2[21]),
        .b(r2[23]),
        .c(shamt[1]),
        .o(r4[21])
    );
    chose_2to1 r4_22(
        .a(r2[22]),
        .b(r2[24]),
        .c(shamt[1]),
        .o(r4[22])
    );
    chose_2to1 r4_23(
        .a(r2[23]),
        .b(r2[25]),
        .c(shamt[1]),
        .o(r4[23])
    );
    chose_2to1 r4_24(
        .a(r2[24]),
        .b(r2[26]),
        .c(shamt[1]),
        .o(r4[24])
    );
    chose_2to1 r4_25(
        .a(r2[25]),
        .b(r2[27]),
        .c(shamt[1]),
        .o(r4[25])
    );
    chose_2to1 r4_26(
        .a(r2[26]),
        .b(r2[28]),
        .c(shamt[1]),
        .o(r4[26])
    );
    chose_2to1 r4_27(
        .a(r2[27]),
        .b(r2[29]),
        .c(shamt[1]),
        .o(r4[27])
    );
    chose_2to1 r4_28(
        .a(r2[28]),
        .b(r2[30]),
        .c(shamt[1]),
        .o(r4[28])
    );
    chose_2to1 r4_29(
        .a(r2[29]),
        .b(r2[31]),
        .c(shamt[1]),
        .o(r4[29])
    );
    chose_2to1 r4_30(
        .a(r2[30]),
        .b(AL & din[31]),
        .c(shamt[1]),
        .o(r4[30])
    );
    chose_2to1 r4_31(
        .a(r2[31]),
        .b(AL & din[31]),
        .c(shamt[1]),
        .o(r4[31])
    );
    chose_2to1 r8_0(
        .a(r4[0]),
        .b(r4[4]),
        .c(shamt[2]),
        .o(r8[0])
    );
    chose_2to1 r8_1(
        .a(r4[1]),
        .b(r4[5]),
        .c(shamt[2]),
        .o(r8[1])
    );
    chose_2to1 r8_2(
        .a(r4[2]),
        .b(r4[6]),
        .c(shamt[2]),
        .o(r8[2])
    );
    chose_2to1 r8_3(
        .a(r4[3]),
        .b(r4[7]),
        .c(shamt[2]),
        .o(r8[3])
    );
    chose_2to1 r8_4(
        .a(r4[4]),
        .b(r4[8]),
        .c(shamt[2]),
        .o(r8[4])
    );
    chose_2to1 r8_5(
        .a(r4[5]),
        .b(r4[9]),
        .c(shamt[2]),
        .o(r8[5])
    );
    chose_2to1 r8_6(
        .a(r4[6]),
        .b(r4[10]),
        .c(shamt[2]),
        .o(r8[6])
    );
    chose_2to1 r8_7(
        .a(r4[7]),
        .b(r4[11]),
        .c(shamt[2]),
        .o(r8[7])
    );
    chose_2to1 r8_8(
        .a(r4[8]),
        .b(r4[12]),
        .c(shamt[2]),
        .o(r8[8])
    );
    chose_2to1 r8_9(
        .a(r4[9]),
        .b(r4[13]),
        .c(shamt[2]),
        .o(r8[9])
    );
    chose_2to1 r8_10(
        .a(r4[10]),
        .b(r4[14]),
        .c(shamt[2]),
        .o(r8[10])
    );
    chose_2to1 r8_11(
        .a(r4[11]),
        .b(r4[15]),
        .c(shamt[2]),
        .o(r8[11])
    );
    chose_2to1 r8_12(
        .a(r4[12]),
        .b(r4[16]),
        .c(shamt[2]),
        .o(r8[12])
    );
    chose_2to1 r8_13(
        .a(r4[13]),
        .b(r4[17]),
        .c(shamt[2]),
        .o(r8[13])
    );
    chose_2to1 r8_14(
        .a(r4[14]),
        .b(r4[18]),
        .c(shamt[2]),
        .o(r8[14])
    );
    chose_2to1 r8_15(
        .a(r4[15]),
        .b(r4[19]),
        .c(shamt[2]),
        .o(r8[15])
    );
    chose_2to1 r8_16(
        .a(r4[16]),
        .b(r4[20]),
        .c(shamt[2]),
        .o(r8[16])
    );
    chose_2to1 r8_17(
        .a(r4[17]),
        .b(r4[21]),
        .c(shamt[2]),
        .o(r8[17])
    );
    chose_2to1 r8_18(
        .a(r4[18]),
        .b(r4[22]),
        .c(shamt[2]),
        .o(r8[18])
    );
    chose_2to1 r8_19(
        .a(r4[19]),
        .b(r4[23]),
        .c(shamt[2]),
        .o(r8[19])
    );
    chose_2to1 r8_20(
        .a(r4[20]),
        .b(r4[24]),
        .c(shamt[2]),
        .o(r8[20])
    );
    chose_2to1 r8_21(
        .a(r4[21]),
        .b(r4[25]),
        .c(shamt[2]),
        .o(r8[21])
    );
    chose_2to1 r8_22(
        .a(r4[22]),
        .b(r4[26]),
        .c(shamt[2]),
        .o(r8[22])
    );
    chose_2to1 r8_23(
        .a(r4[23]),
        .b(r4[27]),
        .c(shamt[2]),
        .o(r8[23])
    );
    chose_2to1 r8_24(
        .a(r4[24]),
        .b(r4[28]),
        .c(shamt[2]),
        .o(r8[24])
    );
    chose_2to1 r8_25(
        .a(r4[25]),
        .b(r4[29]),
        .c(shamt[2]),
        .o(r8[25])
    );
    chose_2to1 r8_26(
        .a(r4[26]),
        .b(r4[30]),
        .c(shamt[2]),
        .o(r8[26])
    );
    chose_2to1 r8_27(
        .a(r4[27]),
        .b(r4[31]),
        .c(shamt[2]),
        .o(r8[27])
    );
    chose_2to1 r8_28(
        .a(r4[28]),
        .b(AL & din[31]),
        .c(shamt[2]),
        .o(r8[28])
    );
    chose_2to1 r8_29(
        .a(r4[29]),
        .b(AL & din[31]),
        .c(shamt[2]),
        .o(r8[29])
    );
    chose_2to1 r8_30(
        .a(r4[30]),
        .b(AL & din[31]),
        .c(shamt[2]),
        .o(r8[30])
    );
    chose_2to1 r8_31(
        .a(r4[31]),
        .b(AL & din[31]),
        .c(shamt[2]),
        .o(r8[31])
    );
    chose_2to1 r16_0(
        .a(r8[0]),
        .b(r8[8]),
        .c(shamt[3]),
        .o(r16[0])
    );
    chose_2to1 r16_1(
        .a(r8[1]),
        .b(r8[9]),
        .c(shamt[3]),
        .o(r16[1])
    );
    chose_2to1 r16_2(
        .a(r8[2]),
        .b(r8[10]),
        .c(shamt[3]),
        .o(r16[2])
    );
    chose_2to1 r16_3(
        .a(r8[3]),
        .b(r8[11]),
        .c(shamt[3]),
        .o(r16[3])
    );
    chose_2to1 r16_4(
        .a(r8[4]),
        .b(r8[12]),
        .c(shamt[3]),
        .o(r16[4])
    );
    chose_2to1 r16_5(
        .a(r8[5]),
        .b(r8[13]),
        .c(shamt[3]),
        .o(r16[5])
    );
    chose_2to1 r16_6(
        .a(r8[6]),
        .b(r8[14]),
        .c(shamt[3]),
        .o(r16[6])
    );
    chose_2to1 r16_7(
        .a(r8[7]),
        .b(r8[15]),
        .c(shamt[3]),
        .o(r16[7])
    );
    chose_2to1 r16_8(
        .a(r8[8]),
        .b(r8[16]),
        .c(shamt[3]),
        .o(r16[8])
    );
    chose_2to1 r16_9(
        .a(r8[9]),
        .b(r8[17]),
        .c(shamt[3]),
        .o(r16[9])
    );
    chose_2to1 r16_10(
        .a(r8[10]),
        .b(r8[18]),
        .c(shamt[3]),
        .o(r16[10])
    );
    chose_2to1 r16_11(
        .a(r8[11]),
        .b(r8[19]),
        .c(shamt[3]),
        .o(r16[11])
    );
    chose_2to1 r16_12(
        .a(r8[12]),
        .b(r8[20]),
        .c(shamt[3]),
        .o(r16[12])
    );
    chose_2to1 r16_13(
        .a(r8[13]),
        .b(r8[21]),
        .c(shamt[3]),
        .o(r16[13])
    );
    chose_2to1 r16_14(
        .a(r8[14]),
        .b(r8[22]),
        .c(shamt[3]),
        .o(r16[14])
    );
    chose_2to1 r16_15(
        .a(r8[15]),
        .b(r8[23]),
        .c(shamt[3]),
        .o(r16[15])
    );
    chose_2to1 r16_16(
        .a(r8[16]),
        .b(r8[24]),
        .c(shamt[3]),
        .o(r16[16])
    );
    chose_2to1 r16_17(
        .a(r8[17]),
        .b(r8[25]),
        .c(shamt[3]),
        .o(r16[17])
    );
    chose_2to1 r16_18(
        .a(r8[18]),
        .b(r8[26]),
        .c(shamt[3]),
        .o(r16[18])
    );
    chose_2to1 r16_19(
        .a(r8[19]),
        .b(r8[27]),
        .c(shamt[3]),
        .o(r16[19])
    );
    chose_2to1 r16_20(
        .a(r8[20]),
        .b(r8[28]),
        .c(shamt[3]),
        .o(r16[20])
    );
    chose_2to1 r16_21(
        .a(r8[21]),
        .b(r8[29]),
        .c(shamt[3]),
        .o(r16[21])
    );
    chose_2to1 r16_22(
        .a(r8[22]),
        .b(r8[30]),
        .c(shamt[3]),
        .o(r16[22])
    );
    chose_2to1 r16_23(
        .a(r8[23]),
        .b(r8[31]),
        .c(shamt[3]),
        .o(r16[23])
    );
    chose_2to1 r16_24(
        .a(r8[24]),
        .b(AL & din[31]),
        .c(shamt[3]),
        .o(r16[24])
    );
    chose_2to1 r16_25(
        .a(r8[25]),
        .b(AL & din[31]),
        .c(shamt[3]),
        .o(r16[25])
    );
    chose_2to1 r16_26(
        .a(r8[26]),
        .b(AL & din[31]),
        .c(shamt[3]),
        .o(r16[26])
    );
    chose_2to1 r16_27(
        .a(r8[27]),
        .b(AL & din[31]),
        .c(shamt[3]),
        .o(r16[27])
    );
    chose_2to1 r16_28(
        .a(r8[28]),
        .b(AL & din[31]),
        .c(shamt[3]),
        .o(r16[28])
    );
    chose_2to1 r16_29(
        .a(r8[29]),
        .b(AL & din[31]),
        .c(shamt[3]),
        .o(r16[29])
    );
    chose_2to1 r16_30(
        .a(r8[30]),
        .b(AL & din[31]),
        .c(shamt[3]),
        .o(r16[30])
    );
    chose_2to1 r16_31(
        .a(r8[31]),
        .b(AL & din[31]),
        .c(shamt[3]),
        .o(r16[31])
    );
    chose_2to1 r32_0(
        .a(r16[0]),
        .b(r16[16]),
        .c(shamt[4]),
        .o(dout[0])
    );
    chose_2to1 r32_1(
        .a(r16[1]),
        .b(r16[17]),
        .c(shamt[4]),
        .o(dout[1])
    );
    chose_2to1 r32_2(
        .a(r16[2]),
        .b(r16[18]),
        .c(shamt[4]),
        .o(dout[2])
    );
    chose_2to1 r32_3(
        .a(r16[3]),
        .b(r16[19]),
        .c(shamt[4]),
        .o(dout[3])
    );
    chose_2to1 r32_4(
        .a(r16[4]),
        .b(r16[20]),
        .c(shamt[4]),
        .o(dout[4])
    );
    chose_2to1 r32_5(
        .a(r16[5]),
        .b(r16[21]),
        .c(shamt[4]),
        .o(dout[5])
    );
    chose_2to1 r32_6(
        .a(r16[6]),
        .b(r16[22]),
        .c(shamt[4]),
        .o(dout[6])
    );
    chose_2to1 r32_7(
        .a(r16[7]),
        .b(r16[23]),
        .c(shamt[4]),
        .o(dout[7])
    );
    chose_2to1 r32_8(
        .a(r16[8]),
        .b(r16[24]),
        .c(shamt[4]),
        .o(dout[8])
    );
    chose_2to1 r32_9(
        .a(r16[9]),
        .b(r16[25]),
        .c(shamt[4]),
        .o(dout[9])
    );
    chose_2to1 r32_10(
        .a(r16[10]),
        .b(r16[26]),
        .c(shamt[4]),
        .o(dout[10])
    );
    chose_2to1 r32_11(
        .a(r16[11]),
        .b(r16[27]),
        .c(shamt[4]),
        .o(dout[11])
    );
    chose_2to1 r32_12(
        .a(r16[12]),
        .b(r16[28]),
        .c(shamt[4]),
        .o(dout[12])
    );
    chose_2to1 r32_13(
        .a(r16[13]),
        .b(r16[29]),
        .c(shamt[4]),
        .o(dout[13])
    );
    chose_2to1 r32_14(
        .a(r16[14]),
        .b(r16[30]),
        .c(shamt[4]),
        .o(dout[14])
    );
    chose_2to1 r32_15(
        .a(r16[15]),
        .b(r16[31]),
        .c(shamt[4]),
        .o(dout[15])
    );
    chose_2to1 r32_16(
        .a(r16[16]),
        .b(AL & din[31]),
        .c(shamt[4]),
        .o(dout[16])
    );
    chose_2to1 r32_17(
        .a(r16[17]),
        .b(AL & din[31]),
        .c(shamt[4]),
        .o(dout[17])
    );
    chose_2to1 r32_18(
        .a(r16[18]),
        .b(AL & din[31]),
        .c(shamt[4]),
        .o(dout[18])
    );
    chose_2to1 r32_19(
        .a(r16[19]),
        .b(AL & din[31]),
        .c(shamt[4]),
        .o(dout[19])
    );
    chose_2to1 r32_20(
        .a(r16[20]),
        .b(AL & din[31]),
        .c(shamt[4]),
        .o(dout[20])
    );
    chose_2to1 r32_21(
        .a(r16[21]),
        .b(AL & din[31]),
        .c(shamt[4]),
        .o(dout[21])
    );
    chose_2to1 r32_22(
        .a(r16[22]),
        .b(AL & din[31]),
        .c(shamt[4]),
        .o(dout[22])
    );
    chose_2to1 r32_23(
        .a(r16[23]),
        .b(AL & din[31]),
        .c(shamt[4]),
        .o(dout[23])
    );
    chose_2to1 r32_24(
        .a(r16[24]),
        .b(AL & din[31]),
        .c(shamt[4]),
        .o(dout[24])
    );
    chose_2to1 r32_25(
        .a(r16[25]),
        .b(AL & din[31]),
        .c(shamt[4]),
        .o(dout[25])
    );
    chose_2to1 r32_26(
        .a(r16[26]),
        .b(AL & din[31]),
        .c(shamt[4]),
        .o(dout[26])
    );
    chose_2to1 r32_27(
        .a(r16[27]),
        .b(AL & din[31]),
        .c(shamt[4]),
        .o(dout[27])
    );
    chose_2to1 r32_28(
        .a(r16[28]),
        .b(AL & din[31]),
        .c(shamt[4]),
        .o(dout[28])
    );
    chose_2to1 r32_29(
        .a(r16[29]),
        .b(AL & din[31]),
        .c(shamt[4]),
        .o(dout[29])
    );
    chose_2to1 r32_30(
        .a(r16[30]),
        .b(AL & din[31]),
        .c(shamt[4]),
        .o(dout[30])
    );
    chose_2to1 r32_31(
        .a(r16[31]),
        .b(AL & din[31]),
        .c(shamt[4]),
        .o(dout[31])
    );
endmodule

module barrelsft32(
    output [31:0] dout,
    input [31:0] din,
    input [4:0] shamt,   
    input LR,           
    input AL       
);
//add your code here
    wire [31:0] S_L;
    wire [31:0] S_R;
    shift_left SL(
        .dout(S_L),
        .din(din),
        .shamt(shamt)
    );
    shift_right SR(
        .dout(S_R),
        .din(din),
        .shamt(shamt),
        .AL(AL)
    );
    /*
    ```python3
    for i in range(0, 32):
        print("chose_2to1 LR_{}(".format(str(i)))
        print("    .a(S_R[{}]),".format(str(i)))
        print("    .b(S_L[{}]),".format(str(i)))
        print("    .c(LR),")
        print("    .o(dout[{}])".format(str(i)))
        print(");")
    ```
    */
    chose_2to1 LR_0(
        .a(S_R[0]),
        .b(S_L[0]),
        .c(LR),
        .o(dout[0])
    );
    chose_2to1 LR_1(
        .a(S_R[1]),
        .b(S_L[1]),
        .c(LR),
        .o(dout[1])
    );
    chose_2to1 LR_2(
        .a(S_R[2]),
        .b(S_L[2]),
        .c(LR),
        .o(dout[2])
    );
    chose_2to1 LR_3(
        .a(S_R[3]),
        .b(S_L[3]),
        .c(LR),
        .o(dout[3])
    );
    chose_2to1 LR_4(
        .a(S_R[4]),
        .b(S_L[4]),
        .c(LR),
        .o(dout[4])
    );
    chose_2to1 LR_5(
        .a(S_R[5]),
        .b(S_L[5]),
        .c(LR),
        .o(dout[5])
    );
    chose_2to1 LR_6(
        .a(S_R[6]),
        .b(S_L[6]),
        .c(LR),
        .o(dout[6])
    );
    chose_2to1 LR_7(
        .a(S_R[7]),
        .b(S_L[7]),
        .c(LR),
        .o(dout[7])
    );
    chose_2to1 LR_8(
        .a(S_R[8]),
        .b(S_L[8]),
        .c(LR),
        .o(dout[8])
    );
    chose_2to1 LR_9(
        .a(S_R[9]),
        .b(S_L[9]),
        .c(LR),
        .o(dout[9])
    );
    chose_2to1 LR_10(
        .a(S_R[10]),
        .b(S_L[10]),
        .c(LR),
        .o(dout[10])
    );
    chose_2to1 LR_11(
        .a(S_R[11]),
        .b(S_L[11]),
        .c(LR),
        .o(dout[11])
    );
    chose_2to1 LR_12(
        .a(S_R[12]),
        .b(S_L[12]),
        .c(LR),
        .o(dout[12])
    );
    chose_2to1 LR_13(
        .a(S_R[13]),
        .b(S_L[13]),
        .c(LR),
        .o(dout[13])
    );
    chose_2to1 LR_14(
        .a(S_R[14]),
        .b(S_L[14]),
        .c(LR),
        .o(dout[14])
    );
    chose_2to1 LR_15(
        .a(S_R[15]),
        .b(S_L[15]),
        .c(LR),
        .o(dout[15])
    );
    chose_2to1 LR_16(
        .a(S_R[16]),
        .b(S_L[16]),
        .c(LR),
        .o(dout[16])
    );
    chose_2to1 LR_17(
        .a(S_R[17]),
        .b(S_L[17]),
        .c(LR),
        .o(dout[17])
    );
    chose_2to1 LR_18(
        .a(S_R[18]),
        .b(S_L[18]),
        .c(LR),
        .o(dout[18])
    );
    chose_2to1 LR_19(
        .a(S_R[19]),
        .b(S_L[19]),
        .c(LR),
        .o(dout[19])
    );
    chose_2to1 LR_20(
        .a(S_R[20]),
        .b(S_L[20]),
        .c(LR),
        .o(dout[20])
    );
    chose_2to1 LR_21(
        .a(S_R[21]),
        .b(S_L[21]),
        .c(LR),
        .o(dout[21])
    );
    chose_2to1 LR_22(
        .a(S_R[22]),
        .b(S_L[22]),
        .c(LR),
        .o(dout[22])
    );
    chose_2to1 LR_23(
        .a(S_R[23]),
        .b(S_L[23]),
        .c(LR),
        .o(dout[23])
    );
    chose_2to1 LR_24(
        .a(S_R[24]),
        .b(S_L[24]),
        .c(LR),
        .o(dout[24])
    );
    chose_2to1 LR_25(
        .a(S_R[25]),
        .b(S_L[25]),
        .c(LR),
        .o(dout[25])
    );
    chose_2to1 LR_26(
        .a(S_R[26]),
        .b(S_L[26]),
        .c(LR),
        .o(dout[26])
    );
    chose_2to1 LR_27(
        .a(S_R[27]),
        .b(S_L[27]),
        .c(LR),
        .o(dout[27])
    );
    chose_2to1 LR_28(
        .a(S_R[28]),
        .b(S_L[28]),
        .c(LR),
        .o(dout[28])
    );
    chose_2to1 LR_29(
        .a(S_R[29]),
        .b(S_L[29]),
        .c(LR),
        .o(dout[29])
    );
    chose_2to1 LR_30(
        .a(S_R[30]),
        .b(S_L[30]),
        .c(LR),
        .o(dout[30])
    );
    chose_2to1 LR_31(
        .a(S_R[31]),
        .b(S_L[31]),
        .c(LR),
        .o(dout[31])
    );
endmodule
