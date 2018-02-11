def sort_colors(arr, lo=0, hi=arr.length-1)
    if hi <= lo
        return arr
    end
    lt = lo
    rt = hi
    idx = lo + 1
    partitioner = arr[lo]
    while idx <= rt
        case partitioner <=> arr[idx]
            when -1
                arr[rt], arr[idx] = arr[idx], arr[rt]
                rt -= 1
            when 1
                arr[lt], arr[idx] = arr[idx], arr[lt]
                lt += 1
                idx += 1
            when 0
                idx += 1
        end
    end
    sort_colors(arr, lo, lt-1)
    sort_colors(arr, rt+1, hi)
end