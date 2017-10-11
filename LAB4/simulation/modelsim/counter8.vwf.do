vlog -work work F:/Year2/Digital Design/LAB4/simulation/modelsim/counter8.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.counter8_vlg_vec_tst
onerror {resume}
add wave {counter8_vlg_vec_tst/i1/clear}
add wave {counter8_vlg_vec_tst/i1/clock}
add wave {counter8_vlg_vec_tst/i1/Enable}
add wave {counter8_vlg_vec_tst/i1/Q}
add wave {counter8_vlg_vec_tst/i1/Q[7]}
add wave {counter8_vlg_vec_tst/i1/Q[6]}
add wave {counter8_vlg_vec_tst/i1/Q[5]}
add wave {counter8_vlg_vec_tst/i1/Q[4]}
add wave {counter8_vlg_vec_tst/i1/Q[3]}
add wave {counter8_vlg_vec_tst/i1/Q[2]}
add wave {counter8_vlg_vec_tst/i1/Q[1]}
add wave {counter8_vlg_vec_tst/i1/Q[0]}
run -all
