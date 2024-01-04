set OUTPATH=..\results\A1b
set EXE=knn.exe
if not exist %OUTPATH% mkdir %OUTPATH%
del /q /f *.gcno *.gcda *.gcov *.o *.exe
call cp-wisdm.bat
call wincomp-gprof_k20.bat
%EXE% > %OUTPATH%\execution.txt
call gprof %EXE% gmon.out > %OUTPATH%\gprof.txt 
%EXE% | call gprof %EXE% gmon.out | call python3 gprof2dot.py | call dot -Tpng -o %OUTPATH%\call_graph.png
%EXE% | call gprof %EXE% gmon.out | call python3 gprof2dot.py -n0 -e0 | call dot -Tpng -o %OUTPATH%\full_call_graph.png
%EXE% | call gcov %EXE% > %OUTPATH%\gcov.txt
call gcov *.o
move *.gcov %OUTPATH%
