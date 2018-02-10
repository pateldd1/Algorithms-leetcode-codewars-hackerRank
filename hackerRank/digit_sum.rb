def digitSum(n, k)
    val = fn(n.to_i)
    fn(val*k)
end

def fn(start)
    until start < 10
        start = start.to_s.chars.map(&:to_i).reduce(:+)
    end
    start
end