def count_bits(num)
    return [0] if num == 0
    n = Math.log(num, 2).to_i
    start_array = (0..n).map {|x| 2**x}.reverse
    [0] + (1..num).map {|y| form_number(start_array, y)}
end

def form_number(array, num)
    sum = 0
    i = 0
    count = 0
    while i < array.length
        if sum + array[i] == num
            count += 1
            return count
        elsif sum + array[i] > num
            i += 1
        else
            sum += array[i]
            i += 1
            count += 1
        end
    end
    count
end