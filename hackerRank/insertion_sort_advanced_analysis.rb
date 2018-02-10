def insertionSort(arr)
    $inversions = 0
    mergeSort(arr)
    return $inversions
end

def mergeSort(arr)
    return arr if arr.length <= 1
    hi = arr.length
    lo = 0
    mid = (lo + hi)/2
    arr1 = mergeSort(arr[0...mid])
    arr2 = mergeSort(arr[mid..hi])
    merge(arr1, arr2)
end

def merge(arr1, arr2)
    merged = []
    while arr1[0] || arr2[0]
        if !arr1[0]
            merged.concat(arr2)
            arr2 = []
        elsif !arr2[0]
            merged.concat(arr1)
            arr1 = []
        else
            if arr1[0] <= arr2[0]
                merged.push(arr1.shift)
            else
                $inversions += arr1.length
                merged.push(arr2.shift)
            end
        end
    end
    merged
end