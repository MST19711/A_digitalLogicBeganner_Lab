module Calculator(
    input [31:0] addra,
    input [7:0] ascii_in,
    input [15:0] kbsig,//8:u, 7:d, 6:l, 5:r
    input clk,
    input in_valid,
    output [11:0] douta,
    input available
);
    reg is_calculating = 0;
    wire out;
    reg [7:0] text [2399:0];
    reg [31:0] ptr = 80;
    initial begin
        text[0] = 8'd84;
        text[1] = 8'd66;
        text[2] = 8'd68;
        text[80] = 8'd73;
        text[81] = 8'd39;
        text[82] = 8'd118;
        text[83] = 8'd101;
        text[84] = 8'd32;
        text[85] = 8'd103;
        text[86] = 8'd111;
        text[87] = 8'd116;
        text[88] = 8'd32;
        text[89] = 8'd115;
        text[90] = 8'd111;
        text[91] = 8'd109;
        text[92] = 8'd101;
        text[93] = 8'd32;
        text[94] = 8'd104;
        text[95] = 8'd111;
        text[96] = 8'd116;
        text[97] = 8'd32;
        text[98] = 8'd112;
        text[99] = 8'd111;
        text[100] = 8'd116;
        text[101] = 8'd97;
        text[102] = 8'd116;
        text[103] = 8'd111;
        text[104] = 8'd101;
        text[105] = 8'd115;
        text[106] = 8'd32;
        text[107] = 8'd111;
        text[108] = 8'd110;
        text[109] = 8'd32;
        text[110] = 8'd109;
        text[111] = 8'd121;
        text[112] = 8'd32;
        text[113] = 8'd104;
        text[114] = 8'd97;
        text[115] = 8'd110;
        text[116] = 8'd100;
        text[117] = 8'd115;
        text[118] = 8'd46;
    end
    wire [31:0] xw = addra % 8, yw = ((addra / 640) % 16);
    get_charpix pix(
        .c(text[80 * (addra / (640 * 16)) + (((addra % (640 * 16)) / 8) % 80)]),
        .x(xw[5:0]),
        .y(yw[5:0]),
        .in_ptr((80 * (addra / (640 * 16)) + (((addra % (640 * 16)) / 8) % 80)) == ptr),
        .is_light(out)
    );
    reg [31:0] i;
    always @(posedge clk) begin
        if(is_calculating == 1)begin
            
        end
    end
    assign douta = (out == 1) ? 12'b111111111111 : 12'd0; 
endmodule