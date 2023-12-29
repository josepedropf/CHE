set FLAGS=-pg -no-pie -Wno-unused-parameter --coverage -Wall -Wextra -fmax-errors=10 -lm
gcc -D K=3 %FLAGS% -std=gnu99 -c main.c utils.c timer.c io.c 
gcc -D K=3 %FLAGS% -std=gnu99 -c knn.c 
gcc -D K=3 %FLAGS% main.o utils.o timer.o knn.o io.o -o knn.exe