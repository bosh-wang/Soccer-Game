set projectName=soccer_game

del %projectName%.lst	
del %projectName%.obj
del %projectName%.ilk
del %projectName%.pdb
del %projectName%.exe

setlocal 
set INCLUDE=C:\windbg\;	
set LIB=C:\windbg\;
set PATH=C:\windbg\;

ML /c /coff /Zi   %projectName%.asm
LINK /INCREMENTAL:no /debug /subsystem:console /entry:start /out:%projectName%.exe %projectName%.obj Kernel32.lib irvine32.lib user32.lib
DIR %projectName%.*

REM taskkill /f /im %projectName%.exe

\masm32\bin\bldall %projectName%
start cmd /k "C:\Windows\System32\chcp 65001 && %projectName%.exe

exit
