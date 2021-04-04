using GeometryBasics
using Rotations
using LinearAlgebra
using StaticArrays
using Colors
abstract type AbstractCamera end

struct PerspectiveCamera <: AbstractCamera
    location::Point3{Float64}
    attitude::RotMatrix3{Float64}
    width::Float64
    height::Float64
end

struct Ray
    origin::Point3{Float64}
    direction::Point3{Float64}
end

function rays(camera::PerspectiveCamera; pixel=(500, 500))
    width = camera.width
    height = camera.height
    pixel_x, pixel_y = pixel
    xs_start = -width/2 + width/2pixel_x
    xs_end = -xs_start
    ys_start = -height/2 + height/2pixel_y
    ys_end = -ys_start
    xs = range(xs_start, stop=xs_end, length=pixel_x)
    ys = range(ys_end, stop=ys_start, length=pixel_y)
    
    R = camera.attitude
    v = camera.location
    directions = [R*Point(x,y,-1) for y in ys, x in xs]
    return [Ray(v, R*Point(x,y,-1)) for y in ys, x in xs]
end

"""
default PerspectiveCamera
location: (0,0,1)
look_at:  (0,0,0)
"""
function PerspectiveCamera()
    location = Point(0,0,1)
    attitude = @SArray [1 0 0;0 1 0;0 0 1]
    width = 2
    height = 2
    PerspectiveCamera(location, attitude, width, height)
end

"""
generate PerspectiveCamera with look_at and location
location: (0,0,1)
look_at:  (0,0,0)
"""
function PerspectiveCamera(look_at::Point3, location::Point3, width::Real, height::Real)
    direction = normalize(location - look_at)
    lng = atan(direction[2],direction[1])
    r_xy = norm(direction[[1,2]])
    lat = atan(direction[3],r_xy)
    
    attitude = RotZ(lng+π/2)*RotX(π/2-lat)
    return PerspectiveCamera(location, attitude, width, height)
end

camera = PerspectiveCamera()

look_at = zeros(Point3)
location = Point3(2,3,1)


rays_ = rays(camera)

function blue_back(ray::Ray)
    z = normalize(ray.direction)[3]
    return RGB((z+1)/2,(z+1)/2,1)
end


[blue_back(ray) for ray in rays_]


normalize(rays_[1].direction)[3]

s = Sphere(Point(1,2,3.0), 3)
s.center
s.r


camera = PerspectiveCamera(look_at, location, 2,2)
blue_back.(rays(camera))

