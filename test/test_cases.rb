require_relative '../lib/maze'
require_relative '../lib/timer'

def test_difficulty(difficulty)
    begin 
        maze = Maze.new(difficulty)
        if (maze.difficulty == difficulty.downcase.strip)
            return "PASS"
        else 
            return "FAIL"
        end
    rescue ArgumentError
        return "FAIL"
    end
end

tests_run = 0
tests_passed = 0
tests_failed = 0
err_message = []

# test invalid difficulty inputs
inputs = ["eezy", "ez", "eazy", "normal", "med", "kinda hard", "meatyum", "hardy", "har", "harr"]
inputs.each do |input|
    result = test_difficulty(input)
    # Expect "FAIL"
    if (result == "PASS") 
        tests_failed += 1
        err_message.append("Invalid input \"#{input}\" returned valid")
    else 
        tests_passed += 1
    end
    tests_run += 1
end

# test valid difficulty inputs
inputs = ["easy", "EASY", "easy ", "medium", "MeDiUm", " medium", "hard", " hard ", "Hard", "hARD"]
inputs.each do |input|
    result = test_difficulty(input)
    # Expect "PASS"
    if (result == "FAIL")
        tests_failed += 1
        err_message.append("Valid input \"#{input}\" returned invalid")
    else 
        tests_passed += 1
    end
    tests_run += 1
end

# test timer
timer = Timer.new(1)
if (timer.time != 1)
    tests_failed += 1
    err_message.append("Timer initialized incorrectly")
else
    $stdout = StringIO.new # silence output
    timer.count_down
    sleep(1)
    if (timer.time > 0)
        tests_failed += 1
        err_message.append("Timer counted down incorrectly")
    else 
        tests_passed += 1
    end
    $stdout = STDOUT # un-silence output
end
tests_run += 1

test_maze = Maze.new("test")

# Test initialization of maze
if (test_maze.player_x == 1 && test_maze.player_y == 1 && test_maze.exit_x == test_maze.grid[0].length - 2 &&
    test_maze.exit_y == test_maze.grid.length- 2)
    tests_passed += 1
else
    tests_failed += 1
    err_message.append("Coordinates initialized incorrectly")
end
tests_run += 1

# Test fog of war
if (test_maze.fow_flag == false)
    tests_passed += 1
else
    tests_failed += 1
    err_message.append("Fog of war flag initialized incorrectly")
end
tests_run += 1

test_maze.fow_flag = "y"
if (test_maze.fow_flag)
    tests_passed += 1
else
    tests_failed += 1
    err_message.append("Fog of war flag setter incorrect")
end
tests_run += 1


# Test valid_move, move, & player_at_exit
pos_x = 1
pos_y = 1

$stdout = StringIO.new # silence output

inputs = ["s", "a", "d"]
for i in (0...11) do
    test_maze.move(inputs[i % 3])
    if (i % 3 == 0) # only "s" is valid
        pos_y += 1
    end
    if (test_maze.player_x == pos_x && test_maze.player_y == pos_y)
        tests_passed += 1
    else
        tests_failed += 1
        err_message.append("Player position mismatch")
    end
    tests_run += 1
end

if (test_maze.player_at_exit?) # Expect false
    tests_failed += 1
    err_message.append("Player falsely reported at exit")
else 
    tests_passed += 1
end
tests_run += 1

inputs = ["d", "s", "w"]
for i in (0...4) do
    test_maze.move(inputs[i % 3])
    if (i % 3 == 0) # only "d" is valid
        pos_x += 1
    end
    if (test_maze.player_x == pos_x && test_maze.player_y == pos_y)
        tests_passed += 1
    else
        tests_failed += 1
        err_message.append("Player position mismatch")
    end
    tests_run += 1
end

if (test_maze.player_at_exit?) # Expect false
    tests_failed += 1
    err_message.append("Player falsely reported at exit")
else 
    tests_passed += 1
end
tests_run += 1

inputs = ["w", "a", "d"]
for i in (0...10) do
    test_maze.move(inputs[i % 3])
    if (i % 3 == 0) # only "w" is valid
        pos_y -= 1
    end
    if (test_maze.player_x == pos_x && test_maze.player_y == pos_y)
        tests_passed += 1
    else
        tests_failed += 1
        err_message.append("Player position mismatch")
    end
    tests_run += 1
end

if (test_maze.player_at_exit?) # Expect false
    tests_failed += 1
    err_message.append("Player falsely reported at exit")
else 
    tests_passed += 1
end
tests_run += 1

inputs = ["d", "w", "s"]
for i in (0...4) do
    test_maze.move(inputs[i % 3])
    if (i % 3 == 0) # only "d" is valid
        pos_x += 1
    end
    if (test_maze.player_x == pos_x && test_maze.player_y == pos_y)
        tests_passed += 1
    else
        tests_failed += 1
        err_message.append("Player position mismatch")
    end
    tests_run += 1
end

if (test_maze.player_at_exit?) # Expect false
    tests_failed += 1
    err_message.append("Player falsely reported at exit")
else 
    tests_passed += 1
end
tests_run += 1

inputs = ["s", "a", "d"]
for i in (0...11) do
    test_maze.move(inputs[i % 3])
    if (i % 3 == 0) # only "s" is valid
        pos_y += 1
    end
    if (test_maze.player_x == pos_x && test_maze.player_y == pos_y)
        tests_passed += 1
    else
        tests_failed += 1
        err_message.append("Player position mismatch")
    end
    tests_run += 1
end

if (test_maze.player_at_exit?) # Expect true
    tests_passed += 1
else 
    tests_failed += 1
    err_message.append("Player falsely reported not at exit")
end
tests_run += 1

$stdout = STDOUT # un-silence output

if (!err_message.empty?) 
    puts err_message.join("\n")
end
puts "Tests run: #{tests_run}. Passed/Failed: #{tests_passed}/#{tests_failed}"