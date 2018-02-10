def is_valid(s)
    stack = []
    openers = {"(" => true, "[" => true, "{" => true}
    closers = {")" => "(", "]" => "[", "}" => "{"}
    s.chars.each do |char|
        if openers[char]
            stack.push(char)
        elsif closers[char]
            if stack.last == closers[char]
                stack.pop
            else
                return false
            end
        end
    end
    stack.empty?
end