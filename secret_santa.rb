def get_combos(arr)
    hash = {}
    arr.shuffle!
    arr.each_cons(2).each do |pair|
        x, y = pair
        hash[x] = y
    end
    hash[arr[-1]] = arr[0]
end

get_combos(["john", "joe", "jack"])