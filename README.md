# Spherical-Histogram
This Matlab code allows you to visualize the spherical histograms of the vector distribution in space. 

Bin selection is very important in such a visualisation. 

The most traditional lattitude and longitude division of a unit sphere, generate bins with equal spacing of angle in both azimithul and polar directions. 
Such a bin division is not appropriate, because each bin has different area. **Example:** large bin areas at the equator and very samll bin areas at the poles.

<img align="right" width="200" height="225" src="/Lat_Long.png">

To understand the isotropy in the vector distribution, it is important for each bin to have equal area. Thus the probability for a vector to fall in any bin is the same.

In this code, a modified version of latitude/longitude division of sphere is coded ensuring equal area of each bin. 

User has to choose number of logitudnal divisions and latitudnal divisions they wish to distribute their vector data. 

Depending on the No. of longitudnal divisions (Long_div), the azimithul direction is equally spaced. Ex: 36 longitudnal divisions, meaning each bin in azimithul direction is seperated by 10 degrees. Whereas in the polar direction depending on the number of latitudnal divisions, the polar angles                                <img src="https://latex.codecogs.com/svg.latex?\large&space;[0,\theta_1.....,\theta_i,.......\pi] "/> are calculated as follows:

<img src="https://latex.codecogs.com/svg.latex?\large&space;\theta_i=cos^{-1}(1-\frac{2i}{Lat\_div})" />

The file *'normals.txt'* in this repository contains data of several vectors where each row is representing a vector with coordinates (x,y,z). The distribution of this vector data, with Long_div=36 and Lat_div=18 is as follows,

<p align="center">
  <img width="325" height="300" src="/SphericalHistogram.png">
</p>
