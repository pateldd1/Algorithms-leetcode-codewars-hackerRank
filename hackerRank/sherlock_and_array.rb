def solve(a)
    sum_left = 0
    sum_right = a.reduce(:+)
    a = [0] + a + [0]
    a[1..-2].each do |num|
      if sum_left == sum_right - num
          return "YES"
      end
      sum_right -= num
      sum_left += num
    end
    'NO'
end