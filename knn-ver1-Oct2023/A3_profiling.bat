set OUTPATH=..\results\A3
set EXE=knn.exe
if not exist %OUTPATH% mkdir %OUTPATH%
del /q /f *.gcno *.gcda *.gcov *.o *.exe
call cp-g100x8x50000.bat
call wincomp-g100x8x50000-gprof.bat
%EXE% > %OUTPATH%\execution.txt
call gprof %EXE% gmon.out > %OUTPATH%\gprof.txt 
%EXE% | call gprof %EXE% gmon.out | call python3 gprof2dot.py | call dot -Tpng -o %OUTPATH%\call_graph.png
%EXE% | call gcov %EXE% > %OUTPATH%\gcov.txt
call gcov *.o
move *.gcov %OUTPATH%
