set OUTPATH=..\results\A1a
set EXE=knn
if not exist %OUTPATH% mkdir %OUTPATH%
call cp-wisdm.bat
call wincomp-gprof_k3.bat
%EXE% > %OUTPATH%\execution.txt
%EXE%
call gprof %EXE% > %OUTPATH%\gprof.txt
%EXE%
call gcov %EXE% > %OUTPATH%\gcov.txt
%EXE%
call gcov io.c
%EXE%
call gcov utils.c
%EXE%
call gcov timer.c
%EXE%
call gcov main.c
move knn.c.gcov %OUTPATH%\knn.c.gcov
move io.c.gcov %OUTPATH%\io.c.gcov
move utils.c.gcov %OUTPATH%\utils.c.gcov
move timer.c.gcov %OUTPATH%\timer.c.gcov
move main.c.gcov %OUTPATH%\main.c.gcov
del /q /f *.gcno *.gcda *.gcov
