g = gets.strip.to_i
for a0 in (0..g-1)
    n,m,x = gets.strip.split(' ')
    n = n.to_i
    m = m.to_i
    x = x.to_i
    a = gets.strip
    a = a.split(' ').map(&:to_i)
    b = gets.strip
    b = b.split(' ').map(&:to_i)
    score = 0
    total_sum = a.reduce(:+)
    score = a.length if total_sum <= x
    i = 0
    j = a.length - 1
    while i < b.length && j >= 0
        current = b[i]
        while total_sum + current > x && j >= 0
            total_sum -= a[j]
            j -= 1
        end   
        if total_sum + current <= x
            total_sum += current
            score = j+i+2 if !score || j+i+2 > score
        end
        i += 1
    end
    if score == 0
        if a[0] <= x || b[0] <= x
            score = 1
        end
    end
    puts score
end