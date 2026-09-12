class Maze
    TEST_GRID = [
    ["##", "##", "##", "##", "##", "##", "##"],
    ["##", " S", "##", "  ", "  ", "  ", "##"],
    ["##", "  ", "##", "  ", "##", "  ", "##"],
    ["##", "  ", "##", "  ", "##", "  ", "##"],
    ["##", "  ", "##", "  ", "##", "  ", "##"],
    ["##", "  ", "  ", "  ", "##", " X", "##"],
    ["##", "##", "##", "##", "##", "##", "##"],
    ].freeze

    attr_reader :grid, :difficulty

    def initialize(difficulty:)
        @difficulty = difficulty.downcase
        
        case difficulty
        when :easy
            @grid = TEST_GRID.map(&:dup) 
            #.map(&:dup) creates line by line duplicate of the grid
            # this may come in handy when we make changes to it for movement or fog of war
        when :medium
            @grid = TEST_GRID.map(&:dup) 
        when :hard
            @grid = TEST_GRID.map(&:dup) 
        else
            raise ArgumentError, "invalid difficulty: #{difficulty}, please type in easy, medium or hard"
        end
    end

    # for checking is the next tile valid, only check if the spot is a wall or not, in case of items in the future
    # def check_valid_move(x,y)

    # for future randomized maze:
    # def generate_maze(sizex, sizey, startx, starty, endx, endy)

    def test_display
        @grid.each do |row|
            puts row.join
        end
    end
end 

#test code
#test_maze = Maze.new(difficulty: :easy)
#test_maze.test_display