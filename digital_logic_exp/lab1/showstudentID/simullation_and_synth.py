import os
import sys

project_name = sys.argv[1]

design_list = os.listdir("./Design_Sources")
sim_list = os.listdir("./Simulation_Sources")

cmd = "iverilog -o " + project_name + "_wave"
for f in design_list:
    cmd += " Design_Sources" + os.sep + f
for f in sim_list:
    cmd += " Simulation_Sources" + os.sep + f
os.system(cmd)

cmd = "vvp -n ./" + project_name + "_wave" + " -lxt2"
os.system(cmd)

yosys_script = "read_verilog "
for f in design_list:
    yosys_script += " Design_Sources" + os.sep + f
yosys_script += "\nhierarchy -top " + project_name + "\n"
yosys_script += "proc; opt; fsm; opt; memory; opt; #techmap; opt;\n"
yosys_script += "write_verilog " + project_name + "_synth.v"

yos_f = open("show_rtl.ys", "w")
yos_f.write(yosys_script)
yos_f.close()

cmd = "yosys show_rtl.ys"
os.system(cmd)

cmd = "yosys -p \"prep; show -stretch -prefix " + project_name + " -format dot\" " + project_name + "_synth.v"
os.system(cmd)

cmd = "dot " + project_name + ".dot -T png -o " + project_name + ".png"
os.system(cmd)