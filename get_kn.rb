# find the product of a consecutive list of numbers in an array whose product divide k evenly
def get_kn(arr, k)
	total = arr.reduce(:+)
    i = 0
	j = arr.length - 1
	queue = [[i, j, total]]
	sum = nil
	while !queue.empty?
		current = queue.shift
		sum = current.last
		i = current[0]
		j = current[1]
		if sum % k == 0
			return sum
		end
		queue << [i+1, j, sum - arr[i]]
		queue << [i, j-1, sum - arr[j]]
    end
    nil
end

p get_kn([1,5,9,13,6,4,10, 11, 12, 45,90, 1000], 11)
#  returns 110 because 11*10 = 110