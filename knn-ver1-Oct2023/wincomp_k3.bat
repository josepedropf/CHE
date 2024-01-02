gcc -D K=3 -D DT=2 -Wno-unused-parameter -Wall -g -Wextra -fmax-errors=10 -std=gnu99 -lm -O2 -c utils.c timer.c io.c 
gcc -D K=3 -D DT=2 -Wno-unused-parameter -Wall -g -Wextra -fmax-errors=10 -std=gnu99 -lm -O2 -c knn.c 
gcc -D K=3 -D DT=2 -Wno-unused-parameter -Wall -g -Wextra -fmax-errors=10 -std=gnu99 -lm -O2 main.c utils.o timer.o knn.o io.o -o knn.exe