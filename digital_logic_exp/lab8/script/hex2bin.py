import sys

# 获取命令行参数
path = sys.argv[1]
with open(path, 'r') as hex_file, open(path.replace("hex", "bin"), 'wb') as bin_file:
    # 读取文本文件的每一行
    bin_file.write(bytes.fromhex("0000"))
    for line in hex_file:
        # 去除行尾的空白字符（如果有的话）
        line = line.strip()
        # 忽略空行或注释（以 # 开头的行）
        if not line or line.startswith('#'):
            continue
        # 将十六进制字符串转换为字节
        byte_data = bytes.fromhex(line.replace('@', ''))
        # 写入二进制文件
        bin_file.write(byte_data)