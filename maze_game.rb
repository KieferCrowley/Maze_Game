require 'io/console'

require_relative 'lib/maze'

# Prompt for user input until valid input is received
input_valid = false
while (!input_valid) do
    puts "Select Difficulty. Type: \"easy\", \"medium\", or \"hard\""
    difficulty = gets.downcase.strip
    if (difficulty == "easy" || difficulty == "medium" || difficulty == "hard")
        input_valid = true
    else
        puts "Invalid Input!"
    end
end

maze = Maze.new(difficulty)

maze.test_display

game_over = false
while (!game_over) do
    action = STDIN.getch.downcase   # get single character input
    if (action == "w" || action == "a" || action == "s" || action == "d") do
        valid_move = false
        #check if valid move
        if (valid_move) do
            #move player
        end
    end
    game_over = true #temp exit
end