class Board
    attr_accessor :grid, :traversed, :groups, :group_index
    def initialize(max_row, max_col)
        @grid = Array.new(max_row+1) {Array.new(max_col+1)}
        @traversed = {}
        @groups = []
        @group_index = 0
    end

    def insert(city1, city2)
        @grid[city1][city2] = 1
    end

    def insert_cities(cities)
        cities.each do |city1, city2|
            insert(city1, city2)
        end
    end

    def children(pos)
        row, col = pos
        childs = []
        @grid[row].each_with_index do |col_val, col_idx|
            if col_val == 1 && !@traversed[[row, col_idx]]
                childs << [row, col_idx]
                @traversed[[row, col_idx]] = true
            end
        end
        @grid[col].each_with_index do |col_val, col_idx|
            if col_val == 1 && !@traversed[[col, col_idx]]
                childs << [col, col_idx]
                @traversed[[col, col_idx]] = true
            end
        end
        x = 0
        while x < @grid.length
            if @grid[x][col] == 1 && !@traversed[[x, col]]
                childs << [x, col]
                @traversed[[x, col]] = true
            end
            x += 1
        end
        x = 0
        while x < @grid.length
            if @grid[x][row] == 1 && !@traversed[[x, row]]
                childs << [x, row]
                @traversed[[x, row]] = true
            end
            x += 1
        end
        childs.each do |x1, x2|
           @groups[@group_index][x1] = true
           @groups[@group_index][x2] = true
        end
        childs
    end

    def recurse(pos)
        children(pos).each do |child|
            recurse(child)
        end
    end

    def iterate_through
        @grid.each_with_index do |row, row_idx|
            row.each_with_index do |col, col_idx|
                if !@traversed[[row_idx, col_idx]] && @grid[row_idx][col_idx] == 1
                    @groups[@group_index] = {row_idx => true, col_idx => true}
                    @traversed[[row_idx, col_idx]] = true
                    recurse([row_idx, col_idx])
                    @groups[@group_index] = @groups[@group_index].length
                    @group_index += 1 
                end
            end
        end
    end
end

def roadsAndLibraries(n, c_lib, c_road, cities)
    return 0 if !n || !c_lib || !c_road || !cities || n == 0
    return n*c_lib if cities.empty? || c_lib <= c_road
    max_row = cities.max_by {|x| x[0]}[0]
    max_col = cities.max_by {|x| x[1]}[1]
    board = Board.new(max_row, max_col)
    board.insert_cities(cities)
    board.iterate_through
    group_lengths = board.groups

    if  c_lib <= c_road
        total = 0
        group_lengths.each do |length|
            next if length == 0
            total += length*c_lib
        end
        
    else
        total = 0
        group_lengths.each do |length|
            next if length == 0
            total += (length-1)*c_road + c_lib
        end
        
    end
    remainder = n - group_lengths.reduce(:+)
    total += remainder*c_lib
    total
end

q = gets.strip.to_i
for a0 in (0..q-1)
    n, m, c_lib, c_road = gets.strip.split(' ')
    n = n.to_i
    m = m.to_i
    c_lib = c_lib.to_i
    c_road = c_road.to_i
    cities = Array.new(m)
    for cities_i in (0..m-1)
        cities_t = gets.strip
        cities[cities_i] = cities_t.split(' ').map(&:to_i)
    end
    result = roadsAndLibraries(n, c_lib, c_road, cities)
    puts result
end