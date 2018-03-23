def pick_peaks(arr)
    p arr
    sliced_array = arr.slice_when {|before,after| after < before}.to_a
    peaks = []
    pos = []
    total_length = 0
    sliced_array.each_with_index do |subarr,inx|

    if subarr.length > 1 && inx != sliced_array.length - 1 && subarr.uniq.length != 1
        peaks << subarr[-1]
        subindex = subarr.index(subarr[-1])
        pos << total_length + subindex
    end
    total_length += subarr.length
    end

    return {"pos" => pos, "peaks" => peaks}
end