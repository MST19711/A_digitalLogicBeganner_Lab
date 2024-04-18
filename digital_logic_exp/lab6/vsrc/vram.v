// use reg to simulate

module vga_mem(
    input clka,
    input ena,
    input wea,
    input [31:0] addra,
    input [11:0] dina,
    output [11:0] douta
);

    reg [11:0] vreg [307199:0];
    initial begin
        
    end
    /* verilator lint_off WIDTHTRUNC */
    wire [3:0] pix_x = addra % 640, pix_y = addra / 640;
    /* verilator lint_on WIDTHTRUNC */
    // here is the temporary test, we ignore those dangerous behaviors
    wire [11:0] pix_data;
    assign pix_data[11:8] = -pix_x-pix_y;//temp_r[7:4];
    assign pix_data[7:4] = pix_x;//temp_g[7:4];
    assign pix_data[3:0] = pix_y;//temp_b[7:4];

    //assign output = vreg[addr];
    assign douta = pix_data;
endmodule