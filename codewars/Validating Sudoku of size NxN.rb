# Validating Sudoku of Size NxN - 4Kyu
require 'matrix'
class Sudoku

 def initialize(arr)
   @arr = arr
  end
 def is_valid
 if @arr.flatten.any? {|x| x.class != Fixnum}
   return false
  end
 max_rows = @arr.length
 max_columns = @arr.max_by(&:length).length
   if @arr.any? {|row| row.length < max_columns}
    return false
  end
  if Math.sqrt(max_rows*max_columns).to_f != Math.sqrt(max_rows*max_columns).to_i
    return false
  end
   row_array = @arr
    column_array = row_array.transpose
    if row_array.any? {|row| row.uniq != row || row.any?{|row_element| row_element > max_rows || row_element < 1}}
      return false
    end
    if column_array.any? {|column| column.uniq != column || column.any?{|column_element| column_element > max_columns || column_element < 1}}
      return false
    end
sudoku = Matrix[*@arr]

boxsize = Math.sqrt(max_rows).to_i

rstart = 0
cstart = 0
boxarr = []
while cstart < max_rows
  while rstart <  max_rows
  rto = rstart+boxsize -1
  cto = cstart+boxsize -1
    boxarr << sudoku.minor(rstart..rto, cstart..cto).to_a.flatten
    rstart = rto + 1
  end
rstart = 0
cstart = cto + 1
end
if boxarr.any?{|box| box.uniq != box}
  return false
end
return true
end
end
