onerror {quit -f}
vlib work
vlog -work work Taillight.vo
vlog -work work Taillight.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Taillight_vlg_vec_tst
vcd file -direction Taillight.msim.vcd
vcd add -internal Taillight_vlg_vec_tst/*
vcd add -internal Taillight_vlg_vec_tst/i1/*
add wave /*
run -all
