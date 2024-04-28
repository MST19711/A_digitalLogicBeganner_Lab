module Calculator(
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
    reg [31:0] ptr = 0;
    wire [31:0] xw = addra % 8, yw = ((addra / 640) % 16);
    get_charpix pix(
        .c(text[80 * (addra / (640 * 16)) + (((addra % (640 * 16)) / 8) % 80)]),
        .x(xw[5:0]),
        .y(yw[5:0]),
        .in_ptr((80 * (addra / (640 * 16)) + (((addra % (640 * 16)) / 8) % 80)) == ptr),
        .is_light(out)
    );
    reg [31:0] i, j;
    reg [2:0]state;//error : 7
    reg [31:0]num_stack[79:0];
    reg [31:0]temp;
    reg [3:0]sim_stack[79:0];
    reg [31:0]sp;
    always @(posedge clk) begin
        // $display("state : %d", state);
        if(available == 1)begin
            if(state == 3'd6)begin
                if(i == 0)begin
                    state <= 0;
                    j <= 0;
                    ptr <= 0;
                end else begin
                    i <= i - 1;
                end
                text[i] <= 0;
            end else if(state == 3'd7)begin
                state <= 6;
                i <= ptr;
                text[80] <= 8'd115;
                text[81] <= 8'd121;
                text[82] <= 8'd110;
                text[83] <= 8'd116;
                text[84] <= 8'd97;
                text[85] <= 8'd120;
                text[86] <= 8'd32;
                text[87] <= 8'd101;
                text[88] <= 8'd114;
                text[89] <= 8'd114;
                text[90] <= 8'd111;
                text[91] <= 8'd114;
                text[92] <= 8'd32;
                text[93] <= 8'd33;
                text[94] <= 8'd33;
                text[95] <= 8'd33;
                text[96] <= 8'd33;
                text[97] <= 8'd33;
            end else if(state == 3'd4)begin
                if(j == 0)begin
                    state <= 0;
                    ptr <= 0;
                end else if(i == 0)begin
                    j <= j - 1;
                    text[j] <= text[i];
                end else begin
                    i <= i - 1;
                    j <= j - 1;
                    if(i == ptr)begin
                        text[j] <= 8'd61;
                    end else begin
                        text[j] <= text[i];
                    end
                end
                text[i] <= 0;
            end
            if(state == 3'd3)begin
                //$display("state 3 j : %d", j);
                if(num_stack[0] / 10 == 0)begin
                    state <= 3'd4;
                    num_stack[0] <= 0;
                    sim_stack[0] <= 0;
                end
                /* verilator lint_off WIDTHTRUNC */
                text[j] <= (num_stack[0] % 10) + 32'd48;
                num_stack[0] <= num_stack[0] / 10;
                j <= j - 1;
                /* verilator lint_on WIDTHTRUNC */
            end
            if(state == 3'd2)begin
                $display("state 2 i = %d\nptr = %d\n temp = %d", i, ptr, temp);
                if(i == ptr)begin
                    state <= 3'd3;
                    j <= 32'd159;
                end else begin
                    i <= i + 1;
                end
                if(text[i] <= 8'd57 && text[i] >= 8'd48)begin
                    case (text[i])
                        8'd48:   temp <= (temp * 10) + 32'd0;
                        8'd49:   temp <= (temp * 10) + 32'd1;
                        8'd50:   temp <= (temp * 10) + 32'd2;
                        8'd51:   temp <= (temp * 10) + 32'd3;
                        8'd52:   temp <= (temp * 10) + 32'd4;
                        8'd53:   temp <= (temp * 10) + 32'd5;
                        8'd54:   temp <= (temp * 10) + 32'd6;
                        8'd55:   temp <= (temp * 10) + 32'd7;
                        8'd56:   temp <= (temp * 10) + 32'd8;
                        8'd57:   temp <= (temp * 10) + 32'd9;
                        default : ;
                    endcase
                end else if(text[i] != 8'd40 && text[i] != 8'd41)begin
                    if(sim_stack[sp] != 4'd0)begin
                        case (sim_stack[sp])
                            4'd1:begin
                                num_stack[sp] <= num_stack[sp] + temp;
                            end 
                            4'd2:begin
                                num_stack[sp] <= num_stack[sp] - temp;
                            end 
                            4'd3:begin
                                num_stack[sp] <= num_stack[sp] * temp;
                            end 
                            4'd4:begin
                                num_stack[sp] <= num_stack[sp] / temp;
                            end 
                            default : ;
                        endcase
                    end else begin
                        num_stack[sp] <= temp;
                    end
                    temp <= 0;
                    case (text[i])
                        8'd43:begin
                            sim_stack[sp] <= 4'd1;
                        end 
                        8'd45:begin
                            sim_stack[sp] <= 4'd2;
                        end 
                        8'd42:begin
                            sim_stack[sp] <= 4'd3;
                        end 
                        8'd47:begin
                            sim_stack[sp] <= 4'd4;
                        end 
                        default:begin
                            if(i != ptr)begin
                                state <= 3'd7;
                            end
                        end
                    endcase
                end
            end else if(state == 3'd1)begin
                if(ptr == 32'd2400)begin
                    ptr <= 0;
                    state <= 0;
                end else begin
                    text[ptr] <= 0;
                    ptr <= ptr + 1;
                end
            end else if(state == 3'd0)begin
                if(in_valid == 1)begin
                    $display("ascii : %d", ascii_in);
                    if(ascii_in == 8'h0D)begin
                        i <= 0;
                        num_stack[0] <= 0;
                        sim_stack[0] <= 0;
                        sp <= 0;
                        state <= 3'd2;
                    end else begin
                        if(kbsig[3] == 1 && ascii_in == 100)begin
                            ptr <= 0;
                            state <= 3'd1;
                        end else begin
                            if(ascii_in != 8'd32)begin
                                text[ptr] <= ascii_in;
                                if(kbsig[8] == 0 & kbsig[7] == 0 & kbsig[6] == 0 & kbsig[5] == 0 & kbsig[9] == 0)begin
                                    ptr <= (ptr < 2399) ? ptr + 1 : ptr;
                                end
                            end
                        end
                    end
                end/*
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
                end*/
                else if(kbsig[9] == 1) begin
                    ptr <= (ptr > 0) ? ptr - 1 : ptr;
                    text[(ptr > 0) ? ptr - 1 : ptr] <= 0;
                end
            end
        end
    end

    assign douta = (out == 1) ? 12'b111111111111 : 12'd0; 
endmodule