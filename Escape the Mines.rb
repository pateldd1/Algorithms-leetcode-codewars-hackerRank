Escape the Mines - 3Kyu
class Maze
  attr_accessor :grid, :directions, :counter, :start, :finish
  def initialize(minemap,start,finish)
    @grid = minemap
    @directions = []
    @counter = 0
    @start = start
    @finish = finish
  end

  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []=(pos,token)
    row,col = pos
    @grid[row][col] = token
  end

  def up_from(pos)
    row,col = pos
    [row - 1, col]
  end

  def right_from(pos)
    row,col = pos
    [row, col + 1]
  end

  def left_from(pos)
    row, col = pos
    [row, col - 1]
  end

  def down_from(pos)
    row, col = pos
    [row + 1, col]
  end

  def all_around(pos)
    [up_from(pos),left_from(pos),right_from(pos),down_from(pos)].reject{|position| offgrid?(position)}
  end

  def offgrid?(pos)
    row,col= pos
    row >= @grid.size || row < 0 || col < 0 || col >= @grid[0].size
  end

  def number_all_positions(start)
    from_positions = [start.dup]
    self[@finish] = 0
    temp_array = []
    open_positions = []
    came_from = {}
    until self[@start].is_a?(Fixnum)
      @counter += 1
      from_positions.each do |pos|
        came_from[pos] = true
        open_positions = all_around(pos).select {|around_position| !offgrid?(around_position) && self[around_position] == true && !came_from[around_position]}
        temp_array += open_positions
        if !open_positions.empty?
          open_positions.each do |position|
            self[position]= @counter
          end
        end
      end
      from_positions = temp_array.dup
      temp_array = []
    end
  end

  def navigate_back_one(pos,number)
    positions_around = self.all_around(pos)
    to = positions_around.find {|place| self[place] == number}
    case to
      when up_from(pos)
        @directions << "up"
      when down_from(pos)
        @directions << "down"
      when left_from(pos)
        @directions << "left"
      when right_from(pos)
        @directions << "right"
    end
    return to
  end

  def navigate(finish)
    pos = finish
    @counter -= 1
    until @counter == -1
      pos = navigate_back_one(pos,@counter)
      @counter -= 1
    end
  end

  def create_maze_solution
    self.number_all_positions(self.finish)
    self.navigate(self.start)
    @directions
  end
end

def solve(minemap, miner, finish)
  Maze.new(minemap.transpose,miner.values.reverse,finish.values.reverse).create_maze_solution
end
# d
