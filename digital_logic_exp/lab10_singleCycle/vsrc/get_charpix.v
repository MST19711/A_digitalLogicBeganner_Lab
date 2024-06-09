module get_charpix(
    input [7:0] c,
    input [5:0] x,
    input [5:0] y,
    input in_ptr,
    output is_light
);
    reg [127:0] font [255:0];
    initial begin
        $readmemh("/Users/cx_li/Documents/Github/digitalLogic_Lab/digital_logic_exp/lab6/vsrc/ASC16.hex", font);
    end
    assign is_light = (font[c][127 - ((y * 8) + x)]) | (in_ptr & ((x == 0) || (x == 0)));
    
endmodule
