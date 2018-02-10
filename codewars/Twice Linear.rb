Twice Linear - 4Kyu

def dbl_linear(n)
a = [1]
z = -2
answer = [1]
while 2**z <= n
a = a.flat_map {|x| [2*x+1,3*x + 1]}
answer << a
z += 1
end
answer.flatten.uniq.sort[n]
end
