def snail(array)
hash = Hash.new
  pos = [0,0]
  hash[[0,0]] = true
 answer = [array[0][0]]
 direction = "right"
  ((array.size**2)-1).times do
    thispos = dir(direction,pos)
    if offgrid?(thispos,array) || hash[thispos] == true
      direction = cycle_direction(direction)
      pos = dir(direction,pos)
     else
     pos = dir(direction,pos)
    end
    answer << current_pos(pos,array)
    hash[pos] = true
  end
  answer.compact
end

  def dir(direction,pos)
    case direction
      when "right"
        right_from(pos)
      when "down"
        down_from(pos)
      when "left"
        left_from(pos)
      when "up"
        up_from(pos)
    end
  end
    
def cycle_direction(direction)
  case direction
    when "right"
      return "down"
    when "down"
      return "left"
    when "left"
      return "up"
    when "up"
      return "right"
  end
end

def current_pos(pos,array)
  row,col = pos
  array[row][col]
end

def offgrid?(pos,array)
  row,col = pos
  row > array.size - 1|| col > array[0].size - 1|| row < 0 || col < 0
end
  
def right_from(pos)
  row,col = pos
  [row,col+1]
end

def left_from(pos)
  row,col = pos
  [row,col-1]
end

def down_from(pos)
  row,col = pos
  [row+1,col]
end

def up_from(pos)
  row,col = pos
  [row-1,col]
end
