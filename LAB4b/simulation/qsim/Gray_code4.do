onerror {quit -f}
vlib work
vlog -work work Gray_code4.vo
vlog -work work Gray_code4.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.exam3_vlg_vec_tst
vcd file -direction Gray_code4.msim.vcd
vcd add -internal exam3_vlg_vec_tst/*
vcd add -internal exam3_vlg_vec_tst/i1/*
add wave /*
run -all
