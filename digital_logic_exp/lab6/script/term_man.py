f = "-------Xterminal--------------------------[211502008]--[Chengxi_Li]--[23:4:23]--"
i = 0
for c in f:
    print("assign text[{}] = 8'd{};".format(str(i), str(ord(c))))
    i += 1

f = "[G]raphics                                                                      "
for c in f:
    print("assign text[{}] = 8'd{};".format(str(i), str(ord(c))))
    i += 1

f = "[I]mage                                                                         "
for c in f:
    print("assign text[{}] = 8'd{};".format(str(i), str(ord(c))))
    i += 1

f = "[T]xt                                                                           "
for c in f:
    print("assign text[{}] = 8'd{};".format(str(i), str(ord(c))))
    i += 1

f = "[C]alculator                                                                    "
for c in f:
    print("assign text[{}] = 8'd{};".format(str(i), str(ord(c))))
    i += 1

f = "-                                                                               "
for c in f:
    print("assign text[{}] = 8'd{};".format(str(i), str(ord(c))))
    i += 1
