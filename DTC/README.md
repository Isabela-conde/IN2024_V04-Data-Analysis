# DTC-Analysis - Current projects

## Map salinity, temperature, oxygen on to bathymetry.
- working on
  
## Plot salinity, temperature and habitat type
- tomorrow's project!

## Plot substrate and habitat on bathymetry 
- tow 3 line 19 is done (still got to fix a couple of errors)
- currently making function for the rest
  ![plot](https://github.com/Isabela-conde/INV_V04-DTC_CTD-Analysis/assets/106574502/94493c98-faf8-42ce-b8dd-a949df34789d)


## process_dtc.ipynb
Code to process and analyse CSV files from Conductivity, Temperature, Depth along with DTC lat,lon and indexed by time.
The code collates data from DTC and CTD sources, specifically from the following tests:

- IN2024_V04_001
- IN2024_V04_002
- IN2024_V04_003
- IN2024_V04_004
- IN2024_V04_005

The data for these tests are located in the '/Volumes/Science-Team/DTC_CTD_CSV' directory.

Latitude and longitude data are extracted from the 'In2024_V04...' files.

##### Output

The code produces NetCDF files that contain datetime stamps, latitude, longitude, depth, and other variables.

#### Requirements

- Python
- pandas
- xarray
- netCDF4

#### Usage

To use this code, simply run the `process_ctd_dtc.ipynb` notebook in a Python environment where the required libraries are installed. The notebook will automatically load the data, process it, and save the output to NetCDF files.


## DCT_substrate_habitat_maps.qmd
Code to create substrate and habitat tow line maps, currently only a test with tow 3 line 19.
- Working on making a function to plot all tow lines
the test code runs on the following tow data:
-   IN2024_V04_003

The nc files for this is located in the '/data/Science-Team/DTC_CTD_CSV' directory
The csv files for this is located in the '/data/Science-Team/Deep Camera/substrate_annotations/csv_files

##### Output
The code produces the plot mapping Deep camera tow lines for substrate and habitat variables.

#### Requirements
- RStudio (R)

