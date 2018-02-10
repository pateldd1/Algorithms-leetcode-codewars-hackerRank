# Make a Spiral - 3Kyu
class Board
  attr_accessor :grid
  def initialize(size)
    @grid = Array.new(size,[])
  end

  def create_grid(size)
    @grid.map! {|arr| [0]*size}
  end

  def []=(pos,val)
    row,col = pos
    @grid[row][col] = val
  end

  def [](pos)
    row,col = pos
    @grid[row][col]
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

  def occupied?(pos)
    return false if off_board?(pos)
    self[pos] == 1
  end

  def alone?(pos,pos_to_except)
    [right_from(pos),down_from(pos),left_from(pos),up_from(pos)].reject{|ps| ps == pos_to_except}.none? {|position| occupied?(position)}
  end

  def off_board?(pos)
    row,col = pos
    row >= @grid.size || row < 0 || col >= @grid[0].size || col < 0
  end

  def create_spiral(pos = [0,0])
    next_pos = right_from(pos)
   loop do
     break if occupied?(next_pos)
    if off_board?(next_pos) || !alone?(next_pos,pos)
      case next_pos
        when right_from(pos)
          next_pos = down_from(pos)
        when down_from(pos)
          next_pos = left_from(pos)
        when left_from(pos)
          next_pos = up_from(pos)
        when up_from(pos)
          next_pos = right_from(pos)
      end
      next
    else
      self[pos] = 1
      self[next_pos] = 1
      temp = next_pos
      case next_pos
        when right_from(pos)
          next_pos = right_from(next_pos)
        when down_from(pos)
          next_pos = down_from(next_pos)
        when left_from(pos)
          next_pos = left_from(next_pos)
        when up_from(pos)
          next_pos = up_from(next_pos)
      end
      pos = temp
    end
   end
  end
end


def spiralize(size)
  return [] if size == 0
  return [[1]] if size == 1
  board = Board.new(size)
  board.create_grid(size)
  board.create_spiral
  board.grid
end

# dd
