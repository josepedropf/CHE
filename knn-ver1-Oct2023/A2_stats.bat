set SCENARIO=A2
set OUTPATH=..\stats\%SCENARIO%
set STATS=stats.bat
set ITERS=10

if not exist %OUTPATH% mkdir %OUTPATH%

::call %STATS% %ITERS% %SCENARIO% 0 original_
::call %STATS% %ITERS% %SCENARIO% 1 original_
::call %STATS% %ITERS% %SCENARIO% 2 original_

call %STATS% %ITERS% %SCENARIO% 0 nonloop_
call %STATS% %ITERS% %SCENARIO% 1 nonloop_
call %STATS% %ITERS% %SCENARIO% 2 nonloop_

call %STATS% %ITERS% %SCENARIO% 0 ""
call %STATS% %ITERS% %SCENARIO% 1 ""
call %STATS% %ITERS% %SCENARIO% 2 ""
call %STATS% %ITERS% %SCENARIO% 3 ""