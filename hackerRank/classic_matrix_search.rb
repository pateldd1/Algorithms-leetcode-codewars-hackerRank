class Board
    attr_accessor :grid, :traversed, :max, :temp_count
    def initialize(grid)
        @grid = grid
        @traversed = {}
        @max = nil
        @temp_count = 0
    end

    def on_board?(pos)
        row, col = pos
        row >= 0 && row < @grid.length && col >= 0 && col < @grid[0].length
    end

    def children(pos)
        row, col = pos
        childs = []
        [[0,1],[1,0],[0,-1],[-1,0],[1,1],[-1,-1],[1,-1],[-1,1]].each do |delta|
            delta_row, delta_col = delta
            c = [row+delta_row, col+delta_col]
            childs.push(c) if on_board?(c) && !@traversed[c] && @grid[c[0]][c[1]] == 1
        end
        childs
    end

    def recursion(pos)
        @traversed[pos] = true
        @temp_count += 1
        children(pos).each do |child|
            recursion(child) if !@traversed[child]
        end
    end

    def travel
        count = nil
        @grid.each_with_index do |row, row_idx|
            row.each_with_index do |col, col_idx|
                pos = [row_idx, col_idx]
                if col == 1 && !@traversed[pos]
                    @temp_count = 0
                    recursion(pos)
                    if !@max || @temp_count > @max
                        @max = @temp_count
                    end
                end
            end
        end
        @max
    end
end

def connectedCell(matrix)
    board = Board.new(matrix)
    board.travel
end

x = 
[0, 1, 0, 0, 0, 0, 1, 1, 0],
[1, 1, 0, 0, 1, 0, 0, 0, 1],
[0, 0, 0, 0, 1, 0, 1, 0, 0],
[0, 1, 1, 1, 0, 1, 0, 1, 1],
[0, 1, 1, 1, 0, 0, 1, 1, 0],
[0, 1, 0, 1, 1, 0, 1, 1, 0],
[0, 1, 0, 0, 1, 1, 0, 1, 1],
[1, 0, 1, 1, 1, 1, 0, 0, 0]
# expect 29
p connectedCell(x)
# p connectedCell(
# [[1, 1, 0, 0],
# [0, 1, 1, 0],
# [0, 0, 0, 0],
# [1, 1, 1, 0]])
# expect 4