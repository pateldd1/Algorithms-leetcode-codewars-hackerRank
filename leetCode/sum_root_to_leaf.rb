def sum_numbers(root)
    return 0 if !root
    return root.val if is_leaf?(root)
    $total = 0
    traverse(root)
    $total
end

def traverse(current, curr_str="")
    if is_leaf?(current)
        $total += "#{curr_str}#{current.val}".to_i
        return
    end
    curr_str += "#{current.val}"
    traverse(current.left, curr_str) if current.left
    traverse(current.right, curr_str) if current.right
end

def is_leaf?(node)
    return !node.left && !node.right
end