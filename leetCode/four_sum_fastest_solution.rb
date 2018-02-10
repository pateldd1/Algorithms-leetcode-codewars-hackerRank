def four_sum(nums, target)
    hash = Hash.new(){|h,k| h[k] = []}
    combos = (0...nums.length).to_a.combination(2).to_a
    combos.each do |a,b|
        hash[nums[a]+nums[b]].push([a,b])
    end
    ans = []
    hash.keys.each do |key|
        if hash[target-key].length > 0
            addon = hash[key].product(hash[target-key])
            addon.map!(&:flatten).map!(&:uniq).reject! {|subarr| subarr.length < 4}
            ans += addon
        end
    end
    ans.map do |a,b,c,d|
        [nums[a],nums[b],nums[c],nums[d]].sort
    end.uniq
end