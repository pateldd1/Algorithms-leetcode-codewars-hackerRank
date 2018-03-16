def atoi(str)
    bytes = str.bytes
    bytes.map! { |byte| byte - 48 }
    power = 0
    ans = 0
    bytes.reverse.each do |byte|
        ans += byte*10**power
        power += 1
    end
    ans
end

p atoi("328324")