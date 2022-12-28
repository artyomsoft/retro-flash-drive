@echo off
rem cls because of crash bug at end of screen in jwasm in Windows SE console
cls
rem use JWasm with option -mz to create HIMEMX.EXE
jwasm.exe -nologo -mz -Sg -Sn -Fl=HIMEMX.LST -Fo=HIMEMX.EXE Himemx.asm
