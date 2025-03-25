`timescale 1ns / 1ps

module ALU32(
    output  [31:0] result,      //32λ������
    output  zero,               //����?0��־λ
    input   [31:0] dataa,      //32λ�������룬�͵�ALU�˿�A   
    input   [31:0] datab,      //32λ�������룬�͵�ALU�˿�B  
    input   [3:0] aluctr      //4λALU���������ź�
); 
    wire [31:0] output_BUS [0:7];
    wire OF_adder, SF_adder, CF_adder, COUT_adder;
    wire SFTctr, ALctr, SUBctr, SIGctr;
    wire [2:0] OPctr;
    wire [1:0] mux_1;
    assign mux_1[0] = SUBctr ^ COUT_adder;
    assign mux_1[1] = OF_adder ^ SF_adder;
    assign SFTctr = (aluctr == 4'b0001) ? 1'b1 : 1'b0;
    assign ALctr = (aluctr == 4'b1101) ? 1'b1 : 1'b0;
    assign SUBctr = (aluctr == 4'b0010 || aluctr == 4'b0011 || aluctr == 4'b1000) ? 1'b1 : 1'b0;
    assign SIGctr = (aluctr == 4'b0010) ? 1'b1 : 1'b0;
    assign OPctr = (aluctr == 4'b0000 || aluctr == 4'b1000) ? 3'b000 : 
                    ((aluctr == 4'b0001 || aluctr == 4'b1101) ? 3'b100 : 
                    ((aluctr == 4'b0010 || aluctr == 4'b0011) ? 3'b110 : 
                    ((aluctr == 4'b0100) ? 3'b011 : 
                    ((aluctr == 4'b0101 || aluctr == 4'b1101) ? 3'b100 : 
                    ((aluctr == 4'b0110) ? 3'b010 : 
                    ((aluctr == 4'b0111) ? 3'b001 : 3'b101))))));
    Adder32 my_adder(
        .f(output_BUS[0]),
        .OF(OF_adder),
        .SF(SF_adder), 
        .ZF(zero), 
        .CF(CF_adder),
        .cout(COUT_adder),
        .x(dataa),
        .y(datab),
        .sub(SUBctr)
    );    
    barrelsft32 my_barrel(
        .dout(output_BUS[4]),
        .din(dataa),
        .shamt(datab[4:0]),   
        .LR(SFTctr),           
        .AL(ALctr)   
    );
    assign output_BUS[1] = dataa & datab;
    assign output_BUS[2] = dataa | datab;
    assign output_BUS[3] = dataa ^ datab;
    assign output_BUS[5] = datab;
    assign output_BUS[6] = {31'b0000000000000000000000000, (mux_1[SIGctr])};
    assign output_BUS[7] = 32'b00000000000000000000000000;
    assign result = output_BUS[OPctr];
endmodule
