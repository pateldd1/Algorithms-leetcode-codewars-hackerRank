class DoublyLinkedList
    attr_accessor :head, :tail, :hash, :group_count
    def initialize
        @head = nil
        @tail = nil
        @hash = {}
        @group_count = 0
    end

    def makeList(arr)
        references = []
        arr.each do |val|
            new_node = Node.new(val)
            if rand(0..1) == 1
                references << new_node.val
            end
            add_node(new_node)
        end
        return references
    end

    def add_node(node)
        if !@tail && !@head
            @tail = node
            @head = node
            return
        end
        @tail.next = node
        node.prev = @tail
        @tail = node
    end

    def create_hash(nodes)
        nodes.each do |node|
            @hash[node] = true
        end
    end

    def find_around(node)
        current = node
        while node && @hash[node]
            @hash.delete(node)
            node = node.next
        end
        while current && @hash[current]
            @hash.delete(current)
            node = node.prev
        end
        @group_count += 1
    end
end

class Node
    attr_accessor :prev, :next, :val
    def initialize(val)
        @prev = nil
        @next = nil
        @val = val
    end

end

dl = DoublyLinkedList.new

references = dl.makeList((1..20).to_a)

p references
dl.create_hash(references)

ref = nil
while !dl.hash.empty?
    ref = dl.hash.first[0]
    dl.find_around(ref)
end

p dl.group_count