def maxSubarray(arr)
    i = 0
    if arr.all? {|val| val < 0}
        return [arr.max, arr.max]
    end
    while arr[i] < 0
        i += 1
    end
    positive_sum = arr[i]
    running_totals = [arr[i]]
    i += 1
    while i < arr.length
        current = arr[i]
        if current > 0
            positive_sum += current
            running_totals[-1] += current
        else
            if running_totals[-1] + current < 0
                running_totals << 0
            else
                running_totals << running_totals[-1]
                running_totals[-1] += current
            end
        end
        i += 1
    end
    [running_totals.max, positive_sum]
end

p maxSubarray([2, -1, 2, 3, 4, -5])