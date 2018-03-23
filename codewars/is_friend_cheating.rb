def removNb(n)
sum = (n*(1 + n)) / 2
a = nil
answer = []
(n-1).downto(((7*n)/10)).each do |b|
  a = (sum - b).to_f/(b+1).to_f
  if a == a.to_i
    a = a.to_i
    answer << [a,b] << [b,a]
  end
end
answer.sort_by {|x| x[0]}
end