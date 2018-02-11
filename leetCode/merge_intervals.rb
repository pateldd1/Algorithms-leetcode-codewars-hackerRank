def merge(intervals)
    sorted_intervals = intervals.sort_by {|i| i.start }
    compare_interval = nil
    idx = 0
    ans = []
    while idx < sorted_intervals.length
        compare_interval = sorted_intervals[idx] if !compare_interval
        next_interval = sorted_intervals[idx+1]
        if  !next_interval
            ans.push(compare_interval)
            break
        end
        overlap = !no_overlap(compare_interval, next_interval)
        if  overlap
            compare_interval = Interval.new(compare_interval.start, [compare_interval.end, next_interval.end].max)
        else
            ans.push(compare_interval)
            compare_interval = nil
        end
        idx += 1
    end
    ans
end

def no_overlap(i1, i2)
    return i1.end < i2.start
end