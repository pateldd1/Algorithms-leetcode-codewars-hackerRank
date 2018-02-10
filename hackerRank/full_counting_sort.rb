hash = Hash.new() {|h,k| h[k] = []}

n = gets.strip.to_i

for a0 in (0..n-1)
    x, s = gets.strip.split(' ')
    x = x.to_i
    if  a0 >= (n/2)
        hash[x].push(s)
    else
        hash[x].push('-')
    end
end

max = hash.max[0]
min = hash.min[0]
answer = []
(min..max).each do |num|
    answer.concat(hash[num])
end

puts answer.join(" ")