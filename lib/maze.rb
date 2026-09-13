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
            @grid = TEST_GRID.map(&:dup) 
            #.map(&:dup) creates line by line duplicate of the grid
            # this may come in handy when we make changes to it for movement or fog of war
        when "medium"
            @grid = TEST_GRID.map(&:dup) 
        when "hard"
            @grid = TEST_GRID.map(&:dup) 
        else
            raise ArgumentError, "invalid difficulty: #{difficulty}, please type in easy, medium or hard"
        end
        #initiliazing important coordinates
        #start and exit located on top left and bottom right corner within the walls
        @player_x = 1
        @player_y = 1
        @exit_x = @grid[0].length - 2
        @exit_y = @grid.length- 2
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

    def test_display
        @grid.each do |row|
            puts row.join
        end
    end
end 

#test code
#test_maze = Maze.new("easy")
#test_maze.test_display
#testing valid move, expects false true true 
#puts test_maze.valid_move?(0,0) 
#puts test_maze.valid_move?(1,1)
#puts test_maze.valid_move?(1,2)
# expects false
#puts test_maze.player_at_exit?