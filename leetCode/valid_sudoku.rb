def is_valid_sudoku(matrix)
  matrix.each do |row|
    return false if compact(row).uniq != compact(row)
  end
  matrix.transpose.each do |row|
    return false if compact(row).uniq != compact(row)
  end 
  i = 0
  j = 3
      3.times do
          k = 0
          l = 3
          3.times do
            arr = []
            (i...j).each do |row|
              (k...l).each do |col|
                arr << matrix[row][col]
              end
            end
             return false if compact(arr).uniq != compact(arr)
           k += 3
           l += 3
          end
          i += 3
          j += 3
      end
  true
end

def compact(arr)
    arr.reject {|val| val == "."}
end

p is_valid_sudoku(
    [[".","8","7","6","5","4","3","2","1"],
["2",".",".",".",".",".",".",".","."],
["3",".",".",".",".",".",".",".","."],
["4",".",".",".",".",".",".",".","."],
["5",".",".",".",".",".",".",".","."],
["6",".",".",".",".",".",".",".","."],
["7",".",".",".",".",".",".",".","."],
["8",".",".",".",".",".",".",".","."],
["9",".",".",".",".",".",".",".","."]]
)