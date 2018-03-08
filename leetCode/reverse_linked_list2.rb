def reverse_between(head, m, n)
    return nil if !head
    if m == n
        return head
    end
    current = head
    counter = 1
    start = nil
    tail = nil
    if m == 1
        start = current
        tail = recurse(start, counter, m, n)
        tail.next = $tail
        head = $new_start
    else
        while current
            if counter == m - 1
                start = current.next
                tail = recurse(start, counter+1, m, n)
                tail.next = $tail
                current.next = $new_start
                break
            end
            current = current.next
            counter += 1
        end
    end
    head
end

def recurse(current, counter, m, n)
    if counter == n
        $new_start = current
        $tail = current.next
        return
    end
    next_node = current.next
    recurse(next_node, counter+1, m, n)
    current.next = nil
    next_node.next = current
    return current
end