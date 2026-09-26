# Maze_Game

# Description
- Maze traversal game. The player must navigate the maze and reach the end within the time limit. Players can select difficulty, altering the size and complexity of the maze, and whether fog-of-war is enable, making untraversed area's of the maze "invisible". 

# Installation/Setup

# Running the App
run: ruby maze_game.rb
select difficulty, control player with wasd
# Testing & Coverage Report

# Main Features
- The maze: a 2D array filled with spaces, “###”s, and some character to represent the player's position. Once done the game will have 3 hard coded mazes of increasing size.
- Movement: left, right, up, and down. Possibly followed by an int to specify how many spaces to move. Once done the game can update player position based on keyword inputs or return error message for invalid input.
- Difficulty: Players can select different difficulty levels, increasing or decreasing the size and complexity of the maze. Once done the game will offer 3 difficulties easy, medium and hard, with increasing maze sizes.
- Timer: The game can have a time limit or a simple informative timer. Once done the game will keep count of time, 1. if we implement a countdown system the game will end if the timer goes to 0 or 2. regular timer where time spent is used for scoring
- Display: Display window that handles input and outputs. Once done there will be a window to display and interact with.

# Limitations

# Team Members
- Samuel Fu
- Kiefer Crowley
