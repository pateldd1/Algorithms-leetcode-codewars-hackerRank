def generate_matrix(n)
    return [] if n == 0
    arr = (1..n**2).to_a
    matrix = Array.new(n) { Array.new(n) }
    directions = [[0,1],[1,0],[0,-1],[-1,0]]
    dir_idx = 0
    matrix[0][0] = arr.shift
    row = 0
    col = 0
    while !arr.empty?
        delta = directions[dir_idx]
        delta_row, delta_col = delta
        if row+delta_row >= matrix.length || row+delta_row < 0 || col + delta_col >= matrix[0].length || col + delta_col < 0 || matrix[row+delta_row][col+delta_col]
            dir_idx = (dir_idx + 1) % 4
            delta = directions[dir_idx]
            delta_row, delta_col = delta
        end
        row += delta_row
        col += delta_col
        matrix[row][col] = arr.shift
        # p matrix
    end
    matrix
end