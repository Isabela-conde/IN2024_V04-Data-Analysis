# DTC-Analysis


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
