class Maze
    attr_accessor :grid, :start, :finish, :answer, :path_length
    def initialize
        @grid = File.readlines('./maze.txt').map(&:chomp).map(&:chars)
        @answer = File.readlines('./maze.txt').map(&:chomp).map(&:chars)
        @start = nil
        @finish = nil
        @path = {}
        @path_length = 1
    end

    def find_start_finish
        @grid.each_with_index do |row, rowIdx|
            row.each_with_index do |col, colIdx|
                if col == "S"
                    @start = [rowIdx, colIdx]
                end
                if col == "E"
                    @finish = [rowIdx, colIdx]
                end
            end
        end
    end

    def offgrid?(row, col)
        row < 0 || col < 0 || row >= @grid.length || col >= @grid[0].length
    end

    def children(pos)
        row, col = pos
        childs = []
        [[0,1],[0,-1],[-1,0],[1,0]].each do |delta|
            delta_row, delta_col = delta
            next_row = row+delta_row
            next_col = col+delta_col
            childs << [next_row, next_col] if ["E", " "].include?(@grid[next_row][next_col]) && !offgrid?(next_row, next_col)
        end
        childs
    end

    def find_path
        queue = [@start]
        while !queue.empty?
            current = queue.shift
            children(current).each do |child|
                row, col = child
                if [row,col] == @finish
                    @path[@finish] = current
                    return
                end
                @grid[row][col] = "O"
                @path[[row,col]] = current
                queue << child
            end
        end
    end

    def draw_path
        current = @finish
        loop do
            current = @path[current]
            break if current == @start
            row, col = current
            @answer[row][col] = "X"
            @path_length += 1
        end
    end

    def write_solution_file
        File.open("solution0.txt","w") do |f|
            @answer.each {|line| f.puts line.join}
            f.puts ""
            f.puts "Shortest Path length is #{@path_length}"
        end
        File.open("grid0.txt","w") do |f|
            @grid.each {|line| f.puts line.join}
            f.puts ""
            f.puts "Shortest Path length is #{@path_length}"
        end
    end
end

maze = Maze.new
maze.find_start_finish
t = Time.now
maze.find_path
maze.draw_path
f = Time.now
puts (f-t)*1000, 'ms'
maze.write_solution_file