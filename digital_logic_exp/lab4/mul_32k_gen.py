for i in range(1, 32):
    print("wire [31:0] L{}, C{};".format(str(i), str(i)))
    for j in range(0, 31):
        print("adder_1 adder{}(.a(X[{}] & Y[{}]), .b(L{}[{}]), .cin(C{}[{}]), .f(L{}[{}]), .cout(C{}[{}]));".format(str(i) + "_" + str(j), str(j), str(i), str(i-1), str(j+1), str(i-1), str(j), str(i), str(j), str(i), str(j)))
    print("assign L{}[31] = X[31] & Y[{}];".format(str(i), str(i)))
    