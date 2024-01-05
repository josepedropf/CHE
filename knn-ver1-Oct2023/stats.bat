del /q /f *.gcno *.gcda *.gcov *.o *.exe
set POWER=power.bat
set TIME=time.bat

set ITERS=%1
set SCENARIO=%2
set FLAGS=%3
set CASE=%4

if %SCENARIO% == A1a (
    set BAT1=cp-wisdm.bat
    set BAT2=wincomp_k3.bat
)

if %SCENARIO% == A1b (
    set BAT1=cp-wisdm.bat
    set BAT2=wincomp_k20.bat
)

if %SCENARIO% == A1c (
    set BAT1=cp-wisdm.bat
    set BAT2=wincomp_k3.bat
)

if %SCENARIO% == A2 (
    set BAT1=cp-g100x8x10000.bat
    set BAT2=wincomp-g100x8x10000.bat
)

if %SCENARIO% == A3 (
    set BAT1=cp-g100x8x50000.bat
    set BAT2=wincomp-g100x8x50000.bat
)

call %BAT1%
call %BAT2% %FLAGS% %CASE%

FOR /L %%x IN (1, 1, %ITERS%) DO call %TIME% %SCENARIO% %FLAGS% %%x %CASE%
FOR /L %%x IN (1, 1, %ITERS%) DO call %POWER% %SCENARIO% %FLAGS% %%x %CASE%