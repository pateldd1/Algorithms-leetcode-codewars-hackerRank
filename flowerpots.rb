def getDay(positions, k)
    posToDay = []
    positions.each_with_index do |pos, day|
        posToDay[pos-1] = day
    end
    i = 0
    j = k + 1
    max = nil
    min = nil
    start = nil
    current_val = nil
    while j < posToDay.length
        start = i + 1
        while start < j
            min = nil
            current_val = posToDay[start]
            if !min || current_val < min
                min = current_val
            end
            start += 1
        end
        max = [posToDay[i], posToDay[j]].max
        if max == posToDay[i]
            max_index = i
        else
            max_index = j
        end
        if min > max
            return posToDay[max_index] + 1
        end
        j += 1
        i += 1
    end
    -1
end

# p getDay([4,1,6,5,2,3], 1)
n = 3
20.times do
    x = Time.now
    positions = (1..n).to_a.shuffle
    getDay(positions, 10)
    n *= 2
    y = Time.now
    p (y-x)*1000
end