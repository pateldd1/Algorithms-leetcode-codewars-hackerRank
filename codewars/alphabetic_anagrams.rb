def listPosition(word)
    letter_count_hash = Hash.new(0)
    word.each_char do |ch|
      letter_count_hash[ch] += 1
    end
    total_repeats = 0
    letter_count_hash.each do |k,v|
      total_repeats += v if v > 1
    end
    last_index = word.length - 1
    arr = word.chars
    i = 0
    j = 1
    sum = 0
    repeats = total_repeats
    while i < arr.length - 1
      seen = {}
      lesser_letters = 0
      current = arr[i]
      while j < arr.length
        letter = arr[j]
        if !seen[letter] && letter < current
        if letter_count_hash[letter] > 1
          repeats = total_repeats - 1
        else
          repeats = total_repeats
        end
         sum += (fac(last_index - i)/repeat_calc(letter_count_hash,letter))
         seen[letter] = true
        end
        j += 1
      end
      letter_count_hash[current] -= 1
      i += 1
      j = i + 1
    end
    sum + 1
end

def fac(n)
  return 1 if n == 0
  (1..n).reduce(:*)
end

def repeat_calc(hash,substitute)
  sum = 1
  hash.each do |k,v|
    if k == substitute
      sum *= fac(v-1)
    else
      sum *= fac(v)
    end
  end
  sum
end