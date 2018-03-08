def largest_number(nums)
    if nums.all? {|n| n == 0}
        return "0"
    end
    x = nums.map(&:to_s).sort
    y = x.slice_when {|a,b| a[0] != b[0]}.to_a
    y.each do |subarr|
        subarr.sort! {|a,b| b+a <=> a+b}
    end
    y.reverse.flatten.join
end