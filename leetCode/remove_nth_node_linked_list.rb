$length = nil
def remove_nth_from_end(head, n, pos = 0)
    current = head
    head = recurse(current, n, pos)
end
    
def recurse(current, n, pos = 0)
    if !current
        $length = pos
        return nil
    end
    current.next = recurse(current.next, n, pos + 1)
    return current.next if pos == $length - n
    return current
end