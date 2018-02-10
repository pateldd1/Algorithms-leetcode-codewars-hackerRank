def three_sum_closest(array, target)
    accum = []
    array.sort!
    closest = nil
  array.each_with_index do |n, i|
      break if i >= array.length-2
      next if i > 0 && array[i] == array[i-1]
      j = i + 1
      k = array.length - 1
      while j < k
          compare = array[i] + array[j] + array[k]
          closest = compare if !closest || (compare - target).abs < (closest - target).abs
          case compare <=> target
              when -1
                j += 1
              when 1
                k -= 1
              when 0
                return target
          end
      end
  end
  closest            
end