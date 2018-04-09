def rotate(matrix)
  matrix.reverse!
  tr_col = 0
  bl_col = 0
  tr_row = 0
  bl_row = 0
  tr_col_it = 0
  bl_col_it = 0
  tr_row_it = 0
  bl_row_it = 0

  row = 0
  while tr_col_it < 2*(matrix[0].length)
      while bl_row > tr_row && bl_col < tr_col
          
        if !offgrid?([bl_row, bl_col], matrix) && !offgrid?([tr_row, tr_col], matrix)
            matrix[bl_row][bl_col],   matrix[tr_row][tr_col] = matrix[tr_row][tr_col], matrix[bl_row][bl_col]
        end

         tr_col -= 1
         bl_col += 1
         tr_row += 1
         bl_row -= 1
      end
      tr_col_it += 1
      tr_row_it = 0
      bl_row_it += 1
      bl_col_it = 0
      tr_row = tr_row_it
      tr_col = tr_col_it
      bl_row = bl_row_it
      bl_col = bl_col_it
  end
  matrix
end

def offgrid?(pos, grid)
  row , col = pos
  row < 0 || col < 0 || row >= grid.length || col >= grid[0].length
end

p rotate(
    [
        [1,2,3],
        [4,5,6],
        [7,8,9]
    ]
)