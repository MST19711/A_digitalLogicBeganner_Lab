`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/09 20:14:55
// Design Name: 
// Module Name: trans4to4
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
module trans2to1_3(
    input [2:0] A, B,
    output [2:0] OUTPUT,
    input C
    );
    assign OUTPUT = (C == 0) ? A : B;
endmodule

module trans1to2_3(
    input [2:0] INPUT,
    output [2:0] OUTPUT0, OUTPUT1,
    input C
    );
    assign OUTPUT0 = (C == 0) ? INPUT : 3'bzzz;
    assign OUTPUT1 = (C == 1) ? INPUT : 3'bzzz;
endmodule

module trans4to4(
    output  [2:0] Y0,Y1,Y2,Y3,
    input   [2:0] D0,D1,D2,D3,
    input   [1:0] S
); 
// add your code here
    wire [2:0] BUS, BUS00, BUS01, BUS10, BUS11;
    trans2to1_3 IN_00(
        .A(D0),
        .B(D1),
        .OUTPUT(BUS00),
        .C(S[0])
    );
    trans2to1_3 IN_01(
        .A(D2),
        .B(D3),
        .OUTPUT(BUS01),
        .C(S[0])
    );
    trans2to1_3 IN2OUT(
        .A(BUS00),
        .B(BUS01),
        .OUTPUT(BUS),
        .C(S[1])
    );
    trans1to2_3 OUT_f_IN(
        .INPUT(BUS),
        .OUTPUT0(BUS10),
        .OUTPUT1(BUS11),
        .C(S[1])
    );
    trans1to2_3 OUT10(
        .INPUT(BUS10),
        .OUTPUT0(Y0),
        .OUTPUT1(Y1),
        .C(S[0])
    );
    trans1to2_3 OUT11(
        .INPUT(BUS11),
        .OUTPUT0(Y2),
        .OUTPUT1(Y3),
        .C(S[0])
    );
endmodule
