module cache #(
    parameter OFFSET_WIDTH = 3,                // 块内（偏移）地址宽度，需根据实验要求进行修改
    parameter INDEX_WIDTH  = 6,                // Cache组数地址宽度，需根据实验要求进行修改
    parameter ADDR_WIDTH   = 32,               // 存储器地址宽度
    parameter DATA_WIDTH   = 32,               // 数据位宽度
    // Local parameters
    parameter BLOCK_SIZE   = 1 << OFFSET_WIDTH,                         // 块内地址
    parameter CACHE_DEPTH  = 1 << INDEX_WIDTH,                          // Cache组数
    parameter BLOCK_WIDTH  = DATA_WIDTH * BLOCK_SIZE,                   // Cache块的存储
    parameter TAG_WIDTH    = ADDR_WIDTH - OFFSET_WIDTH - INDEX_WIDTH    // 标签Tag的宽度
) (
    // From CPU
    input                        clk,                     //时钟信号
    input                        rst,                     //复位信号
    input                        read_in,                 //读取Cache信号
    input                        write_in,                //写入Cache信号
    input [3 : 0]                byte_w_en_in,           //读写字节数写使能信号，单热点编码
    input [ADDR_WIDTH - 1 : 0]   addr,                   //指令Cache地址
    input [DATA_WIDTH - 1 : 0]   data_from_reg,          //写入数据
    // To CPU
    output                       mem_stall,
    output [DATA_WIDTH - 1 : 0]  data_out,               //读取Cache的数据
 
    // From RAM
    input                        ram_ready,              // 存储器就绪信号
    input [BLOCK_WIDTH - 1 : 0]  block_from_ram,         //  当缺失时载入的内存块
    // To RAM
    output                       ram_en_out,            // 存储器输出使能信号
    output                       ram_write_out,         // 存储器写使能输出信号
    output [ADDR_WIDTH - 1  : 0] ram_addr_out,
    output [BLOCK_WIDTH - 1 : 0] data_wb,               // 回写 Cache块数据

    // debug
    output reg  [2:0] status,   //Cache 当前状态，表明 cache 是否*已经*发生缺失以及缺失类型，长度可修改
    output reg  [2:0] counter   // 块内偏移指针/迭代器，用于载入块时逐字写入，可修改。

);
// Add your code here 
    
endmodule

 