require 'io/console'

require_relative 'lib/maze'
require_relative 'lib/timer'

# Prompt for user input until valid input is received
input_valid = false
while (!input_valid) do
    puts "Select Difficulty. Type: \"easy\", \"medium\", or \"hard\""
    difficulty = gets.downcase.strip
    if (difficulty == "easy" || difficulty == "medium" || difficulty == "hard")
        input_valid = true
    end
end

maze = Maze.new(difficulty)

maze.display

timer = Timer.new(60)
timer.count_down

# Start game. Game ends when player reaches the end or time runs out.
game_over = false
while (!game_over && timer.time > 0) do
    action = STDIN.getch.downcase   # get single character input. BUG: blocking action
    if (action == "w" || action == "a" || action == "s" || action == "d")
        maze.move(action) # move() checks if move is valid
        maze.display # update view of maze
        if (maze.player_at_exit?)
            game_over = true
            puts "You Escaped!"
        end
    end
end