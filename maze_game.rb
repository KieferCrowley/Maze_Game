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

input_queue = Queue.new

#input runs on its own thread
input_thread = Thread.new do
    loop do
        key = STDIN.getch.downcase
        input_queue.clear
        input_queue << key
    end
end

maze = Maze.new(difficulty)

timer = Timer.new(60)
timer.count_down
maze.clear_display
maze.display(timer.time)
last_time = timer.time
# Start game. Game ends when player reaches the end or time runs out.
game_over = false
while (!game_over && timer.time > 0) do
    #action = STDIN.getch.downcase   # get single character input. BUG: blocking action
    needs_redraw = false
    begin

        action = input_queue.pop(true)

        if (action == "w" || action == "a" || action == "s" || action == "d")
            maze.move(action) # move() checks if move is valid
            needs_redraw = true
            #maze.display # update view of maze
            if (maze.player_at_exit?)
                game_over = true
            end
        end
    rescue ThreadError
    end
    if timer.time != last_time
        needs_redraw = true
        last_time = timer.time
    end

    if needs_redraw
        maze.display(timer.time)
    end
    sleep(0.05)
end

if game_over
    puts "You Escaped!"
elsif timer.time <= 0
    puts "\nTime's up! Game Over!"
end
puts "Press any key to exit..."

input_thread.kill