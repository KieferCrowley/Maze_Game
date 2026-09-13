require 'io/console'

require_relative 'lib/maze'

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

#maze.test_display
maze.display

game_over = false
#temp step for test
temp_step = 100
while (!game_over && temp_step > 0) do
    action = STDIN.getch.downcase   # get single character input
    if (action == "w" || action == "a" || action == "s" || action == "d")
        maze.move(action) # move() checks if move is valid
        maze.display
        if (maze.player_at_exit?)
            game_over = true
            puts "You Escaped!"
        end
    end
    temp_step -= 1
    #game_over = true # temp exit. delete once player position updates are displayed
end