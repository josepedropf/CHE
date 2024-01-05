set SCENARIO=%1
set FLAGS=%2
set COUNT=%3
set CASE=%4

if %CASE% == original_ set NAMECASE=original
if %CASE% == nonloop_ set NAMECASE=nonloop
if %CASE% == "" set NAMECASE=fullyoptimized
if %FLAGS% == 0 set FLAGS=noflags
if %FLAGS% == 1 set FLAGS=vect
if %FLAGS% == 2 set FLAGS=O3
if %FLAGS% == 3 set FLAGS=openmp

set OUTPATH=..\stats\%SCENARIO%\%NAMECASE%\%FLAGS%
if not exist %OUTPATH% mkdir %OUTPATH%

%CASE%knn.exe > %OUTPATH%\time%COUNT%.txt