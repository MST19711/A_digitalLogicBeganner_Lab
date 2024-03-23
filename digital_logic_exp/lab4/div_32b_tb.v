`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/02 20:08:55
// Design Name: 
// Module Name: div_32u_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module div_32b_tb( );
  parameter N = 32;               // ����λ��
  integer SEED = 1;              // ���岻ͬ���������
     reg clk, rst;
     integer x, y;
     reg in_valid;
      wire signed [N-1:0] q,r;
     wire  out_valid;
     wire  in_error;

  div_32b my_div_32b (.Q(q),.R(r),.out_valid(out_valid),.in_error(in_error),.clk(clk),.rst(rst),.X(x),.Y(y),.in_valid(in_valid)); // 
  
    integer temp_Q,temp_R;
   integer i, errors;
  task checkP;
    begin
      temp_Q = x / y;
      temp_R = x % y;
         // $display("R : %d\n", r);
         //if (out_valid)begin
            //$display("%d......%d\n", q, r);
         //end
       if (out_valid &&((temp_Q !=q)||(temp_R !=r))) begin
        errors=errors+1;
        $display($time," Error: x=%d, y=%d, expected Quot= %d, Rem=%d(%h),got Quot= %d,Rem=%d(%h)",
                 x, y, temp_Q,temp_R,temp_R, q,r, r); 
        end
    end
  endtask


  initial begin : TB   // Start testing at time 0
     clk = 0;
	 forever 
	#2 clk = ~clk;	     //ģ��ʱ���ź�
  end

  initial 
   begin	
    $dumpfile("div_32b_tb.vcd");
    $dumpvars(0, div_32b_tb);
    errors = 0;
           x = $random(SEED);                        // Set pattern based on seed parameter
   for (i=0; i<10000; i=i+1) begin                //����10000��
        rst = 1'b0;
        #2
        rst = 1'b1;                             //�ϵ��1us��λ�ź�
        x=$random; y=$random;
//	    x=0; y=1;
      //$display("%d : %d / %d = ",i, x, y); 
     	#2
    	rst = 1'b0;	
	    in_valid=1'b1;                        //��ʼ������
	    #5
	    in_valid=1'b0;
	    #150;	                          // wait 150 ns, then check result
	     checkP;
      end  
    $display($time, " Divider32U test end. Errors %d .",errors); 
    $stop(1);          // end test
  end



endmodule
