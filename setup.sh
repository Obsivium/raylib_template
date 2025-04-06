#!/bin/bash

# Install raylib
brew install raylib

# Create main.c
cat <<EOF > main.c
#include <stdio.h>
#include <stdlib.h>
#include <raylib.h>

int main(void) {
    // Initialization
    const int screenWidth = 800;
    const int screenHeight = 450;

    InitWindow(screenWidth, screenHeight, "Platformer Game");

    SetTargetFPS(60);

    // Main game loop
    while (!WindowShouldClose()) {
        // Update
        // TODO: Update your variables here

        // Draw
        BeginDrawing();

            ClearBackground(RAYWHITE);

            DrawText("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);

        EndDrawing();
    }

    // De-Initialization
    CloseWindow();

    return 0;
}
EOF

# Create Makefile
cat <<EOF > Makefile
CFLAGS = -Wall -Wextra -std=c99 -g -I/opt/homebrew/Cellar/raylib/5.5/include
LDFLAGS = -L/opt/homebrew/Cellar/raylib/5.5/lib -lraylib -lm -lpthread -ldl -framework OpenGL -framework Cocoa

main: main.c
	gcc \$(CFLAGS) -o main main.c \$(LDFLAGS)
EOF

# Create .vscode directory if it doesn't exist
mkdir -p .vscode

# Create c_cpp_properties.json
cat <<EOF > .vscode/c_cpp_properties.json
{
  "configurations": [
    {
      "name": "Mac",
      "includePath": [
        "\${workspaceFolder}/**",
        "/opt/homebrew/Cellar/raylib/5.5/include"
      ],
      "defines": [],
      "compilerPath": "/usr/bin/clang",
      "cStandard": "c17",
      "cppStandard": "c++17",
      "intelliSenseMode": "macos-clang-arm64"
    }
  ],
  "version": 4
}
EOF

echo "Project setup complete. Run 'make && ./main' to compile and run the game."
