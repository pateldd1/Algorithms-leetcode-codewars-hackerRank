def word_break(s, word_dict) 
    return [] if (s.chars.uniq & word_dict.join.chars.uniq) != s.chars.uniq
    $seen = {}
    recurse(s, word_dict.sort_by{|x| x.length}.reverse).map do |arr|
        arr.join(" ")
    end
end

def recurse(s, word_dict, curr_words=[], result=[])
    if s == ""
        result += [curr_words]
        return result
    end
    word_dict.each do |word|
        remainder = s.match(/^#{word}(.*)/)
        next if !remainder
        next_words = curr_words+[word]
        next if $seen[next_words.join]
        new_result = recurse(remainder[1], word_dict, next_words, result)
        if new_result == result
            $seen[next_words.join] = true
        end
        result = new_result
    end
    return result
end