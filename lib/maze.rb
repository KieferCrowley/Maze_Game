require "csv"

class Maze
    WALL = "###"
    EXIT = " X "
    EMPTY = "   "
    PLAYER = " O "
    TEST_GRID = [
    ["###", "###", "###", "###", "###", "###", "###"],
    ["###", " O ", "###", "   ", "   ", "   ", "###"],
    ["###", "   ", "###", "   ", "###", "   ", "###"],
    ["###", "   ", "###", "   ", "###", "   ", "###"],
    ["###", "   ", "###", "   ", "###", "   ", "###"],
    ["###", "   ", "   ", "   ", "###", " X ", "###"],
    ["###", "###", "###", "###", "###", "###", "###"],
    ].freeze


    attr_reader :grid, :difficulty, :player_x, :player_y, :exit_x, :exit_y

    def initialize(difficulty)
        @difficulty = difficulty.downcase.strip
        
        case @difficulty
        when "easy"
            #easy grid size = 17*17
            #@grid = TEST_GRID.map(&:dup) 
            filename = "easy.csv"
            #.map(&:dup) creates line by line duplicate of the grid
            # this may come in handy when we make changes to it for movement or fog of war
        when "medium"
            #medium grid size = 23*23
            #@grid = TEST_GRID.map(&:dup)
            filename = "medium.csv"
        when "hard"
            #hard grid size = 29*29
            #@grid = TEST_GRID.map(&:dup) 
            filename = "hard.csv"
        when "test"
            @grid = TEST_GRID.map(&:dup)
        else
            raise ArgumentError, "invalid difficulty: #{difficulty}, please type in easy, medium or hard"
        end

        if (@difficulty != "test")
            path = File.expand_path("../mazes/#{filename}", __dir__)
            @grid = CSV.read(path) 
        end
        
        #initiliazing important coordinates
        #start and exit located on top left and bottom right corner within the walls
        @player_x = 1
        @player_y = 1
        @exit_x = @grid[0].length - 2
        @exit_y = @grid.length- 2
    end

    def load_maze(filename)
        CSV.read(filename)
    end

    def move(action)
        case action
        when "w"
            if (valid_move?(@player_x, @player_y - 1))
                @player_y -= 1
            #else
                #puts "Invalid move!"
            end
        when "a"
            if (valid_move?(@player_x - 1, @player_y))
                @player_x -= 1
            #else
                #puts "Invalid move!"
            end
        when "s"
            if (valid_move?(@player_x, @player_y + 1))
                @player_y += 1
            #else
                #puts "Invalid move!"
            end
        when "d"
            if (valid_move?(@player_x + 1, @player_y))
                @player_x += 1
            #else
                #puts "Invalid move!"
            end
        end
        # for items, add function call here to check new grid
    end

    # for quick look at whats in the current location
    def tile_at(x, y)
        @grid[y][x]
    end

    # for checking is the next tile valid, only check if the spot is a wall or not, in case of items in the future
    def valid_move?(x,y)
        @grid[y][x] != WALL
    end

    # for checking if player is at the exit
    def player_at_exit?
        (@player_x == @exit_x) && (@player_y == @exit_y)
    end
    
    # for future randomized maze:
    # def generate_maze(sizex, sizey, startx, starty, endx, endy)

    def clear_display
        if Gem.win_platform?
            system("cls")
        else
            system("clear")
        end
    end

    #def display(seconds) 
        #clear terminal and reset cursor
        #print "\e[2J\e[H"
    #    clear_display
    #    @grid.each_with_index do |row, y|
    #        row.each_with_index do |tile, x|
    #            if x == @player_x && y == @player_y
    #                print PLAYER
    #            else 
    #                print tile
    #            end
    #        end
    #        #start new line
    #        puts 
    #    end
    #    puts "Time remaining: #{seconds}"
    #    #print "\rTime Remaining: #{@time}"
    #end

    def display(seconds)
        # Implementation for displaying maze with time
        # with another method
        frame = ""
        @grid.each_with_index do |row, y|
            row.each_with_index do |tile, x|
                if x == @player_x && y == @player_y
                    frame += PLAYER
                else
                    frame += tile
                end
            end
            frame += "\n"
        end
        frame += "Time remaining: #{seconds}\n"
        print "\e[H"
        print frame
    end

    def test_display
        @grid.each do |row|
            puts row.join
        end
    end
end 

#test code
#test_maze = Maze.new("hard")
#test_maze.test_display
#testing valid move, expects false true true 
#puts test_maze.valid_move?(0,0) 
#puts test_maze.valid_move?(1,1)
#puts test_maze.valid_move?(1,2)
# expects false
#puts test_maze.player_at_exit?