@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xsim kitchen_timer_sim_behav -key {Behavioral:sim_1:Functional:kitchen_timer_sim} -tclbatch kitchen_timer_sim.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
