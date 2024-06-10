import struct
import sys

# 检查命令行参数
if len(sys.argv) > 1:
    filename = sys.argv[1]  # 从命令行获取文件名

# 打开二进制文件和目标文件
with open(filename, 'rb') as src, open(filename.replace("bin", "hex"), 'w') as out:
    while True:
        # 读取4个字节
        bytes_read = src.read(4)
        if not bytes_read:
            break  # 文件结束

        # 将4个字节解析为大端序的整数
        number = struct.unpack('<I', bytes_read)[0]

        # 将整数以十六进制形式写入目标文件，每行一个
        out.write(f'{number:08X}\n')
