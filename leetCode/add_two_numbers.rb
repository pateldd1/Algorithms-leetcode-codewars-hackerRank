def add_two_numbers(l1, l2)
    counter = 0
    sum1 = 0
    sum2 = 0
    current = l1
    while current
        sum1 += current.val * 10**counter
        current = current.next
        counter += 1
    end
    current = l2
    counter = 0
    while current
        sum2 += current.val * 10**counter
        current = current.next
        counter += 1
    end
    total = sum1 + sum2
    new_list = ListNode.new(0)
    current = new_list
    loop do
        current.val = total % 10
        total /= 10
        if total == 0
            break
        end
        new_link = ListNode.new(0)
        current.next = new_link
        current = current.next
    end
    new_list
end