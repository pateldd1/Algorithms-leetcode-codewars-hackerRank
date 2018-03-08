def search_matrix(matrix, target)
    total_array = []
    matrix.each do |subarray|
        total_array += subarray
    end
    !!total_array.bsearch { |val| target - val }
end