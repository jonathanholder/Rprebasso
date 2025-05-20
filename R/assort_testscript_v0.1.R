if(F){
x <- TransectRun(species="Mixed", modVersion = "region", SiteType=3)
x$multiOut[1,,"V",,1]
dim(x$multiEnergyWood)



?TransectRun
x$multiEnergyWood[1,,1,,]

library(ggplot2)
library(data.table)
#install.packages(c('sm', 'dplyr', 'plyr', 'zoo', 'abind'))

names(x$multiEnergyWood[1,1,1,,1])
names(x$multiEnergyWood[1,1,1,1,2])

# LAYER LEVEL

# realised

layerx <- 1
s <- x$multiEnergyWood[1,,layerx,"sawnwood",1]
p <- x$multiEnergyWood[1,,layerx,"pulpwood",1]
er <- x$multiEnergyWood[1,,layerx,"energywood_roundw",1]
et <- x$multiEnergyWood[1,,layerx,"energywood_tot",1]

assortx <- data.table(year=1:100, sawnwood=s, pulpwood=p, energywood_roundw=er, energywood_tot=et)

ggplot(data=assortx)+
  geom_line(aes(x=year, y=sawnwood, col="sawnwood"))+
  geom_line(aes(x=year, y=pulpwood, col="pulpwood"))+
  geom_line(aes(x=year, y=energywood_roundw, col="energywood_roundw"))+
  geom_line(aes(x=year, y=energywood_tot, col="energywood_tot"))



any(x$multiEnergyWood[,,,,2]>0)

# potential

layerx <- 2
s <- x$multiEnergyWood[1,,layerx,"sawnwood",2]
p <- x$multiEnergyWood[1,,layerx,"pulpwood",2]
er <- x$multiEnergyWood[1,,layerx,"energywood_roundw",2]
et <- x$multiEnergyWood[1,,layerx,"energywood_tot",2]

assortx <- data.table(year=1:100, sawnwood=s, pulpwood=p, energywood_roundw=er, energywood_tot=et)

ggplot(data=assortx)+
  geom_line(aes(x=year, y=sawnwood, col="sawnwood"))+
  geom_line(aes(x=year, y=pulpwood, col="pulpwood"))+
  geom_line(aes(x=year, y=energywood_roundw, col="energywood_roundw"))+
  geom_line(aes(x=year, y=energywood_tot, col="energywood_tot"))



x$multiOut[1,,"V",,1]
x$multiOut[1,,"D",,1]



## Site level (sum of layers)

# REALISED
s <- rowSums(x$multiEnergyWood[1,,,"sawnwood",1])
p <- rowSums(x$multiEnergyWood[1,,,"pulpwood",1])
er <- rowSums(x$multiEnergyWood[1,,,"energywood_roundw",1])
et <- rowSums(x$multiEnergyWood[1,,,"energywood_tot",1])

assort_real <- data.table(year=1:100, sawnwood=s, pulpwood=p, energywood_roundw=er, energywood_tot=et)

p_assort_r<- ggplot(data=assort_real)+
  geom_line(aes(x=year, y=sawnwood, col="sawnwood"))+
  geom_line(aes(x=year, y=pulpwood, col="pulpwood"))+
  geom_line(aes(x=year, y=energywood_roundw, col="energywood_roundw"))+
  geom_line(aes(x=year, y=energywood_tot, col="energywood_tot"))

# POTENTIAL
s <- rowSums(x$multiEnergyWood[1,,,"sawnwood",2])
p <- rowSums(x$multiEnergyWood[1,,,"pulpwood",2])
er <- rowSums(x$multiEnergyWood[1,,,"energywood_roundw",2])
et <- rowSums(x$multiEnergyWood[1,,,"energywood_tot",2])

assort_pot <- data.table(year=1:100, sawnwood=s, pulpwood=p, energywood_roundw=er, energywood_tot=et)

p_assort_p<- ggplot(data=assort_pot)+
  geom_line(aes(x=year, y=sawnwood, col="sawnwood"))+
  geom_line(aes(x=year, y=pulpwood, col="pulpwood"))+
  geom_line(aes(x=year, y=energywood_roundw, col="energywood_roundw"))+
  geom_line(aes(x=year, y=energywood_tot, col="energywood_tot"))



# potential as line, realised as points

p_assort_all<- ggplot()+
  geom_line(data=assort_pot, aes(x=year, y=sawnwood, col="sawnwood"))+
  geom_line(data=assort_pot, aes(x=year, y=pulpwood, col="pulpwood"))+
  geom_line(data=assort_pot, aes(x=year, y=energywood_roundw, col="energywood_roundw"))+
  geom_line(data=assort_pot, aes(x=year, y=energywood_tot, col="energywood_tot"))+
  geom_point(data=assort_real, aes(x=year, y=sawnwood, col="sawnwood"))+
  geom_point(data=assort_real, aes(x=year, y=pulpwood, col="pulpwood"))+
  geom_point(data=assort_real, aes(x=year, y=energywood_roundw, col="energywood_roundw"))+
  geom_point(data=assort_real, aes(x=year, y=energywood_tot, col="energywood_tot"))


p_assort_all

plot_site2(1, x$multiOut, x$outDist)


x$multiEnergyWood[1,63,,,]

library(ggpubr)
install.packages("ggpubr")
ggarrange(p_assort_p, p_assort_r)







x$totHarv
x$cutAreas

}
