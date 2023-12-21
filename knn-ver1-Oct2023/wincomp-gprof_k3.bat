set FLAGS=-Wno-unused-parameter --coverage -Wall -Wextra -fmax-errors=10 -lm
gcc -D K=3 %FLAGS% -std=gnu99 -c utils.c timer.c io.c
gcc -D K=3 %FLAGS% -std=gnu99 -c knn.c 
gcc -D K=3 %FLAGS% main.c utils.o timer.o knn.o io.o -o knn