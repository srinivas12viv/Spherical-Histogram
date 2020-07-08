# Spherical-Histogram
This Matlab code allows you to visualize the spherical histograms of the vector distribution in space. 

Bin selection is very important in such a visualisation. 

<img align="right" width="200" height="225" src="/Lat_Long.png">

The most traditional lattitude and longitude division of a unit sphere, generate bins with equal spacing of angle in both azimithul and polar directions. 
Such a bin division is not appropriate, because each bin has different area. **Example:** large bin areas at the equator and very samll bin areas at the poles (see aside figure).

To have fair vector distribution, it is important for each bin to have equal area. Thus the probability for a vector to fall in any bin is the same.

In this code, a modified version of latitude/longitude division of sphere is coded ensuring equal area of each bin. 

User has to choose number of logitudnal divisions and latitudnal divisions they wish to distribute their vector data. 

Depending on the No. of longitudnal divisions (L<img src="https://latex.codecogs.com/svg.latex?\large&space;Long\_div "/>), the azimithul direction is equally spaced. **Example:** 36 longitudnal divisions, meaning each bin in azimithul direction is seperated by 10 degrees. Whereas in the polar direction depending on the No. of latitudnal divisions (<img src="https://latex.codecogs.com/svg.latex?\large&space;Lat\_div "/>), the polar angles                                <img src="https://latex.codecogs.com/svg.latex?\large&space;[0,\theta_1.....,\theta_i,.......\pi] "/> are calculated as follows:

<img src="https://latex.codecogs.com/svg.latex?\large&space;\theta_i=cos^{-1}(1-\frac{2i}{Lat\_div})" /> (Refer below section for the polar angle computation)

The file *'normals.txt'* in this repository contains data of several vectors where each row represents a vector with coordinates (x,y,z). The distribution of this vector data, with Long_div=36 and Lat_div=18 is as follows,

<p align="center">
  <img width="325" height="300" src="/SphericalHistogram.png">
</p>

## Polar angle computation

For a unit sphere, we know, 

the total surface area= <img src="https://latex.codecogs.com/svg.latex?\large&space;4\pi "/>

If no. of longitudnal divisions= <img src="https://latex.codecogs.com/svg.latex?\large&space;Long\_div "/>, the angel spacing between each longitudnal divsion =<img src="https://latex.codecogs.com/svg.latex?\large&space;\frac{2\pi}{Long\_div}"/>

The surface area of each logitudnal division= <img src="https://latex.codecogs.com/svg.latex?\large&space;\frac{4\pi}{Long\_div}"/>

If no. of latitudnal divisions= <img src="https://latex.codecogs.com/svg.latex?\large&space;Lat\_div "/>

The surface area of each bin= <img src="https://latex.codecogs.com/svg.latex?\large&space;\frac{4\pi}{(Long\_div)(Lat\_div)}"/>

The area from the pole of a longitudnal division till a polar angle <img src="https://latex.codecogs.com/svg.latex?\large&space;\theta"/> can be given as: <img src="https://latex.codecogs.com/svg.latex?\large&space;\int_0^{\theta}\frac{2\pi}{(Long\_div)}sin{\theta}d{\theta}"/>

Suppose the angle <img src="https://latex.codecogs.com/svg.latex?\large&space;\theta_i"/> be the polar angle of the *i<sup>th</sup>* latitudnal division from the pole, the corresponding area from the pole is *i* times the bin area, i.e., <img src="https://latex.codecogs.com/svg.latex?\large&space;\frac{4\pi*i}{(Long\_div)(Lat\_div)}"/> which is also equal to <img src="https://latex.codecogs.com/svg.latex?\large&space;\int_0^{\theta_i}\frac{2\pi}{(Long\_div)}sin{\theta}d{\theta}"/>

Integrating and rearranging terms give, the polar angle <img src="https://latex.codecogs.com/svg.latex?\large&space;\theta_i=cos^{-1}(1-\frac{2i}{Lat\_div})" />
