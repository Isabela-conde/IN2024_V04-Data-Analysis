# CTD: current projects

## Plotting CTD transects across the the canyon

Megan: Plotting CTD transects across the canyon

## YoYos: Analysining data from microrider 
_Bela_
Using micorider to look at the mixing coefficients chi and epsilon and see how they change with time and how this effects isotherms.

Paper produced with the same instrument and method:
Estimation of Basin-scale turbulence distribution in the North Pacific Ocean using CTD-attached thermistor measurements
(Goto, 2021)
https://www.nature.com/articles/s41598-020-80029-2


An article with a similar method:
Turbulent Diffusivity Profiles on the Shelf and Slope at the
Southern Edge of the Canada Basin.
(Yee, 2024)
https://agupubs.onlinelibrary.wiley.com/doi/pdfdirect/10.1029/2023JC019932


### 1. Process .P files to .nc files 

process_pickle.m automatically runs proccessing matlab code compute_AFP07_dissapation.m for case n=1,2,3 and 11,12.

Authors of code compute_AFP07_dissapation.m wrote the following article which expalins variables and method: 
Comparison of Turbulence Intensity from CTD-Attached and Free-Fall Microstructure Profilers
(Goto, 2017)

Requires .p pickle file of microrider data of the form DAT_xxx.p, can be found in folder 'smb://data/Science-Team/microstructure'

#### output

Completes the following processes:

- compute_AFP07_dissipation('sss_ccc', 1) - check file name "sss_ccc_start_end.p" in work
- compute_AFP07_dissipation('sss_ccc_start_end', 2)
- compute_AFP07_dissipation('sss_ccc_start_end', 3)
- compute_AFP07_dissipation('sss_ccc_start_end_spectra', 11, 'C512_2pole30msecW0')
- compute_AFP07_dissipation('sss_ccc_start_end_spectra', 12, 'C512_2pole30msecW0') - may need to uncomment to run this

  Requires MATLAB unfortunately

### 2. Check values and Rejection Criteria

Pulls out rejection criteria from file and plots points that are omitted as well as computed values. 

#### output

- dT'dt
- log10 chi
- MAD
- log10 SNR
- W
- S std
- with rejected criteria

  Requires MATLAB

### 3. Plot profiles

plot epsilon and chi profiles for each yoyo, smoothed data a alot.



