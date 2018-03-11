def getWays(n, c)
    c = c.sort.uniq.reject {|num| num > n}
    if c.empty?
        puts 0
        return
    end
    matrix = Array.new(c.length) { Array.new(n+1)}
    row = 0
    while row < matrix.length
        col = 0
        while col < matrix[0].length
            if col == 0
                matrix[row][col] = 1
            else
                if row == 0
                    if col % c[row] == 0
                        matrix[row][col] = 1
                    else
                        matrix[row][col] = 0
                    end
                else
                    x = matrix[row][col - c[row]] || 0
                    y = matrix[row-1][col]
                    matrix[row][col] = x + y
                end
            end
            col += 1
        end
        row += 1
    end
    puts matrix[-1][n]
end