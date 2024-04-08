`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/09 23:04:22
// Design Name: 
// Module Name: kbcode2ascii
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

module kbcode2ascii(
      output[7:0] asciicode,
      input [7:0] kbcode
);
    reg [7:0] kb_mem[255:0];
    initial
    begin
    /*
    python3
    for i in range(0, 255):
        inpu
    */
     //$readmemh("D:\Documents\GitHub\digitalLogic_Lab\digital_logic_exp\lab5\scancode.txt", kb_mem, 0, 255);  //ÐÞ¸Äscancode.txt´æ·ÅÂ·¾¶
        kb_mem[0] = 8'h00;
        kb_mem[1] = 8'h00;
        kb_mem[2] = 8'h00;
        kb_mem[3] = 8'h00;
        kb_mem[4] = 8'h00;
        kb_mem[5] = 8'h00;
        kb_mem[6] = 8'h00;
        kb_mem[7] = 8'h00;
        kb_mem[8] = 8'h00;
        kb_mem[9] = 8'h00;
        kb_mem[10] = 8'h00;
        kb_mem[11] = 8'h00;
        kb_mem[12] = 8'h00;
        kb_mem[13] = 8'h20;
        kb_mem[14] = 8'h60;
        kb_mem[15] = 8'h00;
        kb_mem[16] = 8'h00;
        kb_mem[17] = 8'h00;
        kb_mem[18] = 8'h00;
        kb_mem[19] = 8'h00;
        kb_mem[20] = 8'h00;
        kb_mem[21] = 8'h71;
        kb_mem[22] = 8'h31;
        kb_mem[23] = 8'h00;
        kb_mem[24] = 8'h00;
        kb_mem[25] = 8'h00;
        kb_mem[26] = 8'h7A;
        kb_mem[27] = 8'h73;
        kb_mem[28] = 8'h61;
        kb_mem[29] = 8'h77;
        kb_mem[30] = 8'h32;
        kb_mem[31] = 8'h00;
        kb_mem[32] = 8'h00;
        kb_mem[33] = 8'h63;
        kb_mem[34] = 8'h78;
        kb_mem[35] = 8'h64;
        kb_mem[36] = 8'h65;
        kb_mem[37] = 8'h34;
        kb_mem[38] = 8'h33;
        kb_mem[39] = 8'h00;
        kb_mem[40] = 8'h00;
        kb_mem[41] = 8'h20;
        kb_mem[42] = 8'h76;
        kb_mem[43] = 8'h66;
        kb_mem[44] = 8'h74;
        kb_mem[45] = 8'h72;
        kb_mem[46] = 8'h35;
        kb_mem[47] = 8'h00;
        kb_mem[48] = 8'h00;
        kb_mem[49] = 8'h6E;
        kb_mem[50] = 8'h62;
        kb_mem[51] = 8'h68;
        kb_mem[52] = 8'h67;
        kb_mem[53] = 8'h79;
        kb_mem[54] = 8'h36;
        kb_mem[55] = 8'h00;
        kb_mem[56] = 8'h00;
        kb_mem[57] = 8'h00;
        kb_mem[58] = 8'h6D;
        kb_mem[59] = 8'h6A;
        kb_mem[60] = 8'h75;
        kb_mem[61] = 8'h37;
        kb_mem[62] = 8'h38;
        kb_mem[63] = 8'h00;
        kb_mem[64] = 8'h00;
        kb_mem[65] = 8'h2C;
        kb_mem[66] = 8'h6B;
        kb_mem[67] = 8'h69;
        kb_mem[68] = 8'h6F;
        kb_mem[69] = 8'h30;
        kb_mem[70] = 8'h39;
        kb_mem[71] = 8'h00;
        kb_mem[72] = 8'h00;
        kb_mem[73] = 8'h2E;
        kb_mem[74] = 8'h2F;
        kb_mem[75] = 8'h6C;
        kb_mem[76] = 8'h3A;
        kb_mem[77] = 8'h71;
        kb_mem[78] = 8'h2D;
        kb_mem[79] = 8'h00;
        kb_mem[80] = 8'h00;
        kb_mem[81] = 8'h00;
        kb_mem[82] = 8'h27;
        kb_mem[83] = 8'h00;
        kb_mem[84] = 8'h5B;
        kb_mem[85] = 8'h3D;
        kb_mem[86] = 8'h00;
        kb_mem[87] = 8'h00;
        kb_mem[88] = 8'h00;
        kb_mem[89] = 8'h00;
        kb_mem[90] = 8'h0D;
        kb_mem[91] = 8'h5D;
        kb_mem[92] = 8'h00;
        kb_mem[93] = 8'h5C;
        kb_mem[94] = 8'h00;
        kb_mem[95] = 8'h00;
        kb_mem[96] = 8'h00;
        kb_mem[97] = 8'h00;
        kb_mem[98] = 8'h00;
        kb_mem[99] = 8'h00;
        kb_mem[100] = 8'h00;
        kb_mem[101] = 8'h00;
        kb_mem[102] = 8'h08;
        kb_mem[103] = 8'h00;
        kb_mem[104] = 8'h00;
        kb_mem[105] = 8'h31;
        kb_mem[106] = 8'h00;
        kb_mem[107] = 8'h34;
        kb_mem[108] = 8'h37;
        kb_mem[109] = 8'h00;
        kb_mem[110] = 8'h00;
        kb_mem[111] = 8'h00;
        kb_mem[112] = 8'h30;
        kb_mem[113] = 8'h2E;
        kb_mem[114] = 8'h32;
        kb_mem[115] = 8'h35;
        kb_mem[116] = 8'h36;
        kb_mem[117] = 8'h38;
        kb_mem[118] = 8'h00;
        kb_mem[119] = 8'h00;
        kb_mem[120] = 8'h00;
        kb_mem[121] = 8'h2B;
        kb_mem[122] = 8'h33;
        kb_mem[123] = 8'h2C;
        kb_mem[124] = 8'h2A;
        kb_mem[125] = 8'h39;
        kb_mem[126] = 8'h00;
        kb_mem[127] = 8'h00;
        kb_mem[128] = 8'h00;
        kb_mem[129] = 8'h00;
        kb_mem[130] = 8'h00;
        kb_mem[131] = 8'h00;
        kb_mem[132] = 8'h00;
        kb_mem[133] = 8'h00;
        kb_mem[134] = 8'h00;
        kb_mem[135] = 8'h00;
        kb_mem[136] = 8'h00;
        kb_mem[137] = 8'h00;
        kb_mem[138] = 8'h00;
        kb_mem[139] = 8'h00;
        kb_mem[140] = 8'h00;
        kb_mem[141] = 8'h00;
        kb_mem[142] = 8'h00;
        kb_mem[143] = 8'h00;
        kb_mem[144] = 8'h00;
        kb_mem[145] = 8'h00;
        kb_mem[146] = 8'h00;
        kb_mem[147] = 8'h00;
        kb_mem[148] = 8'h00;
        kb_mem[149] = 8'h00;
        kb_mem[150] = 8'h00;
        kb_mem[151] = 8'h00;
        kb_mem[152] = 8'h00;
        kb_mem[153] = 8'h00;
        kb_mem[154] = 8'h00;
        kb_mem[155] = 8'h00;
        kb_mem[156] = 8'h00;
        kb_mem[157] = 8'h00;
        kb_mem[158] = 8'h00;
        kb_mem[159] = 8'h00;
        kb_mem[160] = 8'h00;
        kb_mem[161] = 8'h00;
        kb_mem[162] = 8'h00;
        kb_mem[163] = 8'h00;
        kb_mem[164] = 8'h00;
        kb_mem[165] = 8'h00;
        kb_mem[166] = 8'h00;
        kb_mem[167] = 8'h00;
        kb_mem[168] = 8'h00;
        kb_mem[169] = 8'h00;
        kb_mem[170] = 8'h00;
        kb_mem[171] = 8'h00;
        kb_mem[172] = 8'h00;
        kb_mem[173] = 8'h00;
        kb_mem[174] = 8'h00;
        kb_mem[175] = 8'h00;
        kb_mem[176] = 8'h00;
        kb_mem[177] = 8'h00;
        kb_mem[178] = 8'h00;
        kb_mem[179] = 8'h00;
        kb_mem[180] = 8'h00;
        kb_mem[181] = 8'h00;
        kb_mem[182] = 8'h00;
        kb_mem[183] = 8'h00;
        kb_mem[184] = 8'h00;
        kb_mem[185] = 8'h00;
        kb_mem[186] = 8'h00;
        kb_mem[187] = 8'h00;
        kb_mem[188] = 8'h00;
        kb_mem[189] = 8'h00;
        kb_mem[190] = 8'h00;
        kb_mem[191] = 8'h00;
        kb_mem[192] = 8'h00;
        kb_mem[193] = 8'h00;
        kb_mem[194] = 8'h00;
        kb_mem[195] = 8'h00;
        kb_mem[196] = 8'h00;
        kb_mem[197] = 8'h00;
        kb_mem[198] = 8'h00;
        kb_mem[199] = 8'h00;
        kb_mem[200] = 8'h00;
        kb_mem[201] = 8'h00;
        kb_mem[202] = 8'h00;
        kb_mem[203] = 8'h00;
        kb_mem[204] = 8'h00;
        kb_mem[205] = 8'h00;
        kb_mem[206] = 8'h00;
        kb_mem[207] = 8'h00;
        kb_mem[208] = 8'h00;
        kb_mem[209] = 8'h00;
        kb_mem[210] = 8'h00;
        kb_mem[211] = 8'h00;
        kb_mem[212] = 8'h00;
        kb_mem[213] = 8'h00;
        kb_mem[214] = 8'h00;
        kb_mem[215] = 8'h00;
        kb_mem[216] = 8'h00;
        kb_mem[217] = 8'h00;
        kb_mem[218] = 8'h00;
        kb_mem[219] = 8'h00;
        kb_mem[220] = 8'h00;
        kb_mem[221] = 8'h00;
        kb_mem[222] = 8'h00;
        kb_mem[223] = 8'h00;
        kb_mem[224] = 8'h00;
        kb_mem[225] = 8'h00;
        kb_mem[226] = 8'h00;
        kb_mem[227] = 8'h00;
        kb_mem[228] = 8'h00;
        kb_mem[229] = 8'h00;
        kb_mem[230] = 8'h00;
        kb_mem[231] = 8'h00;
        kb_mem[232] = 8'h00;
        kb_mem[233] = 8'h00;
        kb_mem[234] = 8'h00;
        kb_mem[235] = 8'h00;
        kb_mem[236] = 8'h00;
        kb_mem[237] = 8'h00;
        kb_mem[238] = 8'h00;
        kb_mem[239] = 8'h00;
        kb_mem[240] = 8'h00;
        kb_mem[241] = 8'h00;
        kb_mem[242] = 8'h00;
        kb_mem[243] = 8'h00;
        kb_mem[244] = 8'h00;
        kb_mem[245] = 8'h00;
        kb_mem[246] = 8'h00;
        kb_mem[247] = 8'h00;
        kb_mem[248] = 8'h00;
        kb_mem[249] = 8'h00;
        kb_mem[250] = 8'h00;
        kb_mem[251] = 8'h00;
        kb_mem[252] = 8'h00;
        kb_mem[253] = 8'h00;
        kb_mem[254] = 8'h00;
        kb_mem[255] = 8'h00;
    end
    assign   asciicode = kb_mem[kbcode];
endmodule
