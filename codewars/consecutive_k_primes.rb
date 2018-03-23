require 'prime'
def consec_kprimes(k, arr)
    count = 0
    arr.each_index do |inx|
    p number_prime_factors(arr[inx])
        if inx < arr.length - 1
            if number_prime_factors(arr[inx + 1]) == k && number_prime_factors(arr[inx]) == k
                count += 1
            end
        end
    end
    count
end




def number_prime_factors(n)
    array = Prime.prime_division(n).transpose
    array.shift
    return array.flatten.reduce(:+)
end