.PHONY : keyboard


keyboard : 
	iverilog -o keyboard_sin_test.vvp KeyBoardReceiver.v KeyboardSim.v kbcode2ascii.v  seg7decimal.v
#	vvp -n mul_32b_sim.vvp -lxt2
