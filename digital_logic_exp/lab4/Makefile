.PHONY : simulate_regfile32, simulate_encryption6b simulate clean mul_32b mul_32k div_32b rv32m

FILES = $(wildcard $(project_name)*.v)
vvp_files = $(wildcard *.vvp)
vcd_files = $(wildcard *.vcd)
sim_file = $(wildcard *_sim)

mul_32b:
	iverilog -o mul_32b_sim.vvp mul_32b.v Adder32.v mul_32b_tb.v 
	vvp -n mul_32b_sim.vvp -lxt2

mul_32k:
	iverilog -o mul_32k_sim.vvp mul_32k.v Adder32.v mul_32k_tb.v 
	vvp -n mul_32k_sim.vvp -lxt2

div_32b:
	iverilog -o div_32b_sim.vvp div_32u.v div_32b.v Adder32.v div_32b_tb.v 
	vvp -n div_32b_sim.vvp -lxt2

rv32m:
	iverilog -o rv32m_sim.vvp rv32m.v rv32m_tb.v div_32b.v div_32u.v Adder32.v mul_32k.v mul_32b.v 
	vvp -n rv32m_sim.vvp -lxt2

simulate:
	iverilog $(FILES) -o $(project_name)_sim.vvp
	vvp -n $(project_name)_sim.vvp -lxt2

clean:
	rm $(vvp_files) $(vcd_files) $(sim_file)