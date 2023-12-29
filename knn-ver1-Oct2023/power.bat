set POWERLOG="D:\Program Files\Intel\Power Gadget 3.6\PowerLog3.0.exe"
set OUTPATH=..\results\power.csv
set EXE=knn.exe
call %POWERLOG% -file %OUTPATH% -cmd %EXE%