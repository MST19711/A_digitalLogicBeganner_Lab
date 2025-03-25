`timescale 1ns / 1ps

//`define NVB

module mem32b_top(
    output [6:0]SEG,     
    output [7:0]AN,              //��ʾ32λ�����ֵ
    output [15:0] dataout_L16b,   //������ݵ�16λ
    input CLK100MHZ,            //ϵͳʱ���ź�
    input BTNC,                 //��λ�����ź�
    input [2:0] MemOp,          //��д�ֽ��������ź�
    input we,                   //�洢��дʹ���źţ��ߵ�ƽʱ����д������
    input [3:0] addr_L4b,           //��ַλ��4λ����λ����ָ��Ϊ0����������ֵ
    input [7:0] datain_L8b          //�������ݵ�8λ�����ظ�4�Σ����λָ��Ϊ����ֵ
 );
 // Add your code here 
    wire [31:0] dataout;
    wire out_valid;
    reg [31:0]counter;
    reg [31:0] datain;
    reg [15:0] addrin;
    reg we_R;
    reg [2:0] MemOp_R;
    always@(posedge CLK100MHZ) begin
        if(BTNC && counter == 0)begin
            MemOp_R <= 3'b010;
            we_R <= 1;
            datain <= 0;
            addrin <= 0;
            counter <= counter + 1;
        end else if(counter != 0 && counter < 2**16)begin
            addrin <= counter;
            counter <= counter + 1;
        end else if(counter == 2**16)begin
            counter <= 0;
            we_R <= 0;
            MemOp_R <= MemOp;
        end else begin
            datain <= {datain_L8b, datain_L8b, datain_L8b, datain_L8b};
            addrin <= {12'b0, addr_L4b};
            we_R <= we;
            MemOp_R <= MemOp;
        end
    end
    mem32b RAM(
        .dataout(dataout),   //�������
        .clk(CLK100MHZ),                   //ʱ���ź�
        .MemOp(MemOp_R),          //��д�ֽ��������ź�
        .datain(datain),        //��������
        .addr(addrin),          //16λ�洢����ַ
        .we(we_R)
    );
    
    //assign dataout_L16b = dataout[15:0];

    seg7decimal my_seg7(
        .x(dataout),
        .clk(CLK100MHZ),
        .seg(SEG),
        .an(AN),
        .dp(0)
    );

endmodule
