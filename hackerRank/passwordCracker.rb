def passwordCracker(passes, attempt)
    $hash = {}
    answer = recursion(passes, attempt)
    !answer ? 'WRONG PASSWORD' : answer.join(" ")
end

def recursion(passes, string_left, current_passes=[])
    return current_passes if string_left == ""
    passes.each do |pass|
        remainder = string_left.match(/^#{pass}(.*)/)
        if remainder
            next_arr = current_passes+[pass]
            
            x = recursion(passes, remainder[1], next_arr) unless $hash[next_arr.join]
            
            return x if x
            $hash[next_arr.join] = true
        end
    end
    nil
end

