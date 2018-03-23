def pascalsTriangle(n)
  fin = 0
  arr = []
  while fin < n
    (0..fin).each do |val|
      arr << c(fin,val)
    end
    fin += 1
  end
  arr
end

def c(a,b)
  return 1 if [a,b].include?(0)
  lo = a - b + 1
  ((lo..a).reduce(:*))/(1..b).reduce(:*)
end