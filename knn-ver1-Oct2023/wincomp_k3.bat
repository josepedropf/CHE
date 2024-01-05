set F0= -march=native
set F1= -march=native -ftree-vectorize
set F2= -march=native -O3
set F3= -march=native -O3 -fopenmp
set FCASE=%1
set CASE=%2
set OPT_FLAGS=%F0%
if %FCASE% == 0 set OPT_FLAGS=%F0%
if %FCASE% == 1 set OPT_FLAGS=%F1%
if %FCASE% == 2 set OPT_FLAGS=%F2%
if %FCASE% == 3 set OPT_FLAGS=%F3%
gcc -D K=3 -D DT=2 -g -Wno-unused-parameter -Wall -Wextra -fmax-errors=10 -std=gnu99 -lm -c utils.c timer.c io.c
gcc -D K=3 -D DT=2 -g %OPT_FLAGS% -Wno-unused-parameter -Wall -Wextra -fmax-errors=10 -std=gnu99 -lm -c %CASE%knn.c 
gcc -D K=3 -D DT=2 -g %OPT_FLAGS% -Wno-unused-parameter -Wall -Wextra -fmax-errors=10 -std=gnu99 -lm %CASE%main.c utils.o timer.o %CASE%knn.o io.o -o %CASE%knn
