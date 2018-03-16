class TextEditor
    attr_accessor :str, :string_states
    def initialize
        @str = ""
        @string_states = [@str.dup]
    end
    
    def perform_operation(op, arg=nil)
        case op.to_i
            when 1
            append(arg)
            when 2
            delete(arg)
            when 3
            print(arg)
            when 4
            undo
        end
    end
    
    def append(addon)
        @string_states << @str.dup
        @str += addon
    end
    
    def delete(k)
        k = k.to_i
        @string_states << @str.dup
        @str = @str[0...@str.length-k]
    end
    
    def print(k)
        k = k.to_i
        puts @str[k-1]
    end
    
    def undo
        @str = @string_states.pop
    end
end

editor = TextEditor.new
num_ops = gets.strip.to_i
num_ops.times do 
    op, arg = gets.strip.split
    editor.perform_operation(op, arg)
end