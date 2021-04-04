using Colors
using Images


img = [RGB(1,i/100,j/100) for i in 1:100, j in 1:100]

save("hoge.png", img)
save("hoge.ppm", img)

# Imagesライブラリ使えば簡単.
# ppmが文字化けしてるけどまあいっか.
