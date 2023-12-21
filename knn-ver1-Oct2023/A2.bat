set OUTPATH=..\results\A2
set EXE=knn.exe
if not exist %OUTPATH% mkdir %OUTPATH%
call cp-g100x8x10000.bat
call wincomp-g100x8x10000-gprof.bat
%EXE% > %OUTPATH%\execution.txt
call gprof %EXE% > %OUTPATH%\gprof.txt
call gcov %EXE% > %OUTPATH%\gcov.txt
move knn.c.gcov %OUTPATH%\knn.c.gcov
move io.c.gcov %OUTPATH%\io.c.gcov
move utils.c.gcov %OUTPATH%\utils.c.gcov
move main.c.gcov %OUTPATH%\main.c.gcov
move timer.c.gcov %OUTPATH%\timer.c.gcov
