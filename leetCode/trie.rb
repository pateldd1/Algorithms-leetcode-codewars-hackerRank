class Node
    attr_accessor :children, :end_of_word
    def initialize
        @children = {}
        @end_of_word = false
    end
end

class Trie
    attr_accessor :root
=begin
    Initialize your data structure here.
=end
    def initialize()
        @root = nil
    end


=begin
    Inserts a word into the trie.
    :type word: String
    :rtype: Void
=end
    def insert(word)
        current = @root
        word.chars.each_with_index do |letter, idx|
            current = insertion(current, letter)
            if idx == word.length-1
                current.end_of_word = true
            end
        end
    end
    
    def insertion(current, letter)
        if !current
            @root = Node.new
            @root.children[letter] = Node.new
            return @root.children[letter]
        end
        
        if current.children[letter]
            return current.children[letter]
        else
            current.children[letter] = Node.new
            return current.children[letter]
        end
    end


=begin
    Returns if the word is in the trie.
    :type word: String
    :rtype: Boolean
=end
    def search(word)
        current = @root
        return false if !current
        word.each_char do |letter|
            current = current.children[letter]
            return false if !current
        end
        return false if !current.end_of_word
        return true
    end


=begin
    Returns if there is any word in the trie that starts with the given prefix.
    :type prefix: String
    :rtype: Boolean
=end
    def starts_with(prefix)
        current = @root
        return false if !current
        prefix.each_char do |letter|
            current = current.children[letter]
            return false if !current
        end
        true
    end


end

trie = Trie.new
trie.insert("ab")
p trie.root