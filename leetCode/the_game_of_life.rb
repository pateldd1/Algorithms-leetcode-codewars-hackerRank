class Board
    attr_accessor :grid
    def initialize(grid)
        @grid = grid
    end
    
    def count(pos)
        row, col = pos
        total = 0
        [[0,1],[1,0],[-1,0],[0,-1],[-1,-1],[1,1],[1,-1],[-1,1]].each do |delta|
            delta_row, delta_col = delta
            new_row = row + delta_row
            new_col = col + delta_col
            new_pos = [new_row, new_col]
            total += 1 if !offboard?(new_pos) && (@grid[new_row][new_col] == 1 || @grid[new_row][new_col] == 2)
        end
        total
    end
    
    def offboard?(pos)
        row, col = pos
        row < 0 || col < 0 || row >= @grid.length || col >= @grid[0].length
    end
    
    def traverse
        val = nil
        the_count = nil
        @grid.each_with_index do |row, rowIdx|
            row.each_with_index do |col, colIdx|
                val = col
                the_count = count([rowIdx, colIdx])
                if val == 1
                    if the_count < 2 || the_count > 3
                        @grid[rowIdx][colIdx] = 2
                    else
                        @grid[rowIdx][colIdx] = 1
                    end
                elsif val == 0
                    if the_count == 3
                        @grid[rowIdx][colIdx] = 3
                    else
                        @grid[rowIdx][colIdx] = 0
                    end
                end
            end
        end
        @grid.each_with_index do |row, rowIdx|
            row.each_with_index do |col, colIdx|
                val = col
                if val == 2
                    @grid[rowIdx][colIdx] = 0
                elsif val == 3
                    @grid[rowIdx][colIdx] = 1
                end
            end
        end
    end
    
    
end


def game_of_life(board)
  the_board = Board.new(board)
  the_board.traverse
end