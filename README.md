# Spherical-Histogram
This Matlab code allows you to visualize the spherical histograms of the vector distribution in space. 

Bin selection is very important in such a visualisation. 

The most traditional lattitude and longitude division of a unit sphere, generates bins with equal spacing of angle in azimithul and polar directions. 
Such a bin division is not appropriate, because each bin has different area. Example: large bin areas at the equator and very samll bin areas at the poles.

To understand the isotropy in the vector distribution, it is important for each bin to have equal area. Thus the probability for a vector to fall in any bin is the same.

In this code, a modified version of latitude/longitude division of sphere is coded ensuring equal area of each bin. 

User has to choose number of logitudnal divisions and latitudnal divisions they wish to distribute their vector data. 

Depending on the No. of longitudnal divisions (Long_div), the azimithul direction is equally spaced. Ex: 36 longitudnal division mean, each bin in azimithul direction is seperated by 10 degrees.

Depending on the No. of latitudnal divisions (Lat_div), the polar direction angle is calculated to generate bins of equal area. 
