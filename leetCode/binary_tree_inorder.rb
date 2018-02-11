def inorder_traversal(root)
    $array = []
    go_inorder(root)
    $array
end

def go_inorder(current)
    return if !current
    go_inorder(current.left)
    $array.push(current.val)
    go_inorder(current.right)
end