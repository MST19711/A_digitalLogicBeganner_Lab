while True:
    line = input()
    line = line.split(" ")
    a = line[0].replace("@", "")
    b = line[2]
    if b != "00":
       print("if(kbc == 0x{}) c = 0x{};".format(a, b))
