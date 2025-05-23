if(F){
  #load("~/Desktop/assort_testinit_250515.Rdata")
#load("~/Desktop/init_assorttest_v0.2.Rdata")
  
  
# trun<-  TransectRun(modVersion = "region", species="mixed")
#   
#   
# tmev<- trun$multiEnergyWood
# 
# tmev[1,,,"sawnwood"]

library(Rprebasso)
  load("~/Desktop/init_assorttest_v0.4_200sites.Rdata")


str(initPrebas)
  
    
  
  #pout<- regionPrebas(initPrebas, HarvLim=harvlim_stat_nodist, siteOrder = siteorderX, cutAreas=cutareasX, oldLayer = oldLayer, ageHarvPrior = prot.old.thresh)


# 
# dim(initPrebas$multiEnergyWood)
# 
# nSites=2616
# maxYears=100
# maxNlayers=6
# layerNam=c(1:6)
# 
# initPrebas$multiEnergyWood <- array(0, dim=c(nSites,(maxYears),maxNlayers,2),
#                          dimnames = list(site=NULL,year=NULL,layer=layerNam,
#                                          variable=c("v_harvested", "roundw_tot", "sawnwood", "pulpwood",
#                                                     "energywood_roundw", "energywood_tot", "energyw_stump",
#                                                     "stump_stem", "n_harvested", "d_harvested", "h_harvested",
#                                                     "qredfact", "stemwood_taper", "mgmt_type",
#                                                     "dummy1", "dummy2", "dummy3"),
#                                          assorttype=c("realised", "potential"))) #jhassort
# 
  dim(initPrebas$multiEnergyWood)
# #NEWVERSION WITHOUT ANY ASSORTMENTS: reduce dims to uuse newVersion without assortment implementation ('newVersion' branch)  
nSites=200
maxYears=100
maxNlayers=6
layerNam=c(1:6)
# initPrebas$multiEnergyWood <- array(0, dim=c(nSites,(maxYears),maxNlayers,2),
#                          dimnames = list(site=NULL,year=NULL,layer=layerNam,
#                                          variable=NULL)) #jhassort
# 
# dim(initPrebas$multiEnergyWood)

# newversion with assortments, without potential/realised split

  initPrebas$multiEnergyWood <- array(0, dim=c(nSites,(maxYears),maxNlayers, 17),
                           dimnames = list(site=NULL,year=NULL,layer=layerNam,
                                           variable=c("v_harvested", "roundw_tot", "sawnwood", "pulpwood",
                                                      "energywood_roundw", "energywood_tot", "energyw_stump",
                                                      "stump_stem", "n_harvested", "d_harvested", "h_harvested",
                                                      "qredfact", "stemwood_taper", "mgmt_type",
                                                      "dummy1", "dummy2", "dummy3"))) #jhassort


  
  
oldLayer=0
prot.old.thresh = 0


# reduction to 200 sites: done for initprebas object, but not for rest
harvlim_stat_nodist[, 1] <- harvlim_stat_nodist[, 1]/2616*200
dim(siteorderX) # needs t be omitted, out of index values...
cutareasX[,1]=cutareasX[, 1]/2616*200
cutareasX[,5]=cutareasX[, 5]/2616*200

# issue: R is crashing in some runs, finishes (superficially seen) successfully in others. 
# what is new here is the combination of disturbances and assortments, may that's a good point to start. would eyplain the randomness of crashing.
# trying to switch off wind disturbances:

initPrebas$siteInfoDist <- NA
initPrebas$dist_flag=0
# manages to crash anyway. check if this really does switch off the disturbances!
# next to check: switch off assortments via hardcoded switch (though not entirely sure if this will indeed switch off everything/use only the original stuff...)

#pout<- regionPrebas(initPrebas)
#for(run in 1:10){
start <- Sys.time()
pout<- regionPrebas(initPrebas, HarvLim=harvlim_stat_nodist,  cutAreas=cutareasX, oldLayer = oldLayer, ageHarvPrior = prot.old.thresh)
Sys.time()-start
#print(paste("run ", run, " ok!"))
#}
pout$siteOrder[,100]









plot(pout$totHarv)
lines(pout$HarvLim[,1])



pout$outDist[1,,]
any(pout$outDist[,,]>0)

pout$siteInfoDist
any(pout$outdist[,,]>0)

dim(pout$multiEnergyWood)
 
pout$outDist







# 
# 
# 
# dim(pout$multiEnergyWood)
# 
# mew<- pout$multiEnergyWood
# 
# mew[1,,1,,1]
# 
# xmew[3,,1,1,1]
# 
# 
# 
# 
# 
# 
 save(pout, file="~/Desktop/assort_brosock_testpout_v0.85x_assortpot_wdistoff.Rdata")
# 
# 
 load("~/Desktop/assort_brosock_testpout_v0.85x_assortpot_wdistoff.Rdata")

 
 
 # 
# 
# 
# 
# load("~/Desktop/assort_brosock_testpout_v0.1.Rdata")
# 
# 
# 
# dim(pout$multiEnergyWood)
# 
mew<- pout$multiEnergyWood
 
mew[77,100,,]
mew[78,100,,]


pout$siteOrder[,100]



names(mew[1,1,1,])
 mew[1,,,"sawnwood"]
mew[1,,,"pulpwood"]
 mew[1,,,"sawnwood"]
 mew[1,,,"pulpwood"]

 
 mew[1,,,"sawnwood"]
 mew[1,,1,]
 
 
  
 
 
mew[1,55:65,,]


any(mew[1,,3:6,1:12]!=0)
which(mew[1,,2:6,1:12]!=0, arr.ind = T)

which(mew[1,,2:6,1:12]!=0)

mew[1,68,,]

mo <- pout$multiOut


mo[1,,"V", , 1]
mo[1,,"N", , 1]
mo[1,,"D", , 1]
mo[1,,"H", , 1]



hist(mo[,,"V", , 1])
hist(mo[,,"H", , 1])
hist(mo[,,"D", , 1])
hist(mo[,,"BA", , 1])

hist(mew[,,,"sawnwood"])
hist(mew[,,,"pulpwood"])
hist(mew[,,,"energywood_tot"])
hist(mew[,,,"energywood_roundw"])
hist(mew[,,,"n_harvested"])
hist(mew[,,,"d_harvested"])
hist(mew[,,,"v_harvested"])
hist(mew[,,,"h_harvested"])


pout$initClearcut
pout$initCLcutRatio

initPrebas$initCLcutRatio


# 
# 
# 
#   dim(pout$multiEnergyWood)
# 
# mew<- pout$multiEnergyWood
# mew[1,,]
# names(mew[1,1,1,,1])
# 
# dim(mew[,,,3,1])
# 
# sawn <- apply(mew, 2, sum)
# plot(sawn)

}

