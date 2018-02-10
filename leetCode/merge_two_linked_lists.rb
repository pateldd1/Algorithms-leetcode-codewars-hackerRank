def merge_two_lists(l1, l2)
    current1 = l1
    current2 = l2
    ans = nil
    pointer = ans
    while current1 || current2
        if !current2
            if !ans
                ans = current1.dup
                pointer = ans
            else
                pointer.next = current1.dup
                pointer = pointer.next
            end
            current1 = current1.next
            next
        end
        if !current1
            if !ans
                ans = current2.dup
                pointer = ans
            else
                pointer.next = current2.dup
                pointer = pointer.next
            end
            current2 = current2.next
            next
        end
        if current1.val > current2.val
             if !ans
                ans = current2.dup
                pointer = ans
            else
                pointer.next = current2.dup
                pointer = pointer.next
            end
            current2 = current2.next
        else
            if !ans
                ans = current1.dup
                pointer = ans
            else
                pointer.next = current1.dup
                pointer = pointer.next
            end
            current1 = current1.next
        end
    end
    ans
end