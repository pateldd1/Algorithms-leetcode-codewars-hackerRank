def sol_equa(n)
  answer = []
  factor(n).each do |lo,hi|
    next if (lo + hi).odd?
    x = (lo + hi) / 2
    y = (hi-x)/2.to_f
    if y.to_i == y
      answer << [x,y.to_i]
    end
  end
  answer
end

def factor(n)
  arr = []
  m = Math.sqrt(n)
  if m == m.to_i
    arr << [m.to_i,m.to_i]
  end
  (1...m).each do |fac|
    if n % fac == 0
      arr << [fac,n/fac]
    end
  end
  arr
end