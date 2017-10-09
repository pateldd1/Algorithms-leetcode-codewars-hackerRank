Most frequest integer

Most frequent integer -> go through and make a hash of all the integers and their counts. Sort by the value and return the last key

Find values that add up to 10 in linear time
def find_tens(arr)
  hash = {}
  ans = []
  arr.each do |val|
    if hash[val]
      ans << [hash[val], val]
    else
      hash[10 - val] = val
    end
  end
  ans
end

p find_tens([0,5,6,2,4,5])

Check if an array is a rotation of another array

def check_rotation(arr1, arr2)
  return false if arr1.length != arr2.length
  pointer1 = 0
  pointer2 = 0
  while arr1[pointer1] != arr2[pointer2]
    pointer1 = (pointer1 + 1) % arr1.length
    return false if pointer1 == 0
  end
  arr1.length.times do
    pointer2 = (pointer2 + 1) % arr1.length
    pointer1 = (pointer1 + 1) % arr2.length
    return false if arr1[pointer1] != arr2[pointer2]
  end
  true
end

p check_rotation([1,2,3,5,6,7,8,12], [5,6,7,8,12,1,2,3])

Iterative fibonacci
def fib(n)
  return 1 if n == 0
  a = 1
  b = 1
  c = nil
  (n - 1).times do
    c = a + b
    a = b
    b = c
  end
  c
end

Recursive fibonacci with dynamic programming
HASH = {}
def fib(n)
  return 1 if [0,1].include?(n)
  return HASH[n] if HASH[n]
  HASH[n] = fib(n - 2) + fib(n-1)
end

p fib(6)

Search for a number in a rotated sorted list

def search(arr, value)
  lo = 0
  hi = arr.length - 1
  mid = nil
  loop do
    mid = (lo+hi)/2
    break if hi == mid || lo == mid
    left = arr[lo]
    right = arr[hi]
    middle = arr[mid]
    if middle > right
      lo = mid
    elsif left > middle
      hi = mid
    end
  end
  return arr[mid] if arr[mid] == value
  if arr[0] < value && arr[mid] > value
    bsearch(arr, value, 0, mid)
  elsif arr[mid+1] < value && arr.last > value
    bsearch(arr, value, mid+1, arr.length-1)
  else
    nil
  end
end

def bsearch(arr, target, lo, hi)
  while lo < hi
    mid = (lo+hi)/2
    case target <=> arr[mid]
    when -1
      hi = mid - 1
    when 1
      lo = mid + 1
    when 0
      return mid
    end
  end
  if arr[lo] == target
    return lo
  else
    return nil
  end
end

p search([7,8,9,10,11,12,1,2,3,4,5,6], 9)

Find the first n primes with dynamic programming
def first_n_primes(n)
  return [] if n == 0
  return [2] if n == 1
  return [2, 3] if n == 2
  primes = [2, 3]
  current = 4
  while primes.length < n
    if current % 2 == 0
      current += 1
      next
    end
    bool = true
    up_to = Math.sqrt(current).to_i
    primes.each do |prime|
      break if prime > up_to
      if current % prime == 0
        bool = false
        break
      end
    end
    if bool
      primes << current
    end
    current += 1
  end
  primes
end

p first_n_primes(10)

HASH = ((0..9).zip("0".."9") + (10..15).zip("a".."f")).to_h
def base_conversion(num, base)
  return "" if num == 0
  addition = num % base
  num /= base
  base_conversion(num, base) + HASH[addition]
end

def to_base_10(num, base)
  current = 0
  sum = 0
  g = num.reverse
  while current < num.length
    x = g[current]
    sum += HASH.invert[x]*base**(current)
    current += 1
  end
  sum
end


p base_conversion(832423, 16)
p 832423.to_s(16)
p to_base_10("cb3a7",16)

Recursively reverse a linked list
def reverse_list(head)
   return nil if !head
   return head if !head.next
   $tail = nil
   recurse(head, head.next)
   $tail
end

def recurse(before, after)
    if !after
        $tail = before
        return before
    end
    before.next = nil
    new_link = recurse(after, after.next)
    new_link.next = before
    new_link.next
end

Check if a linked List is a palindrome
To do this push all the link list values onto a stack and then compare the values with linked list
Values as you pop values off of the stack.

def recursive_reverse(str)
  return "" if str.empty?
  str.pop + recursive_reverse(str)
end

p recursive_reverse("hellothere".chars)
