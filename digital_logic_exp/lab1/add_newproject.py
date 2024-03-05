import os
import sys
import shutil


constraints_template = ""
project_name = sys.argv[1]

os.mkdir(project_name)
os.mkdir(project_name + os.sep + "Constraints")
os.mkdir(project_name + os.sep + "Design_Sources")
os.mkdir(project_name + os.sep + "Simulation_Sources")

D = open(project_name + os.sep + "Design_Sources" + os.sep + project_name + ".v", "w")
D.write("`timescale 1ns / 1ps\nmodule " + project_name + "();\n\nendmodule")
D.close()

S = open(project_name + os.sep + "Simulation_Sources" + os.sep + project_name + "_tb.v", "w")
S.write("`timescale 1ns / 1ps\nmodule " + project_name + "_tb();\n\n    initial begin\n     $dumpfile(\"" + project_name + ".vcd\");\n       $dumpvars(0, " + project_name + "_tb);\nend\nendmodule")
S.close()

shutil.copy("./template/Constraints_template.xdc", project_name + os.sep + "Constraints" + os.sep + project_name + ".xdc")
shutil.copy("./template/simullation_and_synth.py", project_name + os.sep + "simullation_and_synth.py")