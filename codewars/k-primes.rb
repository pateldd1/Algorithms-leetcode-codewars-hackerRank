require 'prime'
def count_Kprimes(k, start, nd)
    final = []
    if start == 0
        start = 1
    end
    (start..nd).each do |number|
      if number_prime_factors(number) == k
        final << number
      end
    end
    return final
end


def puzzle(s)
    if s < 138
        return nil
    end
    ones = (2..s-136)
    threes = (8..s-130)
    sevens = (128..s-10)
    count = 0
    sevens.each do |number7|
    if number_prime_factors(number7) == 7
        threes.each do |number3|
            if number_prime_factors(number3) == 3
                ones.each do |number1|
                    if number1.prime?
                        if number7 + number3 + number1 == s
                            count += 1
                        end
                    end
                end
            end
        end
    end
  return count
end

def number_prime_factors(k)
    array = Prime.prime_division(k).transpose
    array.shift
    return array.flatten.reduce(:+)
end