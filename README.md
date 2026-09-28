# Maze_Game

# Description
- Maze traversal game. The player must navigate the maze and reach the end within the time limit. Players can select difficulty, altering the size and complexity of the maze, and whether fog-of-war is enable, making untraversed area's of the maze "invisible". 

# Installation/Setup
- Install a ruby interpreter and download this repository or open a GitHub codespace. 

# Running the App
- run: ruby maze_game.rb
- select difficulty: "easy", "medium", or "hard"
- select fog-of-war: "y" or "n"
- control player with WASD
  
# Testing & Coverage Report
- test/test_cases.rb contains tests for all features. Some functionality is encompassed within other functions. For example, the move function already checks whether the move is valid or not. Therefore, we assume that if the move function passes the tests, then valid_move is also bug free.
- To run tests, run "ruby test/test_cases"

# Main Features
- The maze: A 2D array filled with spaces, “###”s, and some character to represent the player's position. Once done the game will have 3 hard coded mazes of increasing size.
- Movement: Single character input by user (WASD).
- Difficulty: Players can select different difficulty levels, increasing or decreasing the size and complexity of the maze.
- Timer: The game has a time limit. Once the time runs out, the game ends. 
- Display: Displays the maze and the timer. When the game ends, the appropriate message will be displayed. 

# Limitations
- On hard difficulty, top two rows of maze are printed repeatedly. This happens when the terminal window is not tall enough to display the maze all at once. Press "q" to quit the game, enlarge the terminal window and run again. 

# Team Members
- Samuel Fu
- Kiefer Crowley
