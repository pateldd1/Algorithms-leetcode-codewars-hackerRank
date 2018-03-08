def kth_smallest(root, k)
    $index = 0
    recurse(root, k)
end

def recurse(root, k)
    return false if !root
    n = recurse(root.left, k)
    return n if n
    $index += 1
    return root.val if $index == k
    recurse(root.right, k)
end