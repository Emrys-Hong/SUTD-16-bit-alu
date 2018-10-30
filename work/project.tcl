set projDir "C:/Users/khong/Documents/GitHub/16-bit-alu/work/planAhead"
set projName "Test3-Alu"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/mojo_top_0.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/reset_conditioner_1.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/edge_detector_2.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/alu_3.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/tst_4.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/multi_seven_seg_5.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/add_6.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/cmp_7.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/bol_8.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/sft_9.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/mul_10.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/edge_detector_11.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/addTest_12.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/subTest_13.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/mulTest_14.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/orTest_15.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/andTest_16.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/xorTest_17.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/bolATest_18.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/shlTest_19.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/shrTest_20.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/sraTest_21.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/cmpeqTest_22.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/cmpleTest_23.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/cmpltTest_24.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/counter_25.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/seven_seg_26.v" "C:/Users/khong/Documents/GitHub/16-bit-alu/work/verilog/decoder_27.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list  "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
