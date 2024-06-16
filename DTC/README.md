# DTC-Analysis - Current projects

## Map salinity, temperature, oxygen on to bathymetry.
- working on
  
## Plot salinity, temperature and habitat type
<img width="1494" alt="Screenshot 2024-06-16 at 1 42 20 PM" src="https://github.com/Isabela-conde/IN2024_V04-Data-Analysis/assets/106574502/623643b2-d836-4183-a5e3-d3601d4ab725">


## Plot substrate and habitat on bathymetry 
- function for plotting substrate/habitat on bathymetry (example below!)
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


## DCT_substrate_habitat_maps.qmd
Code to create substrate and habitat tow line maps, currently only a test with tow 3 line 19.
- contains function to plot all tow lines (just need csv and nc files and the start and end time off bottom)
the test code runs on the following tow data:
-   IN2024_V04_003

The nc files for this is located in the '/data/Science-Team/DTC_CTD_CSV' directory
The csv files for this is located in the '/data/Science-Team/Deep Camera/substrate_annotations/csv_files

##### Output
The code produces the plot mapping Deep camera tow lines for substrate and habitat variables.

#### Requirements
- RStudio (R)

