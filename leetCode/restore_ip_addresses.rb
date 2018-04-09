# def restore_ip_addresses(s)
#     return [s.chars.join(".")] if s.length == 4
#     return [] if s.length > 12
#     ip_ize(s.chars).uniq.map { |arr| arr.join(".")}
# end

# def ip_ize(arr, curr=[])
#     curr.reject! {|val| val == ""}
#     return [curr] if !arr && curr.length == 4 && valid_ip(curr)
#     return [] if curr.length == 4 && !valid_ip(curr)
#     return [] if !arr
#     all = []
#     all += ip_ize(arr[1..-1], curr+[arr[0]])
#     all += ip_ize(arr[2..-1], curr+[arr[0..1].join])
#     all += ip_ize(arr[3..-1], curr+[arr[0..2].join])
#     return all
# end

# def valid_ip(arr)
#     arr.all? {|val| val && val.to_i >= 0 && !val.match(/^0.+/) && val.to_i <= 255 }
# end

# OR SIMPLY

def restore_ip_addresses(str)
    return [] if str.length < 4
    $ip_arrs = []
    recurse(str.chars)
    $ip_arrs.uniq
end

def recurse(arr, current=[])
    if  current.length == 4
        $ip_arrs << current.join(".") if arr.empty?
        return
    end
    (0...3).each do |idx|
        break if !arr[idx]
        duped = arr.dup
        current_num = duped[0..idx].join.to_i
        break if current_num > 255
        if current_num == 0
            recurse(duped[idx+1..-1], current+[duped[0..idx].join])
            break
        else
            recurse(duped[idx+1..-1], current+[duped[0..idx].join])
        end
    end
end