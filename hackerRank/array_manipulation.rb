n, m = gets.strip.split(' ')
n = n.to_i
m = m.to_i
array = []
for a0 in (0..m-1)
    a, b, k = gets.strip.split(' ')
    a = a.to_i
    b = b.to_i
    k = k.to_i
    array << [a,b,k]
end
arr = Array.new(n+1, 0)
array.each do |a, b, k|
    arr[a-1] += k
    arr[b] -= k
end

total = 0
sum = 0
arr.each do |val|
    sum += val
    if sum > total
        total = sum
    end
end

puts total