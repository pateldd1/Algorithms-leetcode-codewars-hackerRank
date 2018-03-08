# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)
    head = recurse(head)
end

def recurse(current)
    return nil if !current
    bool = false
    while current.next && current.val == current.next.val
        bool = true
        current = current.next
    end
    current.next = recurse(current.next)
    current = current.next if bool
    return current
end