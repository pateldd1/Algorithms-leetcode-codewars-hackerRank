n = gets.strip.to_i
a = Array.new(n)
for a_i in (0..n-1)
    a_t = gets.strip
    a[a_i] = a_t.split(' ').map(&:to_i)
end

right = [0,0]
left = [0, n-1]
right_sum = 0
left_sum = 0

a.each_with_index do |row, rowidx|
    row.each_with_index do |col_val, colidx|
       row, col = right
       row1, col1 = left
       if rowidx == row && colidx == col
           
            right_sum += a[rowidx][colidx]
            row += 1
            col += 1
            right = [row, col]
       end
       if rowidx == row1 && colidx == col1
           left_sum += a[rowidx][colidx]
           row1 += 1
           col1 -= 1
           left = [row1, col1]
       end
    end
end

p (right_sum - left_sum).abs