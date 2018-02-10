# The Millionth Fibonacci Kata - 3Kyu and optimized for time

def fib(n)
  return 1 if n == 1 || n == -1
  return 0 if n == 0
arr = []
  b = n.abs
  a = b
  hash = {0=>1,1=>1,2=>2,3=>3,4=>5,5=>8,6=>13,7=>21,8=>34,9=>55,10=>89}
  nv_hash = {}
  until a == 0
    arr.unshift(a)
    a/=2
  end
  (1..arr.length-2).each do |inx|
    val = arr[inx]
    next_val = arr[inx+1]
    if next_val.even?
      nv_hash[next_val] = hash[val]**2 + hash[val-1]**2
      nv_hash[next_val+1] = (hash[val]**2 + hash[val+1]**2)-(hash[val]**2 + hash[val-1]**2)
    else
      nv_hash[next_val] = (hash[val]**2 + hash[val+1]**2)-(hash[val]**2 + hash[val-1]**2)
      nv_hash[next_val+1] = hash[val+1]**2 + hash[val]**2
    end
    nv_hash[next_val-1] = nv_hash[next_val+1] - nv_hash[next_val]
    nv_hash[next_val-2] = nv_hash[next_val] - nv_hash[next_val-1]
    nv_hash[next_val+2] = nv_hash[next_val] + nv_hash[next_val+1]
    hash = nv_hash
    nv_hash = {}
  end
  return hash[b-1] if n > 0 || (n < 0 && n.odd?)
  return -hash[b-1]
end
