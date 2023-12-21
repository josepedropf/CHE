set OUTPATH=..\results\A1c
set EXE=knn.exe
if not exist %OUTPATH% mkdir %OUTPATH%
call cp-wisdm.bat
call wincomp-gprof_k3.bat
%EXE% > %OUTPATH%\execution.txt
call gprof %EXE% > %OUTPATH%\gprof.txt
call gcov %EXE% > %OUTPATH%\gcov.txt
move knn.c.gcov %OUTPATH%\knn.c.gcov
move io.c.gcov %OUTPATH%\io.c.gcov
move utils.c.gcov %OUTPATH%\utils.c.gcov
move main.c.gcov %OUTPATH%\main.c.gcov
move timer.c.gcov %OUTPATH%\timer.c.gcov
