from PIL import Image # type: ignore

def image_to_pixel_array(image_path):
    # 打开图像文件
    image = Image.open(image_path)
    pixel_array = list(image.getdata())
    if len(pixel_array)!=307200:
        print("Warning: Wrong size of picture")
    return pixel_array

def generate_coe_file(pixel_array, coe_file_path):
    with open(coe_file_path, "w") as f:
        # 写入 COE 文件头部
        f.write("memory_initialization_radix=16;\n")
        f.write("memory_initialization_vector=\n")
        # 写入像素数据
        buff=[]
        for pixel in pixel_array:
            tmp="".join(map(lambda x:"{:02X}".format(x)[0],pixel))
            # print(tmp)
            buff.append(tmp)
        f.write(",".join(buff)+";")

picname="pic640x480"

if __name__ == "__main__":
    # 图像文件路径
    image_path = f"{picname}.jpg"
    # COE 文件路径
    coe_file_path = f"{picname}.coe"

    # 将图像转换为像素数组
    pixel_array = image_to_pixel_array(image_path)
    # 生成 COE 文件
    generate_coe_file(pixel_array, coe_file_path)
