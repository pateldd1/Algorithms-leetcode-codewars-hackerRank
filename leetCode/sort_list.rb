# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @return {ListNode}
def sort_list(head, finish=nil)
    # return nil if !head
    new_tail = head
    new_head = partition(head, finish)
    new_head = sort_list(new_head, new_tail) unless new_head == new_tail || !new_tail
    new_head.next = sort_list(new_tail.next, finish) unless new_tail.next == finish || !finish
    new_head
end

def partition(list, finish=nil)
    head = list
    current = list
    partitioner = current.val
    new_finish = nil
    while current && current.next && current.next != finish
        if current.next.val < partitioner
            new_head = current.next
            current.next = current.next.next
            new_head.next = head
            # current = head
            head = new_head
        elsif current && current.next && !current.next.next && current.next.val < partitioner && current.next != finish
            new_head = current.next
            new_head.next = head
            head = new_head
            break
        else
            current = current.next
        end
    end
    head
end

[4,19,14,5,-3,1,8,5,11,15]
node1 = ListNode.new(3)
node2 = ListNode.new(2)
node3 = ListNode.new(4)
# node4 = ListNode.new(5)
# node5 = ListNode.new(-3)
# node6 = ListNode.new(1)
# node7 = ListNode.new(8)
# node8 = ListNode.new(5)
# node9 = ListNode.new(11)
# node10 = ListNode.new(15)
node1.next = node2
node2.next = node3
# node3.next = node4
# node4.next = node5
# node5.next = node6
# node6.next = node7
# node7.next = node8
# node8.next = node9
# node9.next = node10
# node5.next = node4
# node2.next = node3

p sort_list(node1)