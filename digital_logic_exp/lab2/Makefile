.PHONY : simulate_regfile32, simulate_encryption6b simulate clean

FILES = $(wildcard $(project_name)*.v)
vvp_files = $(wildcard *.vvp)
vcd_files = $(wildcard *.vcd)
sim_file = $(wildcard *_sim)


simulate:
	iverilog $(FILES) -o $(project_name)_sim.vvp
	vvp -n $(project_name)_sim.vvp -lxt2

clean:
	rm $(vvp_files) $(vcd_files) $(sim_file)