// use reg to simulate

module img(
    input clka,
    input ena,
    input wea,
    input [31:0] addra,
    input [11:0] dina,
    output [11:0] douta
);

    
    /* verilator lint_off WIDTHTRUNC */
    wire [31:0] pix_x = addra % 640, pix_y = addra / 640;

    /* verilator lint_on WIDTHTRUNC */
    // here is the temporary test, we ignore those dangerous behaviors
    //wire [31:0] pix_data_R, pix_data_G, pix_data_B;
    //assign pix_data_R = (pix_x / 80) + (pix_y / 60);//temp_r[7:4];
    //assign pix_data_G = (pix_x / 40);//temp_g[7:4];
    //assign pix_data_B = (pix_y / 30);//temp_b[7:4];
    //assign douta = ((480 - pix_y) >((pix_x - 320)*(pix_x - 320)) / 250) ? {pix_data_R[3:0], pix_data_G[3:0], pix_data_B[3:0]} : 0 ;//pix_data;
    img_mem0 my_pic(.clka(clka),.ena(1'b1),.wea(1'b0),.addra({addra}),.dina(12'd0),.douta(douta));
endmodule