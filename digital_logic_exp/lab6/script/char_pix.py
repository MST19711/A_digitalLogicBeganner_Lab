# 打开二进制文件
with open('/Users/cx_li/Documents/Github/digitalLogic_Lab/digital_logic_exp/lab6/vsrc/ASC16', 'rb') as file:
    counter = 0
    # 逐个字节读取文件内容
    byte = file.read(1)
    while byte:
        # 处理每个字节，例如打印它
        if counter % 16 == 0:
            # print(";\nfont[{}] = 128'h{}".format(str(counter // 32), str(byte.hex())), end='')
            print("\n{}".format(str(byte.hex())), end='')
        else:
            print(str(byte.hex()), end='')
        # 读取下一个字节
        counter += 1
        byte = file.read(1)
