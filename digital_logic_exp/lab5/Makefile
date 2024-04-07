.PHONY : keyboard mouse clean

FILES = $(wildcard $(project_name)*.v)
vvp_files = $(wildcard *.vvp)
vcd_files = $(wildcard *.vcd)
sim_file = $(wildcard *_sim)


keyboard : 
	iverilog -o keyboard_sim_test.vvp KeyBoardReceiver.v KeyboardSim.v kbcode2ascii.v  seg7decimal.v
#	vvp -n mul_32b_sim.vvp -lxt2

mouse : 
	iverilog -o mouse_test.vvp MouseReceiver.v seg7decimal.v
#	vvp -n mouse_test.vvp -lxt2

clean:
	rm $(vvp_files) $(vcd_files) $(sim_file)