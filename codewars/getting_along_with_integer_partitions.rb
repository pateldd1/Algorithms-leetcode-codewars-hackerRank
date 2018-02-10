# Getting Along With Integer Partitions - 4Kyu

HASH = {1=>[1]}
HASH_TWO = {}
def part(n)
if n == 1
  mult_array = [1]
else
  mult_array = partition(n).sort
end
range = mult_array[-1] - mult_array[0]
average = mult_array.reduce(:+)/mult_array.length.to_f
average = "%.2f" % average
center = (mult_array.length - 1)/2.to_f
if center.to_i == center.to_f
median = mult_array[center]
else
median = (mult_array[center]+mult_array[center+1])/2.to_f
end
median = "%.2f" % median
"Range: #{range} Average: #{average} Median: #{median}"
end

def partition(n)
  return HASH[n] if HASH[n]
  arr = separate(n)
  arr.each do |x|
    partition(x)
    partition(n-x)
  end
  sum = []
  arr.each do |a|
    sum += merge(a,n-a) + [n]
  end
  sum.uniq!
  HASH[n] = sum
end

def merge(a,b)
  return HASH_TWO[[a,b]] if HASH_TWO[[a,b]]
  arr1 = HASH[a]
  arr2 = HASH[b]
  HASH_TWO[[a,b]] = arr1.product(arr2).map{|x,y| x*y}.uniq
end

def separate(val)
  x = 1
  arr = []
  (val/2).times do
    arr << val - x
    x += 1
  end
  arr
end
