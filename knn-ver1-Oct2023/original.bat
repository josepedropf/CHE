del /q /f *.gcno *.gcda *.gcov *.o *.exe
call cp-wisdm.bat
set OPT_FLAGS=-march=native
gcc -D K=3 -D DT=2 -g -Wno-unused-parameter -Wall -Wextra -fmax-errors=10 -std=gnu99 -lm -c utils.c timer.c io.c
gcc -D K=3 -D DT=2 %OPT_FLAGS% -g -Wno-unused-parameter -Wall -Wextra -fmax-errors=10 -std=gnu99 -lm -c original_knn.c 
gcc -D K=3 -D DT=2 %OPT_FLAGS% -g -Wno-unused-parameter -Wall -Wextra -fmax-errors=10 -std=gnu99 -lm original_main.c utils.o timer.o original_knn.o io.o -o original_knn