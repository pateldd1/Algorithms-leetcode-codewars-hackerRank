def numeric_palindrome(*args)
  if args.all? {|vals| vals == 0}
    return 0
  end
 args.delete(0)
  x = 2
  consider = []
  while x <= args.size
    numbers = args.combination(x).to_a
    numbers.map do |nums|
      get_palindrome(nums.reduce(:*))
    end.each do |val|
      consider << val
    end
    x += 1
  end
  consider.max
end

def get_palindrome(num)
  hash = Hash.new(0)
  pool = num.to_s.chars.sort.reverse.map(&:to_i)
  pool.each do |val|
    hash[val] += 1
  end
  arr1 = []
  arr2 = []
  hash.each do |k,v|
    if v >= 2
      addon = v/2
     addon.times do
      arr1 << k
      arr2 << k
     end
     hash[k] -= 2*addon
    end
  end
  return pool.max if arr1.uniq == [0]
  odd_key = hash.key(1)
  arr1 << odd_key if odd_key
  answer = (arr1 + arr2.reverse).join.to_i
end