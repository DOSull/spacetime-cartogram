library(tessellation)
library(dplyr)

# make a lattice
pts <- expand.grid(1:3, 1:3, 1:3) %>%
  unlist() %>%
  matrix(ncol = 3)
pts <- pts + runif(nrow(pts), -.01, .01)

d <- delaunay(pts)
plotDelaunay3D(d, color = FALSE)  # this is slow!

v <- voronoi(d)
# indices of the bounded cells
bounded <- lapply(v, isBoundedCell) %>% 
  unlist() %>% 
  which()

# plotVoronoiDiagram(v)

# change the index here to plot other cells until you find a nice one!
plotBoundedCell3D(v[[bounded[4]]], facetsColor = "red", alpha = 0.75)
