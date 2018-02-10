def convert(s, num_rows)
    return s if num_rows == 1 || num_rows >= s.length
    max = (num_rows*2) - 2
    min = 0
    string = ""
    my_string = s.chars
    start = 0
    array = [max, min]
    total_arr = []
    loop do
        total_arr.push(max, min)
        break if max == 0
        max -= 2
        min += 2
    end
    current = [0, 1]
    start = 0
    pos = start
    while string.length != s.length
        interval = current[1]
        pos = start
        while pos < my_string.length
            interval = interval == current[0] ? current[1] : current[0]
            string += my_string[pos] if total_arr[interval] != 0
            pos += total_arr[interval]
        end
        current = [current[0] + 2, current[1] + 2]
        start += 1
    end
    string
end