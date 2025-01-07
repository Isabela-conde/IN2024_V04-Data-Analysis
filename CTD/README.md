## Plotting CTD transects across the the canyon

Plotting CTD transects across the canyon


# Microrider Data

#### Some Papers suggested
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

Observational evidence of diapycnal upwelling
within a sloping submarine canyon (2024) 
Paper bublished https://www.nature.com/articles/s41586-024-07411-2

Internal Tides in Monterey Submarine Canyon (2011)
https://journals.ametsoc.org/configurable/content/journals$002fphoc$002f41$002f1$002f2010jpo4471.1.xml?t:ac=journals%24002fphoc%24002f41%24002f1%24002f2010jpo4471.1.xml&tab_body=abstract-display

### MATLAB files 
_Process .P files_

process_pickle.m automatically runs proccessing matlab code compute_AFP07_dissapation.m for case n=1,2,3 and 11,12.

Authors of code compute_AFP07_dissapation.m wrote the following article which expalins variables and method: 
Comparison of Turbulence Intensity from CTD-Attached and Free-Fall Microstructure Profilers
(Goto, 2017)

Requires .p pickle file of microrider data of the form DAT_xxx.p, can be found in folder 'smb://data/Science-Team/microstructure'

_Check values and Rejection Criteria_
sanity_check.m to check values produced from compute_AFP07_dissapation.m and how rejection criteria.

![DAT_034_vals](https://github.com/user-attachments/assets/2d5ef7b3-7269-40c9-9eaf-2a7861d070f6)


### Python files
Using epsilon values calculated with compute_AFP07_dissapation.m and rejection criteria applied. 

_plot_yoyo_profiles.ipynb_

Plots indivual profiles of salinity and temperature with rolling average of log10 eps. Along with collected profiles of yoyos with log10 eps.

![yoyo_profiles](https://github.com/user-attachments/assets/efdea88e-2b07-4e7f-a0de-a8ddc4f25563)


T-S curves with values of epsilon:


![TS_yoyo1](https://github.com/user-attachments/assets/aeaef434-4667-43f3-b22f-e6ff1f11f700)


_microrider_hov.ipynb_

Hovmollers of mircorider data for each yoyos in solitary canyon. 

![sol_yoyo_hov](https://github.com/user-attachments/assets/20971aa9-82c6-47e0-9869-39293ae7c488)
