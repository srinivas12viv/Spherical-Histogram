# Spherical-Histogram
This Matlab code allows you to visualize the spherical histograms of the vector distribution in space. 

Bin selection is very important in such a visualisation. 

The most traditional lattitude and longitude division of a unit sphere, generates bins with equal spacing of angel in azimithul and polar direction. 
Such a bin division is not appropriate, because each bin has different area. Example: large bin areas at the equator and very samll bin areas at the poles.

To understand the isotropy in the vector distribution, it is important for each bin to have similar area. Thus the probability for a vector to fall in any bin is same.

In this code, the traditional lattitude and longitude division of unit sphere is modified. 
