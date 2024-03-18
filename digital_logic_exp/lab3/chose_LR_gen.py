for i in range(0, 32):
    print("chose_2to1 LR_{}(".format(str(i)))
    print("    .a(S_R[{}]),".format(str(i)))
    print("    .b(S_L[{}]),".format(str(i)))
    print("    .c(LR),")
    print("    .o(dout[{}])".format(str(i)))
    print(");")