def recover_secret triplets
    string = triplets
    scrambled= triplets.join.chars.uniq
    3.times do
        string.each_with_index do |triple,inx1|
        triple.each_with_index do |letter,inx2|
            if inx2 < triple.length - 1
                if scrambled.index(triple[inx2 + 1]) < scrambled.index(triple[inx2])
                scrambled[scrambled.index(triple[inx2])],scrambled[scrambled.index(triple[inx2+1])] = 
                scrambled[scrambled.index(triple[inx2+1])],scrambled[scrambled.index(triple[inx2])]
                end
            end
        end
        end
    end
    scrambled.join
end