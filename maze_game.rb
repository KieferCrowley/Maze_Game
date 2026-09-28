require 'io/console'

require_relative 'lib/maze'
require_relative 'lib/timer'

# Prompt for user input until valid input is received
input_valid = false
until input_valid
  puts 'Select Difficulty. Type: "easy", "medium", or "hard"'
  difficulty = gets.downcase.strip
  input_valid = true if %w[test easy medium hard].include?(difficulty)
end

input_valid = false
until input_valid
  puts 'Enable Fog of War? Type: "y" or "n"'
  fow_choice = gets.downcase.strip
  input_valid = true if %w[y n].include?(fow_choice)
end

input_queue = Queue.new

# input runs on its own thread
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
maze.fow_flag = fow_choice
maze.clear_display
maze.display(timer.time)
last_time = timer.time
# Start game. Game ends when player reaches the end or time runs out.
game_over = false
while !game_over && timer.time > 0
  # action = STDIN.getch.downcase   # get single character input. BUG: blocking action
  needs_redraw = false
  begin
    action = input_queue.pop(true)

    if %w[w a s d].include?(action)
      maze.move(action) # move() checks if move is valid
      needs_redraw = true
      # maze.display # update view of maze
      game_over = true if maze.player_at_exit?
    end
    # for exiting the game
    break if action == 'q'
  rescue ThreadError
  end
  if timer.time != last_time
    needs_redraw = true
    last_time = timer.time
  end

  maze.display(timer.time) if needs_redraw
  sleep(0.05)
end
input_thread.kill
if game_over
  puts "You Escaped!\r"
elsif timer.time <= 0
  puts "\nTime's up! Game Over!\r"
end

puts 'Press any key to exit...' if RUBY_PLATFORM =~ /mingw|mswin/
# puts "Press any key to exit..."

# input_thread.kill
