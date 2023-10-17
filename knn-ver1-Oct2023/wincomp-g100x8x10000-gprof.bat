gcc -pg -Wall -D K=20 -D NUM_TRAINING_SAMPLES=8004 -D NUM_TESTING_SAMPLES=1996 -D NUM_FEATURES=100 -D NUM_CLASSES=8 -std=gnu99 -lm -c utils.c timer.c io.c
gcc -pg -Wall -D K=20 -D NUM_TRAINING_SAMPLES=8004 -D NUM_TESTING_SAMPLES=1996 -D NUM_FEATURES=100 -D NUM_CLASSES=8 -std=gnu99 -lm -c knn.c 
gcc -pg -Wall -D K=20 -D NUM_TRAINING_SAMPLES=8004 -D NUM_TESTING_SAMPLES=1996 -D NUM_FEATURES=100 -D NUM_CLASSES=8 -std=gnu99 -lm main.c utils.o timer.o knn.o io.o -o knn