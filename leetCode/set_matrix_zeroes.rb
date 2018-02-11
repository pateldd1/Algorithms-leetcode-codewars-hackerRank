def set_zeroes(matrix)
    rows = {}
    cols = {}
    matrix.each_with_index do |row, row_idx|
        row.each_with_index do |col, col_idx|
            if  col == 0
                rows[row_idx] = true
                cols[col_idx] = true
            end
        end
    end
    matrix.each_with_index do |row, row_idx|
        row.each_with_index do |col, col_idx|
            if  rows[row_idx]
                row[col_idx] = 0
                next
            end
            if cols[col_idx]
                row[col_idx] = 0
            end
        end
    end
end