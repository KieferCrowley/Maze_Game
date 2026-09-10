Objectives
The team should hold a planning discussion near the start of the project and document the discussion in docs/planning.md .

The planning discussion should address:

What app the team will build
Which features are essential and which are optional
How the team will collaborate on work (individual vs. pair programming)
What “done” means for the project and for individual features/stories


# App name
Maze Runner

# App description
The user traverses through a text based maze to a specified location. 

# Core features
The maze: a 2D array filled with spaces, “#”s, and some character to represent the player's position. Once done the game will have 3 hard coded mazes of increasing size.
Movement: left, right, up, and down. Possibly followed by an int to specify how many spaces to move. Once done the game can update player position based on keyword inputs or return error message for invalid input.
Difficulty: Players can select different difficulty levels, increasing or decreasing the size and complexity of the maze. Once done the game will offer 3 difficulties easy, medium and hard, with increasing maze sizes.
Timer: The game can have a time limit or a simple informative timer. Once done the game will keep count of time, 1. if we implement a countdown system the game will end if the timer goes to 0 or 2. regular timer where time spent is used for scoring
Display: Display window that handles input and outputs. Once done there will be a window to display and interact with.

# Optional features
Fog of War: Only parts of the maze the player has visited are visible. Once done parts of the maze that haven't been visited will be covered with place holder symbols. 
Flavor Text: Once Fog of War is implemented, players can receive flavor text hints when coming close to points of interest. Once done, the game will provide flavor text hints when near points of interest. 
Random Maze: Maze is randomly generated at the start of the game. (Prim’s algorithm) Once done the game can generate random mazes based on the selected difficulty/size
Items: Items can be placed in the maze, such as pickaxes to break through a single wall, etc…  Once done there will be useful items scattered in the maze that may provide help to the player.

# Collaboration 
Pair programming: maze (and difficulty) and display
Individual: movement and timer
