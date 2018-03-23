def zeros(n)
    if n == 0
        return 0
    end
   exponent = (Math.log(n)/Math.log(5)).to_i
   zero_count = 0
    until exponent == 0
      zero_count += (n / (5**exponent))
      exponent -= 1
    end
  zero_count
end