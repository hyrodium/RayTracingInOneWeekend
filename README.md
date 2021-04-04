# RayTracingInOneWeekend

## 概要
Juliaで[Ray Tracing in One Weekend](https://raytracing.github.io/books/RayTracingInOneWeekend.html)を実装していく

上資料はC++で書かれている。
他言語の実装だと例えば以下がある。
* Julia(2年前): https://github.com/cshenton/RayTracing.jl
* Go: https://github.com/y-taka-23/raytracing-go

## 方針
フルスクラッチではなく、使えるライブラリはなるべく使ってやっていく。

## 進捗
2. Output an Image
    * :white_check_mark: ppmを手書きで試す
    * :white_check_mark: `Images.jl`を使えば簡単
    * :white_check_mark: `ppm`でも`png`でもOK
3. The vec3 Class
    * :white_check_mark: 3次元空間の点には`GeometryBasics.jl`を使えばOK
    * :white_check_mark: 色には`Colors.jl`を使えばOK
4. Rays, a Simple Camera, and Background
    * :white_check_mark: `PerspectiveCamera`, `Ray`とかのstructをつくった。`Rotations.jl`が便利
    * :white_check_mark: 青背景のレンダリング完了
5. Adding a Sphere
    5.1. Ray-Sphere Intersection
    5.2. Creating Our First Raytraced Image
6. Surface Normals and Multiple Objects
    6.1. Shading with Surface Normals
    6.2. Simplifying the Ray-Sphere Intersection Code
    6.3. An Abstraction for Hittable Objects
    6.4. Front Faces Versus Back Faces
    6.5. A List of Hittable Objects
    6.6. Some New C++ Features
    6.7. Common Constants and Utility Functions
7. Antialiasing
    7.1. Some Random Number Utilities
    7.2. Generating Pixels with Multiple Samples
8. Diffuse Materials
    8.1. A Simple Diffuse Material
    8.2. Limiting the Number of Child Rays
    8.3. Using Gamma Correction for Accurate Color Intensity
    8.4. Fixing Shadow Acne
    8.5. True Lambertian Reflection
    8.6. An Alternative Diffuse Formulation
9. Metal
    9.1. An Abstract Class for Materials
    9.2. A Data Structure to Describe Ray-Object Intersections
    9.3. Modeling Light Scatter and Reflectance
    9.4. Mirrored Light Reflection
    9.5. A Scene with Metal Spheres
    9.6. Fuzzy Reflection
10. Dielectrics
    10.1. Refraction
    10.2. Snell's Law
    10.3. Total Internal Reflection
    10.4. Schlick Approximation
    10.5. Modeling a Hollow Glass Sphere
11. Positionable Camera
    11.1. Camera Viewing Geometry
    11.2. Positioning and Orienting the Camera
12. Defocus Blur
    12.1. A Thin Lens Approximation
    12.2. Generating Sample Rays
