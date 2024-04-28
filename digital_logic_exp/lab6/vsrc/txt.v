module txt(
    input [31:0] addra,
    input [7:0] ascii_in,
    input [15:0] kbsig,//8:u, 7:d, 6:l, 5:r
    input clk,
    input in_valid,
    output [11:0] douta,
    input available
);
    wire out;
    reg [7:0] text [2399:0];
    reg [31:0] ptr = 80;
    initial begin
        text[0] = 8'd69;
        text[1] = 8'd118;
        text[2] = 8'd101;
        text[3] = 8'd114;
        text[4] = 8'd121;
        text[5] = 8'd116;
        text[6] = 8'd104;
        text[7] = 8'd105;
        text[8] = 8'd110;
        text[9] = 8'd103;
        text[10] = 8'd32;
        text[11] = 8'd105;
        text[12] = 8'd115;
        text[13] = 8'd32;
        text[14] = 8'd97;
        text[15] = 8'd32;
        text[16] = 8'd115;
        text[17] = 8'd116;
        text[18] = 8'd97;
        text[19] = 8'd116;
        text[20] = 8'd101;
        text[21] = 8'd32;
        text[22] = 8'd109;
        text[23] = 8'd97;
        text[24] = 8'd99;
        text[25] = 8'd104;
        text[26] = 8'd105;
        text[27] = 8'd110;
        text[28] = 8'd101;
        text[29] = 8'd46;
    end
    wire [31:0] xw = addra % 8, yw = ((addra / 640) % 16);
    
    integer i;
    reg [2:0]state;
    always @(posedge clk) begin
        if(available == 1)begin
            if(state == 3'd1)begin
                if(ptr == 32'd2400)begin
                    ptr <= 0;
                    state <= 0;
                end else begin
                    text[ptr] <= 0;
                    ptr <= ptr + 1;
                end
            end else begin
                if(in_valid == 1)begin
                    $display("ascii : %d", ascii_in);
                    if(ascii_in == 8'h0D)begin
                        ptr <= (ptr < 2400 - 80) ? ((ptr + 80) - (ptr % 80)) : ptr;
                    end else begin
                        if(kbsig[3] == 1 && ascii_in == 100)begin
                            ptr <= 0;
                            state <= 3'd1;
                        end else begin
                            text[ptr] <= ascii_in;
                            if(kbsig[8] == 0 & kbsig[7] == 0 & kbsig[6] == 0 & kbsig[5] == 0 & kbsig[9] == 0)begin
                                ptr <= (ptr < 2399) ? ptr + 1 : ptr;
                            end
                        end
                    end
                end
                else if(kbsig[8] == 1)begin
                    ptr <= (ptr >= 80) ? (ptr - 80) : ptr;
                end
                else if(kbsig[7] == 1)begin
                    ptr <= (ptr < 2400 - 80) ? (ptr + 80) : ptr;
                end
                else if(kbsig[6] == 1)begin
                    ptr <= (ptr < 2339) ? (ptr + 1) : ptr;
                end
                else if(kbsig[5] == 1)begin
                    ptr <= (ptr > 0) ? (ptr - 1) : ptr;
                end
                else if(kbsig[9] == 1) begin
                    ptr <= (ptr > 0) ? ptr - 1 : ptr;
                    text[(ptr > 0) ? ptr - 1 : ptr] <= 0;
                end
            end
        end
    end

    get_charpix pix(
        .c(text[80 * (addra / (640 * 16)) + (((addra % (640 * 16)) / 8) % 80)]),
        .x(xw[5:0]),
        .y(yw[5:0]),
        .in_ptr((80 * (addra / (640 * 16)) + (((addra % (640 * 16)) / 8) % 80)) == ptr),
        .is_light(out)
    );
    assign douta = (out == 1) ? 12'b111111111111 : 12'd0; 
endmodule