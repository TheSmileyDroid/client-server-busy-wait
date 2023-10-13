all: build/main-wait build/main-nowait

CC = clang
override CFLAGS += -g -pthread -lm

SRCS = $(shell find . -name '.ccls-cache' -type d -prune -o -type f -name '*.c' -print)
HEADERS = $(shell find . -name '.ccls-cache' -type d -prune -o -type f -name '*.h' -print)

main: $(SRCS) $(HEADERS)
	$(CC) $(CFLAGS) $(SRCS) -o "$@"

build/main-wait: main-wait.c $(HEADERS)
	$(CC) $(CFLAGS) main-wait.c -o "$@"

build/main-nowait: main-nowait.c $(HEADERS)
	$(CC) $(CFLAGS) main-nowait.c -o "$@"

main-debug: $(SRCS) $(HEADERS)
	$(CC) $(CFLAGS) -O0 $(SRCS) -o "$@"

clean:
	rm -f main build/main-wait build/main-nowait