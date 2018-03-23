def smallest(n)
 digits = n.to_s.chars.map(&:to_i)
 arr1 = digits.dup
 arr2 = digits.dup
 min_index = arr1.rindex(arr1[1..-1].min)
 min_index -= 1 while arr1[min_index-1] == arr1[min_index]
 a = sink(arr1)
 b = float(arr2,min_index)
  case a[0] <=> b[0]
    when 1
      b
    else
      a
  end
end

def sink(arr)
  i = 0
  j = 0
  while i < arr.length - 1
    if arr[i+1] < arr[i]
      arr[i+1],arr[i] = arr[i],arr[i+1]
      i += 1
      j = i
    elsif arr[i+1] == arr[i]
      i += 1
    else
      break
    end   
  end
  arr.shift if arr[0] == 0
  [arr.join.to_i,0,j]
end

def float(arr,min_index)
  i = min_index
  j = min_index
  while i > 0
    if arr[i-1] >= arr[i]
      arr[i-1],arr[i] = arr[i],arr[i-1]
      i -= 1
    else
      break
    end
  end
  arr.shift if arr[0] == 0
  [arr.join.to_i,min_index,i]
end