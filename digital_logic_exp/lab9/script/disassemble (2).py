import sys
# 文件地址
filename = sys.argv[1]
# 是否打印行号
LN = True
# 是否打印16进制程序码
code = True
# 是否彩色打印
color = False
"""
    彩色输出用于提示某些特殊的指令,
    在RISC-V指令集中存在与操作系统有关的指令，这些指令我们是无需实现的
    本产品仅进行反汇编，并没有内置立即数符号或无符号拓展功能，请注意    
"""   
def toHex(ss: str) -> str:
    val = 0
    for i in range(len(ss)):
        val += 2**(len(ss)-i-1) * int(ss[i])
    return hex(val)   

def getImm(ss: str) -> int:
    val = 0
    for i in range(len(ss)):
        val += 2**(len(ss)-i-1) * int(ss[i])
    return val

with open(filename, "r") as f:
    lines = f.readlines()
    num = 1
    for line in lines:
        line = line.strip()
        if line != r"@00000000":
            if LN: print(f"{num}:  ",end="")
            num = num + 1
            print(f"{line}\t",end="")
            op : str = ""
            for ss in line:
                if ss == "0": op+="0000"
                elif ss == "1": op+="0001"
                elif ss == "2": op+="0010"
                elif ss == "3": op+="0011"
                elif ss == "4": op+="0100"
                elif ss == "5": op+="0101"
                elif ss == "6": op+="0110"
                elif ss == "7": op+="0111"
                elif ss == "8": op+="1000"
                elif ss == "9": op+="1001"
                elif ss == "A": op+="1010"
                elif ss == "B": op+="1011"
                elif ss == "C": op+="1100"
                elif ss == "D": op+="1101"
                elif ss == "E": op+="1110"
                elif ss == "F": op+="1111"
            
               
            if op[25:32] == "0110111":
                # lui
                rd = toHex(op[20:25]) 
                immh = toHex(op[0:20])
                print(f"lui ${rd} {immh}")
                pass
            elif op[25:32] == "0010111":
                # auipc
                rd = toHex(op[20:25]) 
                immh = toHex(op[0:20])
                print(f"auipc ${rd} {immh}")
                pass
            elif op[25:32] == "0010011":
                # I-type
                immh = toHex(op[0:12])
                rs1 = toHex(op[12:17])
                rd = toHex(op[20:25])
                fdict = {"000":"addi","011":"sltiu","100":"xori","110":"ori","010":"slti","111":"andi"}
                assert(op[17:20] in fdict)
                fname = fdict[op[17:20]]
                print(f"{fname} ${rd} ${rs1} {immh}")
                pass
            elif op[25:32] == "0110011":
                # R-type
                func = op[1]+op[17:20]
                rs1 = toHex(op[12:17])
                rs2 = toHex(op[7:12])
                rd = toHex(op[20:25]) 
                fdict = {"0001":"slli","0101":"shi","1101":"srai","0000":"add","1000":"sub","0001":"sll","0010":"slt","0011":"sltu","0100":"xor","0101":"srl","1101":"sra","0110":"or","0111":"and"}
                assert(func in fdict)
                fname = fdict[func]               
                print(f"{fname} ${rd} ${rs1} ${rs2}")
                pass
            elif op[25:32] == "1101111":
                # jal
                rd = toHex(op[20:25]) 
                imm : str = op[0]+op[12:20]+op[12]+op[1:11]
                immh = toHex(imm)
                print(f"jal ${rd} {immh}")
                pass
            elif op[25:32] == "1100111":
                # jalr
                rd = toHex(op[20:25]) 
                immh = toHex(op[0:12])
                rs1 = toHex(op[12:17])
                assert(op[17:2] == "000") # jalr has funct3 only 000
                print(f"jalr ${rd} ${rs1} {immh}")
                pass
            elif op[25:32] == "1100011":
                # B-type
                imm = op[0]+op[24]+op[1:7]+op[20:24]
                immh = toHex(imm)
                rs1 = toHex(op[12:17])
                rs2 = toHex(op[7:12])
                funct3 = op[17:20]
                fdict = {"000":"beq","001":"bne","100":"blt","101":"bge","110":"bltu","111":"bgeu"}
                assert(op[17:20] in fdict)
                fname = fdict[funct3]
                print(f"{fname} ${rs1} ${rs2} {immh}")
                pass
            elif op[25:32] == "0000011":
                # Load
                immh = toHex(op[0:12])
                rs1 = toHex(op[12:17])
                rd = toHex(op[20:25]) 
                fdict = {"000":"lb","001":"lh","100":"lbu","101":"lhu","010":"lw"}
                assert(op[17:20] in fdict)
                fname = fdict[op[17:20]]
                print(f"{fname} ${rd} {immh}(${rs1})")
                pass
            elif op[25:32] == "0100011":
                # Store
                rs1 = toHex(op[12:17])
                rs2 = toHex(op[7:12])
                imm = op[0:7]+op[20:25]
                immh = toHex(imm)
                fdict = {"000":"sb","001":"sh","010":"sw"}
                assert(op[17:20] in fdict)
                fname = fdict[op[17:20]]
                print(f"{fname} ${rs2} {immh}(${rs1})") 
                pass
            elif op[25:32] == "1110011":
                if op[11] == 1: 
                    if color: 
                        print("\033[33mecall\033[0m")
                    else:
                        print("ecall")
                else: 
                    if color: 
                        print("\033[33mebreak\033[0m")
                    else:
                        print("ebreak")
            elif op[25:32] == "0000000":
                print("nop")
            else:
                if color:
                    print(f"\033[31munknown opcode: {op[25:32]}\033[0m")
                else:
                    print(f"unknown opcode: {op[25:32]}")
                
                
                
                
                
            
            
            
            