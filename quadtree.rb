class Quadtree
    attr_accessor :root
    def initialize(root)
        @root = root
    end

    def insertion(point)
        current = @root
        @root = insert(current, point)
    end

    def insert(current, point, last=nil)
        if !current
            return Quadrant.create_new_quadrant(last, point)
        end
        
        case current.which_quadrant(point)
            when 'ne'
                current.neq = insert(current.neq, point, current)
            when 'se'
                current.seq = insert(current.seq, point, current)
            when 'sw'
                current.swq = insert(current.swq, point, current)
            when 'nw'
                current.nwq = insert(current.nwq, point, current)
        end
        return current
    end

    def find(point)
        current = @root
        search(current, point)
    end

    def search(current, point)
        loop do
            case current.which_quadrant(point)
                when 'ne'
                    current = current.neq
                when 'se'
                    current = current.seq
                when 'sw'
                    current = current.swq
                when 'nw'
                    current = current.nwq
            end
            return false if !current
            return true if current.contained_point == point
        end
    end
end

class Quadrant
    attr_accessor :center, :nw, :ne, :sw, :se, :neq, :seq, :nwq, :swq, :contained_point
    def initialize(center, ne, se, sw, nw, contained_point)
        @center = center
        @nw = nw
        @ne = ne
        @sw = sw
        @se = se
        @neq = nil
        @seq = nil
        @nwq = nil
        @swq = nil
        @contained_point = contained_point
    end

    def self.create_new_quadrant(quadrant, newpoint)
        newpoint_x, newpoint_y = newpoint
        center_x, center_y = quadrant.center
        if newpoint_x <= center_x && newpoint_y <= center_y
            southwest = quadrant.sw
            northeast = quadrant.center
            southwest_x, southwest_y = southwest
            northeast_x, northeast_y = northeast
            southeast = [northeast_x, northeast_y]
            northwest = [southwest_x, northeast_y]
            return Quadrant.new(quadrant.getcenter(southwest, northeast), northeast, southeast, southwest, northwest, newpoint)
        elsif newpoint_x <= center_x && newpoint_y >= center_y
            northwest = quadrant.nw
            southeast = quadrant.center
            northwest_x, northwest_y = northwest
            southeast_x, southeast_y = southeast
            southwest = [northwest_x, southeast_y]
            northeast = [southeast_x, northwest_y]
            return Quadrant.new(quadrant.getcenter(northwest, southeast), northeast, southeast, southwest, northwest, newpoint)
        elsif newpoint_x >= center_x && newpoint_y >= center_y
            northeast = quadrant.ne
            southwest = quadrant.center
            northeast_x, northeast_y = northeast
            southwest_x, southwest_y = southwest
            northwest = [southwest_x, northeast_y]
            southeast = [northeast_x, southwest_y]
            return Quadrant.new(quadrant.getcenter(northeast, southwest), northeast, southeast, southwest, northwest, newpoint)
        elsif newpoint_x >= center_x && newpoint_y <= center_y
            southeast = quadrant.se
            northwest = quadrant.center
            northwest_x, northwest_y = northwest
            southeast_x, southeast_y = southeast
            northeast = [southeast_x, northwest_y]
            southwest = [northwest_x, southeast_y]
            return Quadrant.new(quadrant.getcenter(southeast, northwest), northeast, southeast, southwest, northwest, newpoint)
        end
    end

    def getcenter(point1, point2)
        x1, y1 = point1
        x2, y2 = point2
        return [(x1+x2)/2.to_f, (y1+y2)/2.to_f]
    end

    def which_quadrant(point)
        point_x, point_y = point
        center_x, center_y = @center
        if point_x <= center_x && point_y <= center_y
            return 'sw'
        elsif point_x <= center_x && point_y >= center_y
            return 'nw'
        elsif point_x >= center_x && point_y >= center_y
            return 'ne'
        elsif point_x >= center_x && point_y <= center_y
            return 'se'
        end
    end
end

root = Quadrant.new([50,10], [100, 20], [100, 0], [0, 20], [0,0], [50, 10])
quadtree = Quadtree.new(root)

quadtree.insertion([1,5])
quadtree.insertion([1,6])
quadtree.insertion([1,7])
quadtree.insertion([1,8])
quadtree.insertion([60,30])
quadtree.insertion([60,40])
quadtree.insertion([60,60])
quadtree.insertion([80,2])
quadtree.insertion([80,30])
p quadtree.root
p quadtree.find([1,6])
p quadtree.find([60,40])
p quadtree.find([60,2])
p quadtree.find([80,2])
p quadtree.find([1,6])