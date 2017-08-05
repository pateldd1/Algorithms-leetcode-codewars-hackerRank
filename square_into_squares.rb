# Square Into Squares - Protect Trees - 4Kyu

def decompose(n,sub=(n-1)**2,arr=[n-1])
  array = square_func(n,sub,arr)
  if array && array.uniq== array
   return array
  end
  return nil if !array || array.size == 2
  x = array[-2]
  x-=1
  answer = []
  while x > 0
   array = square_func(n,x**2+
   (n-1)**2,[x,n-1])
   if array
    if array.uniq==array
      sorted = array.sort
      answer << sorted.reverse
    end
   end
   x-=1
  end
  return answer.sort[-1].reverse
end

def square_func(n,sub,arr)
  remainder = n**2-sub
  val = Math.sqrt(remainder).to_i
  if val == 0
    if remainder == 0
     return arr
    else
     return nil
    end
  else
    arr.unshift(val)
    square_func(n,val**2+sub,arr)
  end
end
