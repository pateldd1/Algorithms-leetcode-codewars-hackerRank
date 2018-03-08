require 'prime'
num_cases = gets.strip.to_i
tests = []
num_cases.times do
    num_towers = gets.strip
    tests << gets.strip.split.map(&:to_i)
end

def get_grundy_number(num)
    return 0 if num == 1
    Prime.prime_division(num).transpose[1].reduce(:+)
end
sum = nil
tests.each do |test|
    sum = nil
    test.each do |t|
        if !sum
            sum = get_grundy_number(t)
            next
        end
        sum = sum ^ get_grundy_number(t)
    end
    if sum == 0
        puts 2
    else
        puts 1
    end
end