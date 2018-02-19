class BST
    attr_accessor :root, :answer_keys
    def initialize
        @root = nil
        @answer_keys = []
    end

    def range_search(start, finish, current=@root)
        return if !current || current.val < start || current.val > finish
        range_search(start, finish, current.left)
        @answer_keys << current.val if current.val >= start && current.val <= finish
        range_search(start, finish, current.right)
    end

    def is_tree?(current=@root)
        return true if !current
        x = is_tree?(current.left)
        return false if !x
        if current.left && current.left.val >= current.val
            return false
        end
        if current.right && current.val >= current.right.val
            return false
        end
        is_tree?(current.right)
    end

    def insertion(val)
        current = @root
        @root = insert(current, val)
    end

    def size(node)
        return 0 if !node
        return node.count
    end

    def is_red(node)
        return false if !node
        return node.red
    end

    def flip_colors(n0, n1, n2)
        n1.red = false
        n2.red = false
        n0.red = true
    end

    def rotate_left(n1, n2)
        n1.right = n2.left
        n1.count = size(n1.left) + size(n2.left) + 1
        n2.left = n1
        n2.count = size(n1) + size(n2.right) + 1
        n1.red = n2.red
        n2.red = false
        return n2
    end

    def rotate_right(n1, n2)
        n1.left = n2.right
        n1.count = size(n2.right) + size(n1.right) + 1
        n2.right = n1
        n2.count = size(n1.left) + size(n1) + 1
        n1.red = n2.red
        n2.red = false
        return n2
    end

    def insert(current, val)
        if !current
            return Node.new(val)
        end
        if val < current.val
            current.left = insert(current.left, val)
        elsif val > current.val
            current.right = insert(current.right, val)
        else
            current.val = val
        end

        if is_red(current.right)
            current = rotate_left(current, current.right)
        end
        if is_red(current.left) && is_red(current.left.left)
            current = rotate_right(current, current.left)
        end
        if is_red(current.left) && is_red(current.right)
            flip_colors(current, current.left, current.right)
        end
        current.count = size(current.left) + size(current.right) + 1
        return current
    end

    def find(val)
        current = @root
        while current
            if val < current.val
                current = current.left
            elsif val > current.val
                current = current.right
            else
                return current
            end
        end
        return nil
    end

    def rank(val, current=@root)
        throw "Not found" if !current
        if val === current.val
            return 1+ size(current.left)
        elsif val < current.val
            return rank(val, current.left)
        else
            return 1 + size(current.left) + rank(val, current.right)
        end
    end

    def index(idx, current=@root)
        current_index = size(current.left)
        while current
            if idx < current_index
                current = current.left
                current_index = size(current.left)
            elsif idx > current_index
                current = current.right
                current_index = current_index + 1 + size(current.left)
            else
                return current.val
            end
        end
        return nil
    end

    def delete_min
        current = @root
        @root = min_delete(current)
    end

    def min_delete(current)
        return current.right if !current.left
        current.left = min_delete(current.left)
        return current
    end

    def delete_val(val)
        current = @root
        @root = remove(current, val)
    end

    def get_min(current)
        current = current.left until !current.left
        return current
    end

    def remove(current, val)
        return nil if !current

        if val < current.val
            current.left = remove(current.left, val)
        elsif val > current.val
            current.right = remove(current.right, val)
        elsif val == current.val
        
            if !current.left
               return current.right
            elsif !current.right
                return current.left
            else
                t = current
                min = get_min(current.right)
                min.right = min_delete(current.right)
                min.left = t.left
                return min
            end
        end
        return current
    end
end

class Node
    attr_accessor :val, :right, :left, :count, :red
    def initialize(val)
        @val = val
        @right = nil
        @left = nil
        @count = 1
        @red = true
    end
end

tree = BST.new
tree.insertion(1)
tree.insertion(2)
tree.insertion(3)
tree.insertion(4)
tree.insertion(5)
# tree.insertion(6)
# tree.insertion(7)
p tree.root
tree.delete_val(2)
p tree.is_tree?

tree.range_search(2,4)
p tree.answer_keys

wrong_tree = BST.new
wrong_tree.root = Node.new(3)
wrong_tree.root.left = Node.new(1)
wrong_tree.root.right = Node.new(4)
p wrong_tree.is_tree?
# tree.insertion(10)
# tree.insertion(15)
# tree.insertion(3)
# tree.insertion(20)
# tree.insertion(1)
# tree.insertion(-3)
# tree.insertion(2)
# tree.insertion(8)
# tree.insertion(12)
# tree.insertion(16)
# tree.insertion(23)

# p tree.rank(3)
# p tree.index(5)

p tree.root