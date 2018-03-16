# INCOMPLETE
require 'prime'

def get_next_num(num)
    return 0 if num <= 1
    prime_factors = Prime.prime_division(num).map do |prime, power|
        [prime]*power
    end.flatten
    current = 1
    alt = num
    prime_factors.reverse.each do |prime|
        current *= prime
        alt /= prime
        if current >= alt
            return current
        end
    end
end

def bfs(num)
    queue = [{ num => 0 }]
    tried = {}
    next_num = nil
    while !queue.empty?
        new_queue = []
        done = nil
        queue.each do |h|
            val = h.first[0]
            tried[val] = true
            count = h.first[1]
            if val == 0
                done = count
                break
            end
            next_num = get_next_num(val)
            new_queue << { next_num => count + 1 } unless tried[next_num]
            new_queue << { val-1 => count + 1} unless tried[val-1]
        end
        return done if done
        queue = new_queue
    end
    return nil
end

p bfs(962466)