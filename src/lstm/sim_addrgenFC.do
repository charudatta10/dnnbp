add wave -r /*
force -freeze sim:/addr_gen_bp_fc/clk 1 0, 0 {25 ns} -r 50
force -freeze sim:/addr_gen_bp_fc/rst 1'h1 0
force -freeze sim:/addr_gen_bp_fc/en 1'h0 0
run 50
force -freeze sim:/addr_gen_bp_fc/rst 1'h0 0
force -freeze sim:/addr_gen_bp_fc/en 1'h1 0
run 5000