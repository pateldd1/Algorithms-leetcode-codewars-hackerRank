def search_range(nums, target)
    lo = 0
    hi = nums.length - 1
    lowest = nil
    highest = nil
    while lo <= hi
        mid = (lo + hi)/ 2
        if nums[mid] < target
            lo = mid + 1
        elsif nums[mid] > target
            hi = mid - 1
        elsif nums[mid] == target
            if nums[lo] == target && nums[hi] == target
                return [lo, hi]
            end
            a = lo
            b = mid - 1
            lowest = search_left(nums, a, b, target)
            c = mid + 1
            d = hi
            highest = search_right(nums, c, d, target)
            lowest ||= mid
            highest ||= mid
            break
        end
    end
    if lowest && highest
        [lowest, highest]
    else
        [-1, -1]
    end
end

def search_left(nums, lo, hi, target)
    if nums[lo] == target
        return lo
    end
    ans = nil
    while lo <= hi
        mid = (lo + hi)/2
        if nums[mid] != target
            lo = mid + 1
        else
            ans = mid
            hi = mid - 1
        end
    end
    return ans
end

def search_right(nums, lo, hi, target)
    if nums[hi] == target
        return hi
    end
    ans = nil
    while lo <= hi
        mid = (lo + hi)/2
        if nums[mid] != target
            hi = mid - 1
        else
            ans = mid
            lo = mid + 1
        end
    end
    return ans
end
