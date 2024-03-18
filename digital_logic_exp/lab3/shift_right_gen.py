j = 1
for i in range(0, 32):
    shift_l = ''
    if i + j >31:
        shift_l = str("AL & din[31]")
    else:
        shift_l = "din[" + str(i+j) + "]"
    print("chose_2to1 r2_" + str(i) + "(")
    print("    .a(din[" + str(i) + "]),")
    print("    .b(" + shift_l + "),")
    print("    .c(shamt[0]),")
    print("    .o(r2["  + str(i) + "])")
    print(");")

j = 2
for i in range(0, 32):
    shift_l = ''
    if i + j >31:
        shift_l = str("AL & din[31]")
    else:
        shift_l = "r2[" + str(i+j) + "]"
    print("chose_2to1 r4_" + str(i) + "(")
    print("    .a(r2[" + str(i) + "]),")
    print("    .b(" + shift_l + "),")
    print("    .c(shamt[1]),")
    print("    .o(r4["  + str(i) + "])")
    print(");")

j = 4
for i in range(0, 32):
    shift_l = ''
    if i + j >31:
        shift_l = str("AL & din[31]")
    else:
        shift_l = "r4[" + str(i+j) + "]"
    print("chose_2to1 r8_" + str(i) + "(")
    print("    .a(r4[" + str(i) + "]),")
    print("    .b(" + shift_l + "),")
    print("    .c(shamt[2]),")
    print("    .o(r8["  + str(i) + "])")
    print(");")

j = 8
for i in range(0, 32):
    shift_l = ''
    if i + j >31:
        shift_l = str("AL & din[31]")
    else:
        shift_l = "r8[" + str(i+j) + "]"
    print("chose_2to1 r16_" + str(i) + "(")
    print("    .a(r8[" + str(i) + "]),")
    print("    .b(" + shift_l + "),")
    print("    .c(shamt[3]),")
    print("    .o(r16["  + str(i) + "])")
    print(");")

j = 16
for i in range(0, 32):
    shift_l = ''
    if i + j >31:
        shift_l = str("AL & din[31]")
    else:
        shift_l = "r16[" + str(i+j) + "]"
    print("chose_2to1 r32_" + str(i) + "(")
    print("    .a(r16[" + str(i) + "]),")
    print("    .b(" + shift_l + "),")
    print("    .c(shamt[4]),")
    print("    .o(dout["  + str(i) + "])")
    print(");")