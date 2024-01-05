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
gcc -Wall -D K=20 -D NUM_TRAINING_SAMPLES=40002 -D NUM_TESTING_SAMPLES=9998 -D NUM_FEATURES=100 -D NUM_CLASSES=8 -std=gnu99 -lm -c utils.c timer.c io.c
gcc -Wall -D K=20 -D NUM_TRAINING_SAMPLES=40002 -D NUM_TESTING_SAMPLES=9998 -D NUM_FEATURES=100 -D NUM_CLASSES=8 -std=gnu99 -lm -c %OPT_FLAGS% %CASE%knn.c 
gcc -Wall -D K=20 -D NUM_TRAINING_SAMPLES=40002 -D NUM_TESTING_SAMPLES=9998 -D NUM_FEATURES=100 -D NUM_CLASSES=8 -std=gnu99 -lm %OPT_FLAGS% %CASE%main.c utils.o timer.o %CASE%knn.o io.o -o %CASE%knn