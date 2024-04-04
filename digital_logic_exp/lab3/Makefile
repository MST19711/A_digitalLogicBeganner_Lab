.PHONY : all module clean ALU32

FILES = $(wildcard $(module_name)*.v)
ALL_vFILES = $(wildcard *.v)
vvp_files = $(wildcard *.vvp)
vcd_files = $(wildcard *.vcd)
sim_file = $(wildcard *_sim)

module:
	iverilog $(FILES) -o $(module_name)_sim.vvp
	vvp -n $(module_name)_sim.vvp -lxt2

all:
	iverilog $(ALL_vFILES) -o $(project_name)_sim.vvp
	vvp -n $(project_name)_sim.vvp -lxt2

clean:
	rm $(vvp_files) $(vcd_files) $(sim_file)

ALU32:
	iverilog ./Adder32.v ./barrelsft32.v ./ALU32.v ./ALU32_tb.v -o ALU32_tb_sim.vvp
	vvp -n ALU32_tb_sim.vvp -lxt2