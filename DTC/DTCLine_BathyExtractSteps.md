# Steps to plot DCT route a top of bathy
Written for extarction of data from ArcPro GIS into R. 
Should be doable from Q GIS or just R as well

1) Requires the DTC route already extrated including: depth and distance_from_start - using existing code (thanks Steph)

Next steps taken using ArcPro - should be possible in QGIS. Should also be possible in R (though I have no idea how)

2) Load most up to date bathy file in WGS-1984
Solitary = (S:\BathyData\Solitary_Canyon\15_June\in2024_v04_EM122_SA_20m_UTM56S_240615.tif)
Richmond =  (S:\BathyData\Richmond_Canyon\Richmond_2018_50m.tif)

3) Load csv or txt file of the DTC line into GIS - will load in as a table

4) Display X, Y data; X field = Latitude, Y field = Longitude
Will display the DTC track as points

5) Extract Values to Points function in ArcPro
This adds an attribute to the DTC points which has the bathy depth on it. 
Do this twice, once as normal and once as interpoltaion.
This will have added the bathy depth into the attributes

For QGIS you should be able to use the Point Sampling Tool plug in or code in request to bind attribute data
https://gis.stackexchange.com/questions/3538/extracting-raster-values-at-points-using-open-source-gis

7) To get slope (if it is of interest) use "Extract Values to Points" using on a slope rather than the bathy layer

8) Export the new attribute table - either as a csv or a txt file (what ever fomrat you wish to read into R).
You can also just copy paste the table from Arc as a shortcut
Double the lines match up. Arc does not read in any N/A data, so check if there are any in the intial dataset

# R Code -
Run the DTC_over_Bathy R code included within this DTC channel
This will produce 3 things:
1) a series of plots showing the depth of the camera over the depth of the seafloor (from the bathy) and the difefrence between the two
2) a series of plots showing the slope of the seafloor across a tow
3) a table which averages the difference between the camera depth and the seafloor of each tow



