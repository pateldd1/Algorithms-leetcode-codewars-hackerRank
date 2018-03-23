def find_all(n, k)
    lo = find_low(n,k)
    return [] if !lo
    hi = find_high(n,k)
    current_vals = [lo]
    seen = {lo=>true}
    new_vals = []
  until current_vals.empty?
    new_vals = []
  current_vals.each do |current|
    current.each_with_index do |num1,inx1|
      next if inx1 == current.length - 1 && num1 == 9
      next if inx1 < current.length - 1 && current[inx1+1] == current[inx1]
      addon = current.dup
      addon[inx1] += 1
      addon.each_with_index do |num2,inx2|
        new_add = addon.dup
        next if inx2 == inx1
        next if inx2 == 0 && num2 == 1
        next if inx2 > 0 && new_add[inx2-1] == new_add[inx2]
        new_add[inx2] -= 1
        next if seen[new_add]
        new_vals << new_add
        seen[new_add] = true
      end
    end
  end
  current_vals = new_vals
  end
  [seen.keys.size,lo.join.to_i,hi.join.to_i]
end

def find_high(sum,num_digits)
  arr = []
  num_digits.downto(1) do |remaining|
    addon = sum/remaining
    arr << addon
    sum -= addon
  end
  arr
end

def find_low(sum,num_digits)
  return false if 9*num_digits < sum
  arr = []
  index = num_digits - 1
  until index < 0
    if sum > 9 + index
      arr.unshift(9)
      sum -= 9
    else
      addon = sum - index
      arr.unshift(addon)
      sum -= addon
    end
    index -= 1
  end
  arr
end