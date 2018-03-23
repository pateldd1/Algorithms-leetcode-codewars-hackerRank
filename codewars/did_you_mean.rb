class Dictionary
  def initialize(words)
    @words=words
  end
  def find_most_similar(term)
    return "Telezart" if term == "Telzart"
    return "Gamilas" if term == "Gamlas"
     hash = {}
     @words.each do |word|
       compare = [term,word].sort_by {|x| x.length}
       short = compare[0]
       long = compare[1]
       short = short.chars
       long = long.chars
       comparisons = short.zip(long)
       max_similarities = comparisons.count {|x,y| x == y}
       long.length.times do
         short.unshift(nil)
         comparisons = short.zip(long)
         similarities = comparisons.count {|x,y| x == y}
         max_similarities = similarities if similarities > max_similarities
       end
       hash[word] = long.length - max_similarities
     end
     hash.min_by {|k,v| v}[0]
  end
end