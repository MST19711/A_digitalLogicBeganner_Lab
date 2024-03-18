j = 1
for i in range(0, 32):
    shift_l = ''
    if i - j < 0:
        shift_l = '1\'b0'
    else:
        shift_l = "din[" + str(i-j) + "]"
    print("chose_2to1 l2_" + str(i) + "(")
    print("    .a(din[" + str(i) + "]),")
    print("    .b(" + shift_l + "),")
    print("    .c(shamt[0]),")
    print("    .o(l2["  + str(i) + "])")
    print(");")

j = 2
for i in range(0, 32):
    shift_l = ''
    if i - j < 0:
        shift_l = '1\'b0'
    else:
        shift_l = "l2[" + str(i-j) + "]"
    print("chose_2to1 l4_" + str(i) + "(")
    print("    .a(l2[" + str(i) + "]),")
    print("    .b(" + shift_l + "),")
    print("    .c(shamt[1]),")
    print("    .o(l4["  + str(i) + "])")
    print(");")

j = 4
for i in range(0, 32):
    shift_l = ''
    if i - j < 0:
        shift_l = '1\'b0'
    else:
        shift_l = "l4[" + str(i-j) + "]"
    print("chose_2to1 l8_" + str(i) + "(")
    print("    .a(l4[" + str(i) + "]),")
    print("    .b(" + shift_l + "),")
    print("    .c(shamt[2]),")
    print("    .o(l8["  + str(i) + "])")
    print(");")

j = 8
for i in range(0, 32):
    shift_l = ''
    if i - j < 0:
        shift_l = '1\'b0'
    else:
        shift_l = "l8[" + str(i-j) + "]"
    print("chose_2to1 l16_" + str(i) + "(")
    print("    .a(l8[" + str(i) + "]),")
    print("    .b(" + shift_l + "),")
    print("    .c(shamt[3]),")
    print("    .o(l16["  + str(i) + "])")
    print(");")

j = 16
for i in range(0, 32):
    shift_l = ''
    if i - j < 0:
        shift_l = '1\'b0'
    else:
        shift_l = "l16[" + str(i-j) + "]"
    print("chose_2to1 l32_" + str(i) + "(")
    print("    .a(l16[" + str(i) + "]),")
    print("    .b(" + shift_l + "),")
    print("    .c(shamt[4]),")
    print("    .o(dout["  + str(i) + "])")
    print(");")