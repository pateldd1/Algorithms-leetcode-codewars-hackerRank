# Code does not pass every test case. Pattern is apparent, however there's too many intricacies to chess to try any further.
class Piece
    attr_accessor :piece, :color
    def initialize(piece, color)
        @piece = piece
        @color = color
    end
end

class Board
    attr_accessor :grid, :moves, :traversed, :max_moves, :opponent_queen_pos, :directions, :board_states, :player_queen_pos
    def initialize(grid, max_moves, opponent_queen_pos, player_queen_pos)
        @grid = grid
        @directions = {
            "N" => [[-1,0],[-2,0],[-3,0]],
            "S" => [[1,0],[2,0],[3,0]],
            "E" => [[0,1],[0,2],[0,3]],
            "W" => [[0,-1],[0,-2],[0,-3]],
            "NW" => [[-1,-1],[-2,-2],[-3,-3]],
            "NE" => [[-1,1],[-2,2],[-3,3]],
            "SW" => [[1,-1],[2,-2],[3,-3]],
            "SE" => [[1,1],[2,2],[3,3]],
            "L" => [[-2,1],[1,-2],[1,2],[2,1],[-1,-2],[-2,-1],[-1,2],[2,-1]]
        }
        @moves = {
            "N" => ["L"],
            "Q" => ["NW", "NE", "SW", "SE", "S", "N", "E", "W"],
            "B" => ["NW", "NE", "SW", "SE"],
            "R" => ["S", "N", "E", "W"]
        }
        @traversed = {
            "N" => {},
            "Q" => {},
            "B" => {},
            "R" => {}
        }
        @board_states = {}
        @max_moves = max_moves
        @opponent_queen_pos = opponent_queen_pos
        @player_queen_pos = player_queen_pos
    end
    
    def offboard?(pos)
        row, col = pos
        row < 0 || col < 0 || row >= @grid.length || col >= @grid[0].length
    end
    
    def children(current_grid, pos, moves)
        row, col = pos
        # p pos
        piece = current_grid[row][col].piece
        # if !@traversed[piece][pos]
        #     @traversed[piece][pos] = moves
        # elsif @traversed[piece][pos] > moves
        #     @traversed[piece][pos] = moves
        # end
        piece_moves = @moves[piece]
        childs = []
        piece_moves.each do |move_direction|
            # p move_direction
            @directions[move_direction].each do |delta|
                next_row = row + delta[0]
                next_col = col + delta[1]
                next_pos = [next_row, next_col]
                if offboard?(next_pos)
                    if piece == "N"
                        next
                    else
                        break
                    end
                end
                next if @traversed[piece][next_pos]
                # p ok_queen_move?(current_grid, next_pos) if next_pos == [3,0] && piece == "Q"
                # p next_pos if next_pos == [1,2] && piece == "Q"
                # p piece, next_pos, 'current piece'
                next_pos_color = color(current_grid, next_pos)
                if next_pos_color
                    if next_pos_color == "white"
                        if piece == "N"
                            next
                        else
                            break
                        end
                    elsif next_pos_color == "black"
                        childs << next_pos
                        if piece == "N"
                            next
                        else
                            break
                        end
                    end
                end
                next if piece == "Q" && !ok_queen_move?(current_grid, next_pos)
                childs << next_pos
            end
        end
        childs
    end
    
    def ok_queen_move?(current_grid, pos)
        row, col = pos
        # p pos
        return true if [row, col] == @opponent_queen_pos
        @moves["Q"].each do |move_direction|
            @directions[move_direction].each do |delta|
                next_row = row + delta[0]
                next_col = col + delta[1]
                next_pos = [next_row, next_col]
                break if offboard?(next_pos)
                return false if next_pos == @opponent_queen_pos
                # p "hello", current_grid[next_row][next_col] if [row,col] == [3,0]
                break if current_grid[next_row][next_col]
            end
        end
        return true
    end
    
    def queen_exposed?(current_grid, piece_move_from_pos)
        opp_row, opp_col = @opponent_queen_pos
        row, col = piece_move_from_pos
        @moves["Q"].each do |move_direction|
            @directions[move_direction].each do |delta|
                next_row = opp_row + delta[0]
                next_col = opp_col + delta[1]
                next_pos = [next_row, next_col]
                # p next_pos, piece_move_from_pos if piece_move_from_pos == [2,2]
                next if next_pos == piece_move_from_pos
                break if offboard?(next_pos)
                # p current_grid[next_row][next_col]
                break if current_grid[next_row][next_col] && current_grid[next_row][next_col].piece != "Q"
                # p current_grid[next_row][next_col] && current_grid[next_row][next_col].piece == "Q"
                if (current_grid[next_row][next_col] && current_grid[next_row][next_col].piece == "Q")
                    # p "YAYYY"
                    return true
                end
            end
        end
        false
    end
    
    def color(current_grid, pos)
        row, col = pos
        return nil if !current_grid[row][col]
        return "white" if current_grid[row][col].color == "white"
        return "black"
    end
    
    def duped_board(from_grid)
        duped = Array.new(4) {Array.new(4)}
        from_grid.each_with_index do |row, rowIdx|
            row.each_with_index do |piece, colIdx|
                duped[rowIdx][colIdx] = piece.dup if piece
            end
        end
        duped
    end
    
    def move(current_grid, pos1, pos2, moves)
        row1, col1 = pos1
        row2, col2 = pos2
        # p [row2, col2], moves
        if moves <= @max_moves && [row2, col2] == @opponent_queen_pos
            return nil
        end
        duped = duped_board(current_grid)
        duped[row1][col1], duped[row2][col2] = duped[row2][col2], duped[row1][col1]
        return duped
    end
    
    def dfs(current_grid=@grid, moves=0)
        childs = []
        from_tos = []
        new_player_queen_pos = nil
        current_grid.each_with_index do |row, rowIdx|
            row.each_with_index do |piece, colIdx|
                if piece && piece.color == "white"
                    # # new_player_queen_pos = [rowIdx, colIdx] if piece == "Q"
                    # p piece.piece
                    # p queen_exposed?(current_grid, [rowIdx, colIdx])
                    if piece.piece != "Q" && queen_exposed?(current_grid, [rowIdx, colIdx])
                        # p "nexted" 
                        next
                    end
                    # p queen_exposed?(current_grid, [rowIdx, colIdx])
                    childs = children(current_grid, [rowIdx, colIdx], moves) 
                    # p piece.piece
                    # p [rowIdx, colIdx]
                    # p childs
                    childs.each do |child|
                        from_tos << [piece.piece, [rowIdx, colIdx], child]
                    end
                end
            end
        end
        # p from_tos
        from_tos.each do |p, from, to|
            @traversed[p][to] = true
            new_grid = move(current_grid, from, to, moves)
            return true if !new_grid
            x = dfs(new_grid, moves+1)
            return true if x
        end

        return false
    end

end

num_games = gets.strip.to_i
num_games.times do
    whites, blacks, max_moves = gets.strip.split.map(&:to_i)
    grid = Array.new(4) {Array.new(4)}
    letter_to_col = {"A" => 0, "B" => 1, "C" => 2, "D" => 3}
    piece = nil
    column = nil
    row = nil
    player_queen_pos = nil
    opponent_queen_pos = nil
    whites.times do
        piece, column, row = gets.strip.split
        row = row.to_i
        grid[4-row][letter_to_col[column]] = Piece.new(piece, "white")
        player_queen_pos = [4-row, letter_to_col[column]] if piece == "Q"
    end
    opponent_queen_pos = nil
    blacks.times do
        piece, column, row = gets.strip.split
        row = row.to_i
        grid[4-row][letter_to_col[column]] = Piece.new(piece, "black")
        opponent_queen_pos = [4-row, letter_to_col[column]] if piece == "Q"
    end

    chessboard = Board.new(grid, max_moves, opponent_queen_pos, player_queen_pos)

    if chessboard.dfs
        puts "YES"
    else
        puts "NO"
    end
end