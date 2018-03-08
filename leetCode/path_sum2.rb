# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} sum
# @return {Integer[][]}
def path_sum(root, sum)
    $gatherer = []
    recurse(root, sum)
    $gatherer
end

def recurse(root, sum, accumulator = [], current = 0)
    return false if !root
    current += root.val
    if !root.left && !root.right
        if sum == current
            accumulator += [root.val]
            $gatherer += [accumulator]
            return true
        else
            return false
        end
    end
    recurse(root.left, sum, accumulator + [root.val], current)
    recurse(root.right, sum, accumulator + [root.val], current)
end