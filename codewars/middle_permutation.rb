def middle_permutation(string)
  pool = string.chars.sort
  mid = factorial(string.length)/2
  current = 0
  x = 1
  pool_pointer = 0
  ans_pointer = 0
  ans = [pool[pool_pointer]]
  
  while current <= mid
    loop do
      current += factorial(string.length - x)
      if current < mid
        pool_pointer += 1
        ans[ans_pointer] = pool[pool_pointer]
      elsif current == mid
        break
      else
        current -= factorial(string.length - x)
        break
      end
    end
    pool.delete_at(pool_pointer)
    if current == mid
      remaining = pool.reverse
      return (ans + remaining).join
    else
      ans_pointer += 1
      pool_pointer = 0
      ans[ans_pointer] = pool[pool_pointer]
      x += 1
    end
  end
end

def factorial(n)
  (1..n).reduce(:*)
end
