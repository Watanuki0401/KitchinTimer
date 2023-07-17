@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto c40a68859b71481a81ce305efeea0850 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot kitchen_timer_sim_behav xil_defaultlib.kitchen_timer_sim xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
