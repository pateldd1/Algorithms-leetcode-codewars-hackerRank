def can_complete_circuit(gas, cost)
   deltas = []
    return -1 if gas.length == 1 && gas[0] < cost[0]
    return 0 if gas.length == 1 && gas[0] >= cost[0]
   gas.each_with_index do |g, idx|
       deltas << g-cost[idx]
   end
   i = 0
    if deltas.reduce(:+) < 0
        return -1
    end
    deltas += deltas
    sum = nil
    while i < deltas.length
        sum = deltas[i]
        j = i + 1
        if sum < 0
            i += 1
            next
        end
        while j < i + gas.length
            sum += deltas[j]
            if sum < 0
                i = j + 1
                break
            end
            j += 1
        end
        if j == i + gas.length
            return i
        end
    end
    -1
end

p can_complete_circuit([1,1,4,0,8,2,2],[2,2,2,3,4,1,1])