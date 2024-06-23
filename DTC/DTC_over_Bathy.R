#### DTC Loop for plotting DTC over bathy ####
#Before starting, extract bathy and interpolated bathy from GIS

#Set work director and read in data sets
setwd("S:/BathyData/Solitary_Canyon") # this wd will only work aboard the Investigator
#setwd("S:/BathyData/Richmond_Canyon") #Un-hash when working on Richmond
data = read.csv("solitary_DTC.csv")
#data = read.csv("richmond_DTC_arcdata_added.csv") #Unhash when working on Richmond

#Identifying number of tows within the dataset
P= unique(data$TowLine)
OpCode = unique(data$OpCode)

#Calcaulating the difference in the camera above the seafloor
data$diff = data$depth-(as.numeric(data$bathydepth))

#Loop to plot each camera tow - DTC camera depth vs bathy depth and difference
for(i in seq_along(P)){
  data_subset = data[data$TowLine==P[i],]
  
  par(mar = c(4,4,1,8))
  plot(data_subset$distance_from_start,data_subset$depth,
       xaxs ="i",yaxs="i",
       type = "l",
       lty= 1,
       lwd=1.5,
       xlab ="Distance Along Line (km)",
       ylab ="Depth (m)",
       cex.lab = 1.25,
       cex=2,
       col="black",
       # xlim = c(20.7953,37.71949),
       # ylim = c(-5000,200)
  )
  
  lines (data_subset$distance_from_start,data_subset$bathydepth,
         lwd=1.5,
         col = "orangered3")
  lines (data_subset$distance_from_start,data_subset$bathydepth_interp,
         lwd=1.5,
         col = "#e9c716")
  
  par(new=TRUE)
  plot(data_subset$distance_from_start,data_subset$diff,
       type = "l",
       lty= 1,
       lwd=1.5,
       col="green4",
       xlab = "", ylab = "",
       axes=FALSE)
  
  mtext("Elevation Difference",side=4,col="red",line=4) 
  axis(4, ylim=c(-10,50), col="red",col.axis="red",las=1)
  
  legend(x ="topright",
         legend=c("DTC_Depth", "Bathymetery_Depth",
                  "Bathymetry_Depth_Interpolated","Difference"),
         title = "Legend",
         lwd=c(1.5,1.5,1.5,1.5),
         col=c("black","orangered3","#e9c716","green4"),
         lty= 1,cex=0.5)

}


### Plotting slope with the profile
#Loop to plot each camera tow - DTC camera depth vs bathy depth and difference
for(i in seq_along(P)){
  data_subset = data[data$TowLine==P[i],]
  
  par(mar = c(4,4,1,8))
  plot(data_subset$distance_from_start,data_subset$bathydepth,
       xaxs ="i",yaxs="i",
       type = "l",
       lty= 1,
       lwd=1.5,
       xlab ="Distance Along Line (km)",
       ylab ="Depth (m)",
       cex.lab = 1.25,
       cex=2,
       col="black",
  )
  
  par(new=TRUE)
  plot(data_subset$distance_from_start,data_subset$Slope,
       type = "l",
       lty= 1,
       lwd=1.5,
       col="magenta",
       xlab = "", ylab = "",
       axes=FALSE)
  
  mtext("Slope",side=4,col="red",line=4) 
  axis(4, ylim=c(-10,50), col="red",col.axis="red",las=1)
  
  legend(x ="topright",
         legend=c("Bathymetery_Depth","Slope"),
         title = "Legend",
         lwd=c(1.5,1.5),
         col=c("black","magenta"),
         lty= 1,cex=0.5)
  
}


# Making a data frame difference averages (i.e the average distance of the
#camera off the seafloor
n_tows = length(P) #find length of dataframe
sites=as.matrix(OpCode)
DTC=data.frame(matrix(NA,nrow=n_tows,ncol=4))#making the dataframe
DTC[,1]=sites #adding the first row names 
colnames(DTC) = c('OpCode','Mean_Diff','Median_Diff','Sd_Diff') #naming top row

#Loop stats calc for each camera tow
for (i in unique(data$OpCode)){
  DTC[DTC$OpCode==i,2]=mean(data[data$OpCode==i,"diff"], na.rm=TRUE)
  DTC[DTC$OpCode==i,3]=median(data[data$OpCode==i,"diff"], na.rm=TRUE)
  DTC[DTC$OpCode==i,4]=sd(data[data$OpCode==i,"diff"], na.rm=TRUE)
}

#Finding the mean, median and standrd dev of all the data
meanAll=mean(data$diff, na.rm=TRUE)
medianAll=median(data$diff, na.rm=TRUE)
sdAll=sd(data$diff, na.rm=TRUE)

#Appending the totals on to the end of the data frame
totals=c("All Data",meanAll,medianAll,sdAll)
DTC_DifferenceStats=rbind(DTC,totals)

