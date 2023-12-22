set FLAGS=-pg -g -Wno-unused-parameter -fno-builtin -Wall -Wextra -lm -fmax-errors=10 -std=gnu99 --coverage
gcc -D K=3 %FLAGS% -c main.c utils.c timer.c io.c 
gcc -D K=3 %FLAGS% -c knn.c 
gcc -D K=3 %FLAGS% main.o utils.o timer.o knn.o io.o -o knn