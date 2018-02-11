def lilysHomework(arr)
    sorted = arr.sort
    reversed = sorted.reverse
    return [process(sorted, arr.dup), process(reversed, arr.dup)].min
end

def process(needed, arr)
    hash = {}
    arr.each_with_index do |num, idx|
        hash[num] = idx
    end
    i = 0
    inversions = 0
    while i < arr.length
        needs_to_be_here = needed[i]
        if needs_to_be_here != arr[i]
            arr_index = hash[needs_to_be_here]
            arr[i], arr[arr_index] = arr[arr_index], arr[i]
            hash[arr[i]] = i
            hash[arr[arr_index]] = arr_index
            inversions += 1
        end
        i += 1
    end
    inversions
end

n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)
result = lilysHomework(arr)
puts result