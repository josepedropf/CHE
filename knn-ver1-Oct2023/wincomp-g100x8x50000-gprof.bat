set FLAGS=-pg -g -Wno-unused-parameter -coverage -Wall -Wextra -fmax-errors=10 -lm
gcc -D K=20 -D NUM_TRAINING_SAMPLES=40002 -D NUM_TESTING_SAMPLES=9998 -D NUM_FEATURES=100 -D NUM_CLASSES=8 %FLAGS% -std=gnu99 -c utils.c timer.c io.c
gcc -D K=20 -D NUM_TRAINING_SAMPLES=40002 -D NUM_TESTING_SAMPLES=9998 -D NUM_FEATURES=100 -D NUM_CLASSES=8 %FLAGS% -std=gnu99 -c knn.c 
gcc -D K=20 -D NUM_TRAINING_SAMPLES=40002 -D NUM_TESTING_SAMPLES=9998 -D NUM_FEATURES=100 -D NUM_CLASSES=8 %FLAGS% main.c utils.o timer.o knn.o io.o -o knn