def three_sum(array)
    accum = []
    array.sort!
  array.each_with_index do |n, i|
      break if n > 0 || i > array.length-2
      next if i > 0 && array[i] == array[i-1]
      j = i + 1
      k = array.length - 1
      while j < k
          compare = array[i] + array[j] + array[k]
          case compare <=> 0
              when -1
                j += 1
              when 1
                k -= 1
              when 0
                accum << [array[i], array[j], array[k]]
                while j < k && array[j] == array[j+1]
                    j += 1
                end
                while j < k && array[k] == array[k-1]
                    k -= 1
                end
                j += 1
                k -= 1
          end
      end
  end
  accum            
end