def left_run(array)
  new_array = []
  index = 0
  while index < array.length
    if array[index].is_a?(Array)
      duped = array[index].dup
      new_array << left_run(duped)
      index += 1
      next
    end
    remaining = array.length - index
    decision = array[index] % remaining
    if decision > 2
      new_array << array[index..index+decision-1]
      index += decision
    else
      new_array << array[index]
      index += 1
    end
  end
 new_array
end

def right_run(array)
  new_array = []
  index = array.length - 1
  while index >= 0
    if array[index].is_a?(Array)
      duped = array[index].dup
      new_array.unshift(right_run(duped))
      index -= 1
      next
    end
    remaining = index + 1
    decision = array[index] % remaining
    if decision > 2
      new_array.unshift(array[index-decision+1..index])
      index -= decision
    else
      new_array.unshift(array[index])
      index -= 1
    end
  end
 new_array
end

def unflatten(array,times)
  if times.even?
    (times/2).times do
      array = left_run(array)
      array = right_run(array)
    end
  else
    (times/2).times do
      array = left_run(array)
      array = right_run(array)
    end
    array = left_run(array)
  end
  array
end