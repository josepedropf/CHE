del /q /f *.gcno *.gcda *.gcov *.o *.exe
call cp-wisdm.bat
gcc -D K=3 -D DT=2 -g -Wno-unused-parameter -Wall -Wextra -fmax-errors=10 -std=gnu99 -lm -c utils.c timer.c io.c
gcc -D K=3 -D DT=2 -g -Wno-unused-parameter -Wall -Wextra -fmax-errors=10 -std=gnu99 -lm -c knn_original.c 
gcc -D K=3 -D DT=2 -g -Wno-unused-parameter -Wall -Wextra -fmax-errors=10 -std=gnu99 -lm main.c utils.o timer.o knn_original.o io.o -o knn_original