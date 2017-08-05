# Helpers For a 3DGame I: Biggest Triangle in a Sphere - 4Kyu - few ruby solutions pass time constraints

DISTANCES = {}

def biggest_triang_int(points_list, center, radius)
  points_list.reject! {|point| out_of_sphere?(point,center,radius)}
  return [] if points_list.size < 3 || points_list.empty?
  points_list[0..-2].each do |p1|
    points_list[1..-1].each do |p2|
      DISTANCES[[p1,p2]] = distance(p1,p2)
    end
  end
  num_triangles = 0
  max_triangle = nil
  max_tr_area = nil
  (0..points_list.length-3).each do |inx1|
    (inx1+1..points_list.length-2).each do |inx2|
      (inx2+1..points_list.length-1).each do |inx3|
        p1,p2,p3 = points_list[inx1],points_list[inx2],points_list[inx3]
        tr_area = triangle_area(DISTANCES[[p1,p2]],DISTANCES[[p2,p3]],DISTANCES[[p1,p3]])
        if !max_triangle
          max_tr_area = tr_area
          max_triangle = [[p1,p2,p3]]
        elsif tr_area > max_tr_area
          max_tr_area = tr_area
          max_triangle = [[p1,p2,p3]]
        elsif tr_area == max_tr_area
          max_triangle += [[p1,p2,p3]]
        end
        num_triangles += 1 unless tr_area < 0.00000001
      end
    end
  end
return [num_triangles,max_tr_area,max_triangle.sort] if max_triangle.size > 1
return [num_triangles,max_tr_area,max_triangle.flatten(1)]
end

def out_of_sphere?(point,center,radius)
  distance(point,center) >= radius
end

def distance(point1,point2)
x1,y1,z1 = point1
x2,y2,z2 = point2
Math.sqrt((x2-x1)**2 + (y2-y1)**2 + (z2-z1)**2).to_f
end

def triangle_area(d1,d2,d3)
  s = (d1+d2+d3)/2.to_f
  Math.sqrt(s*(s-d1)*(s-d2)*(s-d3)).round(13)
end
