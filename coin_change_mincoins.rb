def minCoins(n, c)
    number_of_coins = [0]
    denominations = [0]
    c.sort!.reverse!
    max = n
    i = 1
    while i <= max
        min_count = nil
        denom = nil
        c.each do |coin|
            if coin > i
                next
            end
            prev_amount = number_of_coins[i-coin]
            if !min_count || prev_amount < min_count
                denom = coin
                min_count = prev_amount
            end
        end
        i += 1
        if !denom || !min_count
            denominations << nil
            number_of_coins << 0
            next
        end
        denominations << denom
        number_of_coins << min_count + 1
    end
    p denominations
    p number_of_coins
    number_of_coins[-1]
end

p minCoins(17, [1,2,3])