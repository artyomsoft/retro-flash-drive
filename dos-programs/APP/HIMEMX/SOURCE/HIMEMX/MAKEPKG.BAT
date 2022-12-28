@ECHO OFF
REM This script creates a FreeDOS package containing HIMEMX and sources.
REM Written by Mateusz Viste. http://himemx.sourceforge.net

REM If HIMEMX.EXE not present, abort
IF NOT EXIST HIMEMX.EXE ECHO You have to build HIMEMX.EXE first (make.bat).
IF NOT EXIST HIMEMX.EXE GOTO ENDOFGAME

REM If package already present, abort
IF EXIST HIMEMX.ZIP ECHO HIMEMX.ZIP exists already. Remove it if you wish to rebuild the package.
IF EXIST HIMEMX.ZIP GOTO ENDOFGAME

REM Create the directory tree
MKDIR APPINFO
MKDIR BIN
MKDIR DOC
MKDIR DOC\HIMEMX
MKDIR SOURCE
MKDIR SOURCE\HIMEMX

REM Populate the directory tree with files
COPY HIMEMX.LSM APPINFO\
COPY HIMEMX.EXE BIN\
COPY *.TXT DOC\HIMEMX\
COPY *.ASM SOURCE\HIMEMX\
COPY *.BAT SOURCE\HIMEMX\
COPY *.LSM SOURCE\HIMEMX\
COPY *.TXT SOURCE\HIMEMX\

REM Zip up the package, removing the dir tree at the same time
IF EXIST HIMEMX.ZIP DEL HIMEMX.ZIP
ZIP -9 -k -r -m himemx.zip APPINFO BIN DOC SOURCE

ECHO DONE

:ENDOFGAME
