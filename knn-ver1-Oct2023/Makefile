## OS specific stuff - don't change ##
ifeq ($(OS),Windows_NT)
TARGET = knn.exe
RM = del
RUN = $(TARGET)
else
TARGET = knn
RM = rm
RUN = ./$(TARGET)
endif


## Makefile code ##
CC = gcc

CFLAGS = -pg -fprofile-arcs -coverage -Wall -Wextra -fmax-errors=10 -lm -Ofast
CSTD = --std=gnu99
KNN_FLAGS =

SRCS = main.c utils.c timer.c io.c
OBJS = $(SRCS:.c=.o)

default: $(TARGET)

run_small: $(TARGET)
	$(RUN) knn_small_1.dat

run_medium: $(TARGET)
	$(RUN) knn_medium_1.dat
    
run_large: $(TARGET)
	$(RUN) knn_large_1.dat

$(TARGET): knn.o $(OBJS)
	$(CC) knn.o $(OBJS) $(KNN_FLAGS) $(CFLAGS) -o $(TARGET)

knn.o: knn.c
	$(CC) -c knn.c $(KNN_FLAGS) $(CFLAGS) $(CSTD)

%.o: %.c
	$(CC) -c $<  -o $@ $(KNN_FLAGS) $(CFLAGS) $(CSTD) -O1

clean:
	$(RM) $(TARGET) knn.o $(OBJS)