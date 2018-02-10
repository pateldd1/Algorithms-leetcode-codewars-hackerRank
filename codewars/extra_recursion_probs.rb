require 'byebug'
def range(start, finish)
  return [] if finish < start
  return [start] if finish == start
  # range(start+1, finish) << start
  range(start, finish - 1).push(finish)
end

def sum(array)
  return 0 if array.empty?
  array.first + sum(array[1..-1])

end

def iterative_sum(array)
  array.reduce(:+)
end

def exponent(base, power)
  return 1 if power.zero?
  return base if power == 1
  if power.even?
    step = exponent(base, power / 2)
    step * step
  else
    step = exponent(base, (power - 1) / 2)
    base * step * step
  end

end

def exponent2(base, power)
  return 1 if power.zero?
  base * exponent(base, power -1)
end

def deep_dup(array)
  result = []
  array.each do |entry|
    if entry.is_a?(Array)
      result << deep_dup(entry)
    else
      result << entry
    end
  end
  result
end

def dup2(array)
  result = []
  array.each do |entry|
    result << entry
  end
  result
end

def deep_dup_ternary(array)
  result = []
  array.each do |entry|
    entry.is_a?(Array) ? result << deep_dup(entry) : result << entry
  end
  result
end

def iterative_fibonacci(number)
  first_num = 1
  second_num = 1
  third_num = nil
  number.times do
    third_num = first_num + second_num
    first_num, second_num = second_num, third_num
  end
  third_num
end

HASH = {}

def fibonacci(number)
  return 1 if (0..1).include?(number)
  fibonacci(number-1) + fibonacci(number-2)
end

def hash_fibonacci(number)
  return 1 if (0..1).include?(number)
  return HASH[number] if HASH[number]
  HASH[number] = hash_fibonacci(number-1) + hash_fibonacci(number-2)
end

def array_subsets(array)
  result = []
  # return result if array.length.zero?
  array.each_with_index do |e,i|
    reduced = array[0...i] + array[i+1..-1]
    next_subset = array_subsets(reduced)
    result << next_subset
    result << next_subset.zip([e])
  end
  result.uniq
end

def bsearch(array, value)
  mid = (array.length - 1) / 2
  return nil if array.size <= 1 && value != array[0]
  if value < array[mid]
    bsearch(array[0...mid], value)
  elsif value > array[mid]
    bsearch(array[mid+1..-1], value)
  else
    return mid
  end
end

def merge_sort(array)
  return array if array.length <= 1
  mid = (array.length - 1) / 2
  first = merge_sort(array[0..mid])
  second = merge_sort(array[mid+1..-1])
  merge(first,second)
end

def merge(first_array, second_array)
  aux = []
  until first_array.empty? && second_array.empty?
    if first_array.empty?
      aux += second_array
      break
    end
    if second_array.empty?
      aux += first_array
      break
    end
    if first_array.first <= second_array.first
      aux << first_array.shift
    else
      aux << second_array.shift
    end
  end
  aux
end

def greedy_make_change(amount, array)
  coins = array.sort.reverse
  greedy_recursive(amount, coins)
end

def greedy_recursive(amount, array, remainder = amount, answer = [])
  next_coin = array.find { |e| e <= remainder }
  return answer if next_coin.nil?
  remainder -= next_coin
  answer << next_coin
  greedy_recursive(amount, array, remainder, answer)
end

def make_better_change_NOT(amount, array, remainder = amount, answer = [], max = greedy_make_change(amount,array))
  return answer if array.all? { |coin| amount < coin }
  array.each do |coin|
    if coin < remainder
      answer << coin
      remainder -= coin
      make_better_change(amount,array.select{ |e| e >= coin }, remainder, answer)
    else
      max = answer if answer.count < max.count
    end
  end
  max
end

def find_least_change(amount,array)
  make_better_change(amount, array).min_by {|subarr| subarr.length}
end

def make_better_change(amount, array, answer = [], possible_results = [])
  unless answer.empty?
    return nil if answer.reduce(:+) > amount
    return answer if answer.reduce(:+) == amount
  end
  array.each do |coin|
    attempt = make_better_change(amount, array, answer + [coin], possible_results)
    next unless attempt
    possible_results << attempt if attempt.reduce(:+) == amount
  end
  possible_results
end

def permutations(array,addon=[],extension = [])
  if array.empty?
    return extension + [addon]
  end
  array.each do |val|
    extension = permutations(array.reject{|x| x == val},addon+[val],extension)
  end
  extension
end

def eight_queens_possibilities(current_row, taken_columns, positions)
  return [positions] if current_row == 8
  all_positions = []
  avoid = []
  columns_left = (0..7).to_a
  taken_columns.reverse.each_with_index do |col,inx|
    avoid.push(col,col+inx+1,col-inx-1)
  end
  columns_left -= avoid
  return nil if columns_left.empty?
  columns_left.each do |col|
    duped_poses = positions.dup
    duped_poses << [current_row,col]
    x = eight_queens_possibilities(current_row+1,taken_columns+[col],duped_poses)
    all_positions += x if x
  end
  all_positions
end

def subsets(arr)
  return [[]] if arr.empty?
  result = []
  addon = arr.pop
  result += subsets(arr)
  result + result.map do |subarr|
    subarr + [addon]
  end
end
