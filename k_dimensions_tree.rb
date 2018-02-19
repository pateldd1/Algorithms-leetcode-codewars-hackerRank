class KDTree
    attr_accessor :root, :points_in_rectangle, :min_distance, :min_point
    def initialize
        @root = nil
        @points_in_rectangle = []
        @min_distance = nil
        @min_point = nil
    end

    def insertion(point)
        current = @root
        @root = insert(current, point)
    end

    def insert(current, point, level=0)
        x, y = point
        if !current
            return Point.new(x, y)
        end
        if level.even?
            if x < current.x
                current.left = insert(current.left, point, level+1)
            else
                current.right = insert(current.right, point, level+1)
            end
        elsif level.odd?
            if y < current.y
                current.left = insert(current.left, point, level+1)
            else
                current.right = insert(current.right, point, level+1)
            end
        end
        return current
    end

    def get_points_in(lb, rt)
        query_rectangle(lb, rt)
        answer = @points_in_rectangle
        @points_in_rectangle = []
        return answer
    end

    def query_rectangle(lb, rt, level=0, current=@root)
        return if !current
        lbx, lby = lb
        rtx, rty = rt
        if level.even?
            if rtx < current.x
                query_rectangle(lb, rt, level+1, current.left)
            elsif lbx > current.x
                query_rectangle(lb, rt, level+1, current.right)
            else
                if current.y <= rty && current.y >= lby
                    @points_in_rectangle << [current.x, current.y]
                end
                query_rectangle(lb, rt, level+1, current.left)
                query_rectangle(lb, rt, level+1, current.right)
            end
        elsif level.odd?
            if rty < current.y
                query_rectangle(lb, rt, level+1, current.left)
            elsif lby > current.y
                query_rectangle(lb, rt, level+1, current.right)
            else
                if current.x <= rtx && current.x >= lbx
                    @points_in_rectangle << [current.x, current.y]
                end
                query_rectangle(lb, rt, level+1, current.left)
                query_rectangle(lb, rt, level+1, current.right)
            end
        end
    end

    def distance(p1, p2)
        Math.sqrt((p2[1]-p1[1])**2 + (p2[0]-p1[0])**2)
    end

    def mini_x(dest, test)
        (dest[0] - test[0]).abs
    end

    def mini_y(dest, test)
        (dest[1] - test[1]).abs
    end

    def get_closest(point)
        closest(point)
        answer = @min_point
        @min_point = nil
        @min_distance = nil
        return answer
    end

    def closest(point, current=@root, level=0)
        return if !current
        x, y = point
        if !@min_distance || @min_distance > distance(point, [current.x, current.y])
            @min_distance = distance(point, [current.x, current.y])
            @min_point = [current.x, current.y]
        end
        if level.even?
            if x < current.x
                closest(point, current.left, level+1)
                closest(point, current.right, level+1) if mini_x(point, [current.x,current.y]) < @min_distance
            else
                closest(point, current.right, level+1)
                closest(point, current.left, level+1) if mini_x(point, [current.x, current.y]) < @min_distance
            end
        elsif level.odd?
            if y < current.y
                closest(point, current.left, level+1)
                closest(point, current.right, level+1) if mini_y(point, [current.x,current.y]) < @min_distance
            else
                closest(point, current.right, level+1)
                closest(point, current.left, level+1) if mini_y(point, [current.x, current.y]) < @min_distance
            end
        end
    end

end

class Point
    attr_accessor :left, :right, :x, :y
    def initialize(x,y)
        @x = x
        @y = y
        @left = nil
        @right = nil
    end
end

kdtree = KDTree.new
kdtree.insertion([1,2])
kdtree.insertion([3,4])
kdtree.insertion([-1,-2])
kdtree.insertion([5,6])
kdtree.insertion([6,7])
kdtree.insertion([7,8])
kdtree.insertion([8,9])
kdtree.insertion([9,10])

p kdtree.get_points_in([-10,-10], [10,10])
p kdtree.get_closest([1000,1000])

p kdtree.root