def largestRectangle(h)
    return 0 if h.length <= 1
    max_area = nil
    h.each_with_index do |val, idx|
        count = get_around(h, idx)
        area = count*val
        max_area = area if !max_area || area > max_area
    end
    max_area
end

def get_around(arr, idx)
    comp = arr[idx]
    i = idx-1
    j = idx+1
    count = 1
    while i >= 0
        val = arr[i]
        if val < comp
            break
        else
            count += 1
            i -= 1
        end
    end
    while j < arr.length
        val = arr[j]
        if val < comp
            break
        else
            count += 1
            j += 1
        end
    end
    count
end