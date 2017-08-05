# Can you get the loop - 3Kyu

def loop_size(node)
  array = []
  loop do
    start_of_circle = array.index(node)
    if start_of_circle
      return array.size - start_of_circle
    end
    array << node
    node = node.next
  end
end
