@echo off
set ROOTDIR=%cd%
bin\PBDDynamics.exe %ROOTDIR%\Simulator\PBDDynamics\ParameterGen\Examples\Models2.json %ROOTDIR%\Simulator\PBDDynamics\ParameterGen\Examples\Parameters.json %ROOTDIR%\result -R %ROOTDIR%