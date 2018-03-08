class Solution(object):
    def detectCycle(self, head):
        if not head:
            return None
        slow = head
        fast = head
        circle = False
        while fast.next and fast.next.next:
            slow = slow.next
            fast = fast.next.next
            if slow == fast:
                circle = True
                break
        if circle is False:
            return None
        slow = head
        while slow is not fast:
            slow = slow.next
            fast = fast.next
        return slow
        