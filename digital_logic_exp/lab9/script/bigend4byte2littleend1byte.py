import sys

def hex_to_bytes(hex_str):
    return bytes.fromhex(hex_str)

def main():
    if len(sys.argv) != 2:
        print("Usage: python hex_reverse.py <input_file>")
        sys.exit(1)

    with open(sys.argv[1], "r") as f:
        lines = f.readlines()

    for line in lines:
        hex_str = line.strip()
        hex_str = hex_str.replace("@", "")
        if not hex_str or '#' in hex_str:
            continue
        print(hex_str)
        print(hex_str[6:8])
        print(hex_str[4:6])
        print(hex_str[2:4])
        print(hex_str[0:2])
        #将其写入另一个文件
        with open(sys.argv[1].replace(".hex", "_littleEnd_1byte.hex"), "a") as f:  
            f.write(hex_str[6:8])
            f.write("\n")
            f.write(hex_str[4:6])
            f.write("\n")
            f.write(hex_str[2:4])
            f.write("\n")
            f.write(hex_str[0:2])
            f.write("\n")

if __name__ == "__main__":
    main()