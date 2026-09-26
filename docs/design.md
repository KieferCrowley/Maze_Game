# Features
## Maze
- A 2d array representing a maze where blank spaces represent traversable paths and "###"s represent walls. Instances of a maze will vary based on difficulty.
## Movement
- Changes player's position within a maze. Accepts direction as an argument. Prevents player from moving through walls. 
## Timer
- Counts down from specified time to 0. When time runs out, signals for game to end.
## Fog-of-war
- Only explored parts of the maze will be visible to the player. 

# UI Design
- A maze will be displayed across the majority of the screen. Below the maze, a timer will be displayed. 

# Design Decisions/Tradeoffs 
- Maze class will have function to check if a space is valid. Movement will call that function before updating player position. 
- Switched to using wasd instead of "left/right/up/down" with getch to avoid pressing enter repeatedly
- Used thread for timer so it can run in parallel with the game
- CSV files for storing maze grids for readability
- Separated the player position from the grid, and its just recorded through coordinates.
- Character input is handled by a thread so it doesn't block the while loop from exiting when timer runs out. 
