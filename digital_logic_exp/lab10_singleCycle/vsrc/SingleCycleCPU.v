`timescale 1ns / 1ps

module SingleCycleCPU(
	input 	      clock,
	input 	      reset,
	output [31:0] InstrMemaddr,        // ָ���?����ַ
	input  [31:0] InstrMemdataout,     // ָ������
	output        InstrMemclk,         // ָ���?����ȡʱ�ӣ�Ϊ��ʵ���첽��ȡ�����ö�ȡʱ�Ӻ�д��ʱ�ӷ���
	output [31:0] DataMemaddr,         // ���ݴ洢����ַ
	input  [31:0] DataMemdataout,      // ���ݴ洢���������?
	output [31:0] DataMemdatain,       // ���ݴ洢��д������
	output 	      DataMemrdclk,        // ���ݴ洢����ȡʱ�ӣ�Ϊ��ʵ���첽��ȡ�����ö�ȡʱ�Ӻ�д��ʱ�ӷ���
	output	      DataMemwrclk,        // ���ݴ洢��д��ʱ��
	output [2:0]  DataMemop,           // ���ݶ�д�ֽ��������ź�
	output        DataMemwe,           // ���ݴ洢��д��ʹ���ź�
	output [15:0] dbgdata              // debug�����źţ����?16λָ���?����ַ��Ч��ַ
);
	reg [31:0] pc = 2**32 - 4;                     // ���������?
	wire [31:0] instr_W;               // ָ����
	reg [31:0] pcnext;                 // ��һ��ָ����?
	reg [31:0] pcbranch;               // ��ָ֧����?
	reg [31:0] pcjump;                 // ��תָ����?
	reg [31:0] pcjal;                  // jalָ����?
	assign InstrMemaddr = pc;
	assign dbgdata = pc [15:0];
	reg [31:0] instr_R;
	assign instr_W = InstrMemdataout;//instr_R;
	always @(negedge clock) begin
		instr_R <= InstrMemdataout;
	end
	assign InstrMemclk = clock;
	assign DataMemrdclk = ~clock;
	assign DataMemwrclk = clock;
	always @(posedge clock) begin
		//$display("-------------------------");
		//$display("PC : 0x%h, instr : 0x%h", pc, instr_W);
		//$display("(NxtASrc_W == 0) ? %h, (NxtBSrc_W == 0) ? %h", (NxtASrc_W == 0), (NxtBSrc_W == 0));
		//$display("nextPC : %h + %h = %h", (NxtASrc_W == 0) ? pc : busa_W, (NxtBSrc_W == 0) ? 32'd4 : IMM_W & 32'hfffffffe, nextPC_W);
		//$display("a5 : 0x%h, ra : 0x%h", myregfile.regfiles[15], myregfile.regfiles[1]);

		//$display("PC : %d, ALUctr : %h", pc, ALUctr_W);
		//$display("ALUin_A : 0x%h, ALUin_B : 0x%h, ALUout : 0x%h", aluA_W, aluB_W, aluresult_W);
		//$display("RS1 : 0x%h, RS2 : 0x%h", rs1_W, rs2_W);
		//$display("buswa : 0x%h, buswa : 0x%h", busa_W, busb_W);
		pc <= (reset == 1) ? 0 : nextPC_W;
	end

	wire [6:0] opcode_W;      //ָ�����?7λ
	wire [4:0] rd_W;          //Ŀ�ļĴ������?5λ
	wire [2:0] funct3_W;      //3λ������
	wire [4:0] rs1_W;         //Դ�Ĵ���1���?5λ
	wire [4:0] rs2_W;         //Դ�Ĵ���2���?5λ
	wire [6:0] funct7_W;      //7λ������
	InstrParse MyInstrDec(
		.opcode(opcode_W),     //ָ�����?7λ
		.rd(rd_W),             //Ŀ�ļĴ������?5λ
		.funct3(funct3_W),     //3λ������
		.rs1(rs1_W),           //Դ�Ĵ���1���?5λ
		.rs2(rs2_W),           //Դ�Ĵ���2���?5λ
		.funct7(funct7_W),     //7λ������
		.instr(instr_W)        //ָ��   
	);
	wire [2:0] ExtOp_W;
	wire RegWr_W;
	wire ALUASrc_W;
	wire [1:0] ALUBSrc_W;
	wire [3:0] ALUctr_W;
	wire [2:0] Branch_W;
	wire MemtoReg_W;
	always @(clock)begin
		//if(MemtoReg_W == 1 && RegWr_W == 1) $display("load 0x%h from 0x%h to reg %d", busw_W, DataMemaddr, rd_W);
		//if(MemWr_W)	$display("store 0x%h to 0x%h from reg %d", busb_W, DataMemaddr, rs2_W);
	end
	wire MemWr_W;
	wire [2:0] MemOp_W;
	Control MyCtrler(
		.ExtOp(ExtOp_W),
		.RegWr(RegWr_W),
		.ALUASrc(ALUASrc_W),
		.ALUBSrc(ALUBSrc_W),
		.ALUctr(ALUctr_W),
		.Branch(Branch_W),
		.MemtoReg(MemtoReg_W),
		.MemWr(MemWr_W),
		.MemOp(MemOp_W),
		.opcode(opcode_W),
		.funct3(funct3_W),
		.funct7(funct7_W)    
	);
	wire [31:0] busa_W;
	wire [31:0] busb_W;
	wire [31:0] busw_W;
	regfile32 myregfile(
		.busa(busa_W),   		//�Ĵ���ra�������?
		.busb(busb_W),   		//�Ĵ���rb�������?
		.clk(clock),
		.ra(rs1_W),           	//���Ĵ������ra
		.rb(rs2_W),          	//���Ĵ������rb
		.rw(RW_reg),          		//д�Ĵ������rw
		.busw(busw_W),       	//д�����ݶ˿�
		.we(regfileWE_reg)	            //дʹ�ܶˣ�Ϊ1ʱ����д��
	);
	wire [31:0] IMM_W;
	InstrToImm MyImm(
		.instr(instr_W),   		//32λָ��
		.ExtOp(ExtOp_W),    		//��չ������
		.imm(IMM_W)
	);
	wire [31:0] aluA_W;
	wire [31:0] aluB_W;
	assign aluA_W = (ALUASrc_W == 0) ? busa_W : pc;
	assign aluB_W = (ALUBSrc_W == 0) ? busb_W : 
					(ALUBSrc_W == 2'b01) ? 32'd4 : IMM_W;
	wire [31:0] aluresult_W;
    wire zero_W;
    ALU32 MyALU32(
        .result(aluresult_W),      //32λ������
        .zero(zero_W),             //����?0��־λ
        .dataa(aluA_W),      //32λ����A
        .datab(aluB_W),      //32λ����B
        .aluctr(ALUctr_W)    //4λALU������
    );
	reg [31:0] ALUout_reg;
	reg regfileWE_reg = 0;
	reg [4:0] RW_reg;
	always @(posedge clock) begin
		ALUout_reg <= aluresult_W;
		regfileWE_reg <= RegWr_W;
		RW_reg <= rd_W;
	end
	assign DataMemaddr = aluresult_W;
	assign DataMemdatain = busb_W;
	assign DataMemop = MemOp_W;
    assign DataMemwe = MemWr_W;
	assign busw_W = (MemtoReg_W == 1) ? DataMemdataout : ALUout_reg;
	wire NxtASrc_W;
	wire NxtBSrc_W;
	BranchControl MyBranchControl(
		.NxtASrc(NxtASrc_W), 
		.NxtBSrc(NxtBSrc_W),
		.zero(zero_W), 
		.result0(aluresult_W[0]),
		.Branch(Branch_W)
	);
	wire [31:0] nextPC_W;
	wire emptyOF;
    wire emptySF;
    wire emptyZF;
    wire emptyCF;
    wire emptycout;
	Adder32 NextPC_adder(
		.f(nextPC_W),
		.OF(emptyOF), 
		.SF(emptySF), 
		.ZF(emptyZF), 
		.CF(emptyCF),
		.cout(emptycout),
		.x((NxtASrc_W == 0) ? pc : busa_W), 
		.y((NxtBSrc_W == 0) ? 32'd4 : IMM_W & 32'hfffffffe),
		.sub(1'b0)
	);

endmodule
