# DTC-Analysis - Current projects

## Plotting camera path at floor bottom with salinity, temperature, habitat and benthic fauna  
- got fauna so far (today's task is salinity and temperature)
<img width="1502" alt="Screenshot 2024-06-19 at 4 58 52 AM" src="https://github.com/Isabela-conde/IN2024_V04-Data-Analysis/assets/106574502/660ef190-d817-4be3-add0-24289fc43a0d">


## Plot salinity, temperature of DTC across canyon
- this will be updated (the scale is changing + adding two lines for each DTC)
<img width="1494" alt="Screenshot 2024-06-16 at 1 42 20 PM" src="https://github.com/Isabela-conde/IN2024_V04-Data-Analysis/assets/106574502/623643b2-d836-4183-a5e3-d3601d4ab725">


## Plot substrate and habitat on bathymetry 
- function for plotting substrate/habitat on bathymetry (example below!)
  ![plot](https://github.com/Isabela-conde/INV_V04-DTC_CTD-Analysis/assets/106574502/94493c98-faf8-42ce-b8dd-a949df34789d)


## process_dtc.ipynb
Code to process and analyse CSV files from Conductivity, Temperature, Depth along with DTC lat,lon and indexed by time.
The code collates data from DTC and CTD sources, in the format - IN2024_V04_xxx.csv. Steve needs to first process the csv files. 

The data for these tests are located in the '/Volumes/Science-Team/DTC_CTD_CSV' directory.

Latitude and longitude data are extracted from the 'In2024_V04...' files.

##### Output

The code produces NetCDF files that contain datetime stamps, latitude, longitude, depth, and other variables.

#### Requirements

- Python
- pandas
- xarray
- netCDF4


## DTC_substrate_habitat_maps.qmd
Code to create substrate and habitat tow line maps.
- contains function to plot all tow lines (just need csv and nc files and the start and end time off bottom)
  currently runs on all the Solitary DTC:
-   IN2024_V04_003

The nc files for this is located in the '/data/Science-Team/DTC_CTD_CSV' directory
The csv files for this is located in the '/data/Science-Team/Deep Camera/substrate_annotations/csv_files

##### Output
The code produces the plot mapping Deep camera tow lines for substrate and habitat variables.

#### Requirements
- RStudio (R)

