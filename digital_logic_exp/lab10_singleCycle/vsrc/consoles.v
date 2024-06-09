module consoles_display(
    input [31:0] addra,
    input clk,
    output [17:0] char_addr,
    output memread_clk,
    input [7:0] text_read,
    output [11:0] color,
    input [31:0] ptr
);
    assign memread_clk = clk;
    wire [31:0] addr_W;
    assign addr_W = (addra) % (640 * 480);//addra > 0 ? (addra - 1) % (640 * 480) : (640 * 480) - 1;
    wire [31:0] addr_temp = 80 * (addr_W / (640 * 16)) + (((addr_W % (640 * 16)) / 8) % 80);
    assign char_addr = addr_temp[17:0];
    wire [31:0] xw = addr_W % 8, yw = ((addr_W / 640) % 16);
    wire is_light;
    always @(clk)begin
        //$display("addr = %d", char_addr);
    end
    get_charpix pix(
        .c(text_read),
        .x(xw[5:0]),
        .y(yw[5:0]),
        .in_ptr(ptr[17:0] == char_addr),
        .is_light(is_light)
    );
    assign color = is_light ? 12'b111111111111 : 12'b000000000000;
endmodule

module consoles_ctrl(
    output [31:0] dataout, 
    output [7:0] textdataout,
    input Rclk_A,  
    input Rclk_B,  
    input Wclk,                
    input [2:0] MemOp,      
    input [31:0] datain,    
    input [17:0] addr_A,      
    input [17:0] addr_B,      
    input we
);
    wire [7:0] cpudataout;
    wire [31:0] outW_T;
    assign outW_T = {24'b0, cpudataout};
    assign dataout = 
                    MemOp == 3'b000 ? ({outW_T[7] == 1 ? 24'b111111111111111111111111 : 24'd0, outW_T[7:0]}) :
                    MemOp == 3'b001 ? ({outW_T[15] == 1 ? 16'b1111111111111111 : 16'd0, outW_T[15:0]}) :
                    MemOp == 3'b010 ? (outW_T[31:0]) :
                    MemOp == 3'b100 ? ({24'd0, outW_T[7:0]}) :
                    MemOp == 3'b101 ? ({16'd0, outW_T[15:0]}) :
                    0;
    consoles_mem consoles_0(
        .addr_A({14'b0, addr_A}),
        .addr_B({14'b0, addr_B}),
        .data_in(datain[7:0]),
        .we(we),
        .Rclk_A(Rclk_A),
        .Rclk_B(Rclk_B),
        .Wclk(Wclk),
        .data_out_A(cpudataout),
        .data_out_B(textdataout)
    );
    
endmodule

module consoles_mem(
    input wire [31:0] addr_A,
    input wire [31:0] addr_B,
    input wire [7:0] data_in,
    input wire we,
    input wire Rclk_A,
    input wire Rclk_B,
    input wire Wclk,
    output reg [7:0] data_out_A,
    output [7:0] data_out_B
    //output reg [7:0] data_out_B
);
    (* ram_style="block" *) reg [7:0] data [2399:0];
    /*
    initial begin
        data[0] = 8'd97;
        data[1] = 8'd98;
        data[2] = 8'd99;
        data[3] = 8'd100;
        data[4] = 8'd101;
        data[5] = 8'd102;
        data[6] = 8'd103;
        data[7] = 8'd104;
        data[8] = 8'd105;
        data[9] = 8'd106;
        data[10] = 8'd107;
        data[11] = 8'd108;
        data[12] = 8'd109;
        data[13] = 8'd110;
        data[14] = 8'd111;
        data[15] = 8'd112;
        data[16] = 8'd113;
        data[17] = 8'd114;
        data[18] = 8'd115;
        data[19] = 8'd116;
        data[20] = 8'd117;
        data[21] = 8'd118;
        data[22] = 8'd119;
        data[23] = 8'd120;
        data[24] = 8'd121;
        data[25] = 8'd122;
    end
    */
    always @(negedge Rclk_A)begin
        data_out_A <= data[(addr_A <= 2399) ? addr_A : 0];
    end
    /*
    always @(negedge Rclk_B)begin
        data_out_B <= data[(addr_B <= 2399) ? addr_B : 0];
    end
    */
    assign data_out_B = data[(addr_B <= 2399) ? addr_B : 0];
    always @(posedge Wclk) begin
        if(we && addr_A <= 2399) begin
            data[addr_A] <= data_in;
            //$display("write console !!!!!");
        end
    end
    
endmodule