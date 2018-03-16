class Maze
    attr_accessor :grid, :start, :finish, :answer, :path_length, :costs
    def initialize
        @grid = File.readlines('./maze.txt').map(&:chomp).map(&:chars)
        @answer = File.readlines('./maze.txt').map(&:chomp).map(&:chars)
        @start = nil
        @finish = nil
        @path = {}
        @costs = {}
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

    def manhattan_distance(pos1, pos2)
        row1, col1 = pos1
        row2, col2 = pos2
        (row1-row2).abs + (col1-col2).abs
    end

    def children(pos)
        row, col = pos
        childs = []
        [[0,1],[0,-1],[-1,0],[1,0]].each do |delta|
            delta_row, delta_col = delta
            next_row = row+delta_row
            next_col = col+delta_col
            childs << [next_row, next_col] if !offgrid?(next_row, next_col) && ["O", "E", " "].include?(@grid[next_row][next_col])
        end
        childs
    end

    def find_path
        queue = PriorityQueue.new
        queue << Node.new(@start, 0)
        @costs[@start] = 1
        while !queue.empty?
            current = queue.pop
            break if current.pos == @finish
            children(current.pos).each do |child_pos|
                row, col = child_pos
                new_cost = @costs[current.pos] + 1
                if !@costs[child_pos] || new_cost < @costs[child_pos]
                    @costs[child_pos] = new_cost
                    @path[child_pos] = current.pos
                    queue << Node.new(child_pos, -(new_cost + manhattan_distance(child_pos, @finish)))
                    @grid[row][col] = "O"
                end
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
        File.open("solution.txt","w") do |f|
            @answer.each {|line| f.puts line.join}
            f.puts ""
            f.puts "Shortest Path length is #{@path_length}"
        end
        File.open("grid.txt","w") do |f|
            @grid.each {|line| f.puts line.join}
            f.puts ""
            f.puts "Shortest Path length is #{@path_length}"
        end 
    end
end

class Node
    attr_accessor :priority, :pos
    def initialize(pos, priority)
        @priority = priority
        @pos = pos
    end
end

class PriorityQueue
    attr_accessor :arr
    def initialize
        @arr = [nil]
    end

    def empty?
        @arr == [nil]
    end

    def pop
        @arr[1], @arr[-1] = @arr[-1], @arr[1]
        val = @arr.pop
        sink
        return val
    end

    def <<(val)
        @arr << val
        return if @arr.length == 2
        last_index = @arr.length - 1
        compare_index = last_index/2
        while @arr[compare_index].priority < @arr[last_index].priority
            @arr[last_index], @arr[compare_index] = @arr[compare_index], @arr[last_index]
            last_index = compare_index
            break if last_index == 1
            compare_index /= 2
        end
    end

    def sink
        i = 1
        # p @arr
        while i < @arr.length
            max = nil
            max_index = nil
            [i, 2*i, 2*i+1].each do |idx|
                break if idx > @arr.length - 1
                val = @arr[idx].priority
                if !max || max < val
                    max = val
                    max_index = idx
                end
            end
            return if max_index == i
            # p i, max_index
            @arr[i], @arr[max_index] = @arr[max_index], @arr[i]
            i = max_index
        end
    end

end

# pq = PriorityQueue.new
# pq << 5
# p pq.arr
# pq << 2
# p pq.arr
# pq << 10
# p pq.arr
# pq << 2
# p pq.arr
# pq << 20
# p pq.arr
# pq << 0
# pq << 7
# p pq.arr
# pq << 16
# p pq.arr
# pq << 1
# p pq.arr
# pq << -3
# p pq.arr
# pq << 200
# p pq.arr
# pq << 1000
# p pq.arr
# pq.pop
# p pq.arr
# pq.pop
# p pq.arr
# pq.pop
# p pq.arr
# pq.pop
# p pq.arr
# pq.pop
# p pq.arr
# pq.pop
# p pq.arr
maze = Maze.new
maze.find_start_finish
t = Time.now
maze.find_path
maze.draw_path
f = Time.now
puts (f-t)*1000, 'ms'
maze.write_solution_file