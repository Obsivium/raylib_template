CFLAGS = -Wall -Wextra -std=c99 -g -I/opt/homebrew/Cellar/raylib/5.5/include
LDFLAGS = -L/opt/homebrew/Cellar/raylib/5.5/lib -lraylib -lm -lpthread -ldl -framework OpenGL -framework Cocoa

main: main.c
	gcc $(CFLAGS) -o main main.c $(LDFLAGS)
