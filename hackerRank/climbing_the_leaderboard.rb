def binary_search(arr, val, ranks)
    lo = 0
    hi = arr.length - 1
    while lo < hi
        mid = (lo + hi)/2
        case val <=> arr[mid]
            when -1
            lo = mid + 1
            when 1
            hi = mid - 1
            when 0
            return ranks[mid]
        end
    end
     # p arr[lo], val, "hiii"
    if val > arr[lo]
        if lo - 1 < 0
            return ranks[0]
        else
            return ranks[lo]
        end
    elsif val < arr[lo]
        if lo + 1 >= arr.length
            return ranks[-1] + 1
        else
            return ranks[lo+1]
        end
    else
        return ranks[lo]
    end
end

def climbingLeaderboard(scores, alice)
    ranks = [1]
    current_rank = 1
    current_score = scores[0]
    (1...scores.length).each do |score_idx|
        score = scores[score_idx]
        if score == current_score
            ranks << current_rank
        else
            current_rank += 1
            current_score = score
            ranks << current_rank
        end
    end
    result = []
    alice.each do |alice_score|
        result << binary_search(scores, alice_score, ranks)
    end
    result
end

n = gets.strip.to_i
scores = gets.strip
scores = scores.split(' ').map(&:to_i)
m = gets.strip.to_i
alice = gets.strip
alice = alice.split(' ').map(&:to_i)
result = climbingLeaderboard(scores, alice)
print result.join("\n")