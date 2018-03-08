class Board
    attr_accessor :grid, :traversed, :answer, :travelled
    def initialize(grid)
        @grid = grid
        @answer = Array.new(grid.length) {Array.new(grid[0].length, 0)}
        @traversed = {}
        @travelled = {}
    end
    
    def offboard?(pos)
        row, col = pos
        row < 0 || col < 0 || row >= @grid.length || col >= @grid[0].length
    end
    
    def children(pos)
        row, col = pos
        childs = []
        # found_zero = false
        [[0,1],[1,0],[-1,0],[0,-1]].each do |delta|
            delta_row, delta_col = delta
            next_pos = [row+delta_row, col+delta_col]
            next if offboard?(next_pos)
            next_pos_row, next_pos_col = next_pos
            # if @grid[next_pos_row][next_pos_col] == 0
            #     found_zero = true
            #     break
            # end
            childs << next_pos if !@travelled[next_pos]
        end
        return childs
        # return []
    end
    
    def zero_around?(pos)
        row, col = pos
        [[0,1],[1,0],[-1,0],[0,-1]].each do |delta|
            delta_row, delta_col = delta
            check_row = row + delta_row
            check_col = col + delta_col
            if !offboard?([check_row, check_col]) && @grid[check_row][check_col] == 0
                return true
            end
        end
        false
    end
    
    def bfs(pos)
        @traversed[pos] = true
        if zero_around?(pos)
            row, col = pos
            @answer[row][col] = 1
            return
        end
        @travelled = {}
        @travelled[pos] = true
        queue = [{pos: pos, dist: 0}]
        hash = {pos => {prev: nil, dist: 0}}
        fin = nil
        while !queue.empty?
            current = queue.shift
            childs = children(current[:pos])
            done = false
            childs.each do |child|
                queue << {pos: child, dist: current[:dist] + 1}
                @travelled[child] = true
                hash[child] = {}
                hash[child][:dist] = current[:dist] + 1
                hash[child][:prev] = current[:pos]
                if zero_around?(child)
                    fin = child
                    done = true
                    break
                end
            end
            break if done
        end
        max_dist = hash.max_by {|k,v| v[:dist]}[1][:dist]
        p hash, max_dist
        while fin
            p fin
            row, col = fin
            dist = hash[fin][:dist]
            @answer[row][col] = max_dist - dist + 1
            @traversed[fin] = true
            fin = hash[fin][:prev]
        end
    end
    
    def create_matrix
        @grid.each_with_index do |row, rowIdx|
            row.each_with_index do |col, colIdx|
                bfs([rowIdx, colIdx]) unless @traversed[[rowIdx, colIdx]] || col == 0
            end
        end
        @answer
    end
end




def update_matrix(matrix)
    board = Board.new(matrix)
    board.create_matrix
end

p update_matrix([[1,0,0],[1,1,1],[1,1,1]])