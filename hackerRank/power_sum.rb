def powerSum(x, n)
    $count = 0
    recurse(x, n)
    puts $count
end

def recurse(x, n, last_num=nil)
    # p current
    return if x < 0
    if x <= 1
        $count += 1
        return
    end
    power_floor = (x**(1/n.to_f)).to_i
    power_floor = [last_num-1, power_floor].min if last_num
    (power_floor).downto(2) do |num|
        recurse(x-num**n, n, num)
    end
end

powerSum(10, 2)