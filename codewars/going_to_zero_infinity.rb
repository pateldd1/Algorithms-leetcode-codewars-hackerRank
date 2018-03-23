def going(n)
  counter = n
  z = counter
  answer = 1 + (2..n).reduce(0) do |acc,val|
    b = 1/z.to_f
    counter -= 1
    z *= counter
    acc + b
  end 
  return (answer*(10**6)).floor / (10**6).to_f
end