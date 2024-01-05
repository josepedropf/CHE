gcc -D K=3 -D DT=2 -g -Wno-unused-parameter -Wall -Wextra -fmax-errors=10 -std=gnu99 -lm -c utils.c timer.c io.c
gcc -D K=3 -D DT=2 -g -march=native -Wno-unused-parameter -Wall -Wextra -fmax-errors=10 -std=gnu99 -lm -c knn.c 
gcc -D K=3 -D DT=2 -g -march=native -Wno-unused-parameter -Wall -Wextra -fmax-errors=10 -std=gnu99 -lm main.c utils.o timer.o knn.o io.o -o knn
