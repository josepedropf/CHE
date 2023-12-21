set FLAGS=-pg -g -coverage -Wno-unused-parameter -Wall -Wextra -fmax-errors=10 -lm
gcc -D K=20 -D NUM_TRAINING_SAMPLES=8004 -D NUM_TESTING_SAMPLES=1996 -D NUM_FEATURES=100 -D NUM_CLASSES=8 %FLAGS% -std=gnu99 -c utils.c timer.c io.c
gcc -D K=20 -D NUM_TRAINING_SAMPLES=8004 -D NUM_TESTING_SAMPLES=1996 -D NUM_FEATURES=100 -D NUM_CLASSES=8 %FLAGS% -std=gnu99 -c knn.c 
gcc -D K=20 -D NUM_TRAINING_SAMPLES=8004 -D NUM_TESTING_SAMPLES=1996 -D NUM_FEATURES=100 -D NUM_CLASSES=8 %FLAGS% main.c utils.o timer.o knn.o io.o -o knn