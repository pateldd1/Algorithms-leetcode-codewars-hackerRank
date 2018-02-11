def spiral_order(matrix)
    return [] if matrix.empty? || matrix == [[]]
    result = []
    current = matrix.shift
    current + spiral_order(matrix.transpose.reverse)
end