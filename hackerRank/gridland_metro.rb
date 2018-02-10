arr1 = gets.strip.split(' ').map(&:to_i)
rows = arr1[0]
cols = arr1[1]
total = rows*cols
rail_squares = 0
data = []
arr1[2].times do
    x = gets.strip.split(' ').map(&:to_i)
    data << x
end

data = data.sort_by {|n| n[1]}.sort_by{|m| m[0]}
current = 0
total_blocks = 0
extension = nil
loop do
    break if !data[current]
    current_row = data[current][0]
    compare = current_row
    loop do
        if !data[current] || data[current][0] != compare
            start, finish = extension
            total_blocks += (finish - start + 1)
            extension = nil
            break
        end
        start = data[current][1]
        finish = data[current][2]
        if !extension
            extension = [start, finish]
            current += 1
            next
        end
        curr_start, curr_finish = extension
        if start <= curr_finish
            finish = [curr_finish, finish].max
            extension = [curr_start, finish]
        else
            total_blocks += (curr_finish - curr_start + 1)
            extension = nil
            next
        end
        current += 1
    end
end