`timescale 1ns/1ps

module PiplineCPU (
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
	output [15:0] dbgdata,              // debug�����źţ����?16λָ���?����ַ��Ч��ַ
    input clk,
    input rst
);
    wire [31:0] PCF;
    wire [31:0] PCPlus4F, instrD, PCD, PCPlus4D, SrcAE;
    wire [4:0]  A1, A2, RdD, RdW, RdE, RdM, Rs1E, Rs2E, Rs1D, Rs2D;
    wire [6:0]  OP;
    wire [2:0]  funct3, funct3E;
    wire        funct7;
    wire        WE3;
    wire        RegWriteW;
    wire        RegWriteD;
    wire        MemWriteD;
    wire        JumpD;
    wire        BranchD;
    wire        ALUSrcD;
    wire        ZeroE;
    wire        RegWriteE;
    wire        MemWriteE, JumpE, BranchE, ALUSrcE, PCSrcE;

    wire [24:0] Imm;
    wire [6:0]  funct77;
    wire [31:0] ResultW, RD1, RD2;
    wire [31:0] ImmExtD;
    wire [2:0]  ImmSrcD;
    wire [1:0]  ResultSrcD, ResultSrcE, ResultSrcM, ResultSrcW;
    wire [4:0]  ALUControlD, ALUControlE;
    wire [31:0] RD1E, RD2E, PCE, ImmExtE, PCPlus4E;
    wire [31:0] PCTargetE;
    wire [31:0] SrcBE;
    wire [31:0] ALUResult, ALUResultM, ALUResultW;
    wire [31:0] WriteDataM, PCPlus4M, PCPlus4W;
    wire        CarryOut, RegWriteM, MemWriteM;
    wire [31:0] ReadData, ReadDataW, WriteDataE ;
    wire [1:0]  ForwardAE, ForwardBE;
    wire        StallF, StallD, FlushE, FlushD;




    nextPC nextPC (
        .rst      (rst      ),
        .clk      (clk      ),
        .PCSrcE   (PCSrcE   ),
        .StallF   (StallF   ),
        .PCPlus4F (PCPlus4F ),
        .PCTargetE(PCTargetE),
        .PCF      (PCF      )
    );
    assign InstrMemaddr = PCF;
    assign instruction = InstrMemdataout;
    assign InstrMemclk = ~clk;

    first_register i_1 (
        .clk        (clk        ),
        .rst        (rst        ),
        .StallD     (StallD     ),
        .FlushD     (FlushD     ),
        .instruction(instruction),
        .PCF        (PCF        ),
        .PCPlus4F   (PCPlus4F   ),
        .instrD     (instrD     ),
        .PCD        (PCD        ),
        .PCPlus4D   (PCPlus4D   )
    );

    reg [31:0] PCPlus4F_R;
    assign PCPlus4F = PCPlus4F_R;
    always @(PCF) begin
        PCPlus4F_R = PCF + 4;
    end

    reg [4:0] A1_r;
    reg [4:0] A2_r;
    reg [4:0] RdD_r;
    reg [4:0] OP_r;
    reg [4:0] funct3_r;
    reg [4:0] funct7_r;
    reg [4:0] Imm_r;
    reg [4:0] funct77_r;
    reg [4:0] Rs1D_r;
    reg [4:0] Rs2D_r;

    assign A1 = A1_r;
    assign A2 = A2_r;
    assign RdD = RdD_r;
    assign OP = OP_r;
    assign funct3 = funct3_r;
    assign funct7 = funct7_r;
    assign Imm = Imm_r;
    assign funct77 = funct77_r;
    assign Rs1D = Rs1D_r;
    assign Rs2D = Rs2D_r;
    
    always @ instrD begin
        A1_r      = instrD[19:15];
        A2_r      = instrD[24:20];
        RdD_r     = instrD[11:7];
        O_rP      = instrD[6:0];
        funct3_r  = instrD[14:12];
        funct7_r  = instrD[30];
        Imm_r     = instrD[31:7];
        funct77_r = instrD[31:25];
        Rs1D_r    = instrD[19:15];
        Rs2D_r    = instrD[24:20];
    end

    myregfile Register_File(
		.busa(RD1),   		//�Ĵ���ra�������?
		.busb(RD2),   		//�Ĵ���rb�������?
		.clk(~clk),
		.ra(A1),           	//���Ĵ������ra
		.rb(A2),          	//���Ĵ������rb
		.rw(RdW),          		//д�Ĵ������rw
		.busw(ResultW),       	//д�����ݶ˿�
		.we(RegWriteW)	            //дʹ�ܶˣ�Ϊ1ʱ����д��
	);
    
    InstrToImm MyImm(
		.instr({Imm_r, 7'd0}),   		//32λָ��
		.ExtOp(ImmSrcD),    		//��չ������
		.imm(ImmExtD)
	);

    Second_register i_2(
        .PCD         (PCD        ),
        .ImmExtD     (ImmExtD    ),
        .PCPlus4D    (PCPlus4D   ),
        .RD1         (RD1        ),
        .RD2         (RD2        ),
        .RdD         (RdD        ),
        .Rs1D        (Rs1D       ),
        .Rs2D        (Rs2D       ),
        .funct3      (funct3     ),
        .rst         (rst        ),
        .clk         (clk        ),
        .RegWriteD   (RegWriteD  ),
        .MemWriteD   (MemWriteD  ),
        .JumpD       (JumpD      ),
        .BranchD     (BranchD    ),
        .ALUSrcD     (ALUSrcD    ),
        .ZeroE       (ZeroE      ),
        .FlushE      (FlushE     ),
        .ResultSrcD  (ResultSrcD ),
        .ALUControlD (ALUControlD),
        .RegWriteE   (RegWriteE  ),
        .MemWriteE   (MemWriteE  ),
        .JumpE       (JumpE      ),
        .BranchE     (BranchE    ),
        .ALUSrcE     (ALUSrcE    ),
        .PCSrcE      (PCSrcE     ),
        .ResultSrcE  (ResultSrcE ),
        .ALUControlE (ALUControlE),
        .PCE         (PCE        ),
        .ImmExtE     (ImmExtE    ),
        .PCPlus4E    (PCPlus4E   ),
        .RD1E        (RD1E       ),
        .RD2E        (RD2E       ),
        .funct3E     (funct3E    ),
        .RdE         (RdE        ),
        .Rs1E        (Rs1E       ),
        .Rs2E        (Rs2E       )
    );
    reg [31:0] PCTargetE_R;
    assign PCTargetE = PCTargetE_R;
    always @ (PCE, ImmExtE) begin
        PCTargetE_R = PCE + ImmExtE;        
    end

    assign SrcBE = ALUSrcE ?  ImmExtE : WriteDataE;
    wire ZeroE_emp;
    ALU32 i_alu(
        .result(ALUResult),      //32λ������
        .zero(ZeroE_emp),               //����?0��־λ
        .dataa(SrcAE),      //32λ�������룬�͵�ALU�˿�A   
        .datab(SrcBE),      //32λ�������룬�͵�ALU�˿�B  
        .aluctr(ALUControlE)      //4λALU���������ź�
    ); 
    reg ZeroE_R;
    assign ZeroE = ZeroE_R;
    always @ (*) 
        begin
            case(funct3E)
            3'b000:   ZeroE_R =  SrcAE == SrcBE; //beq
            3'b001:   ZeroE_R =  SrcAE != SrcBE; //bne
            3'b100:   ZeroE_R =  SrcAE < SrcBE;  //blt
            3'b101:   ZeroE_R =  SrcAE > SrcBE;  //bge
            3'b110:   ZeroE_R =  SrcAE < SrcBE;  //bltu
            3'b111:   ZeroE_R =  SrcAE >= SrcBE; //bgeu
            default : ZeroE_R =  0;
	   endcase
	end

    third_register i_3 (
        .WriteDataE (WriteDataE),
        .ALUResult  (ALUResult ),
        .PCPlus4E   (PCPlus4E  ),
        .RdE        (RdE       ),
        .clk        (clk       ),
        .rst        (rst       ),
        .RegWriteE  (RegWriteE ),
        .MemWriteE  (MemWriteE ),
        .ResultSrcE (ResultSrcE),
        .ALUResultM (ALUResultM),
        .WriteDataM (WriteDataM),
        .PCPlus4M   (PCPlus4M  ),
        .RdM        (RdM       ),
        .RegWriteM  (RegWriteM ),
        .MemWriteM  (MemWriteM ),
        .ResultSrcM (ResultSrcM)
    );
    assign DataMemaddr = ALUResultM;
    assign Datamemdatain = WriteDataM;
    assign DataMemrdclk = clk;
    assign ReadData = DataMemdataout;
    assign DataMemwe = MemWriteM;


    fourth_register i_4 (
        .ALUResultM (ALUResultM),
        .ReadData   (ReadData  ),
        .PCPlus4M   (PCPlus4M  ),
        .RdM        (RdM       ),
        .rst        (rst       ),
        .clk        (clk       ),
        .RegWriteM  (RegWriteM ),
        .ResultSrcM (ResultSrcM),
        .ALUResultW (ALUResultW),
        .ReadDataW  (ReadDataW ),
        .PCPlus4W   (PCPlus4W  ),
        .RdW        (RdW       ),
        .ResultSrcW (ResultSrcW),
        .RegWriteW  (RegWriteW )
    );

    assign ResultW = ResultSrcW[1] ? PCPlus4W : (ResultSrcW[0] ? ReadDataW : ALUResultW);

    Controller i_c (
        .OP          (OP         ),
        .funct77     (funct77    ),
        .funct3      (funct3     ),
        .funct7      (funct7     ),
        .MemWriteD   (MemWriteD  ),
        .ALUSrcD     (ALUSrcD    ),
        .RegWriteD   (RegWriteD  ),
        .BranchD     (BranchD    ),
        .JumpD       (JumpD      ),
        .ResultSrcD  (ResultSrcD ),
        .ALUControlD (ALUControlD),
        .ImmSrcD     (ImmSrcD    )
    );

    hazard_unit i_hu (
        .Rs1E      (Rs1E      ),
        .Rs2E      (Rs2E      ),
        .RdM       (RdM       ),
        .RdW       (RdW       ),
        .Rs1D      (Rs1D      ),
        .Rs2D      (Rs2D      ),
        .RdE       (RdE       ),
        .ResultSrcE(ResultSrcE),
        .RegWriteM (RegWriteM ),
        .RegWriteW (RegWriteW ),
        .PCSrcE    (PCSrcE    ),
        .StallF    (StallF    ),
        .StallD    (StallD    ),
        .FlushE    (FlushE    ),
        .FlushD    (FlushD    ),
        .ForwardAE (ForwardAE ),
        .ForwardBE (ForwardBE )
    );

    assign SrcAE = ForwardAE[1] ? ALUResultM : (ForwardAE[0] ? ResultW : RD1E);

    assign WriteDataE = ForwardBE[1] ? ALUResultM : (ForwardBE[0] ? ResultW : RD2E);
endmodule