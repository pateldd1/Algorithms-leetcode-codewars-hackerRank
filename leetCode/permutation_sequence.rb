def get_permutation(n, k)
    return "1" if [n,k] == [1,1]
    k -= 1
    nums = (1..n).to_a
    answer = []
    while nums.length > 0
        nums_left = nums.dup
        mult = factorial(nums_left.length)
        spots = mult / nums_left.length
        z = k/spots
        k -= z*spots
        answer.push(nums[z])
        nums.delete(nums[z])
    end
    answer.join
end    
    
def factorial(n)
    (1..n).reduce(:*)
end