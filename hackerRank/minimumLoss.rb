def minimumLoss(prices)
    sorted = []
    min_diff = nil
    prices.each do |current_price|
        if sorted.length > 0
            insertion_index = (0...sorted.length).bsearch {|idx| current_price <= sorted[idx]} || -1
            prev_price = sorted[insertion_index]
            if (!min_diff || min_diff > prev_price - current_price) && prev_price - current_price > 0
                min_diff = prev_price - current_price
            end
            sorted.insert(insertion_index, current_price)
        else
            sorted << current_price
        end
    end
    min_diff
end

p minimumLoss([5,10,3])