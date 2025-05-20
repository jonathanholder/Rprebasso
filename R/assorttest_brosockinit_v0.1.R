if(F){
  #load("~/Desktop/assort_testinit_250515.Rdata")
#load("~/Desktop/init_assorttest_v0.2.Rdata")
  load("~/Desktop/init_assorttest_v0.3_200sites.Rdata")
#pout<- regionPrebas(initPrebas, HarvLim=harvlim_stat_nodist, siteOrder = siteorderX, cutAreas=cutareasX, oldLayer = oldLayer, ageHarvPrior = prot.old.thresh)


# 
# dim(initPrebas$multiEnergyWood)
# 
# nSites=2616
# maxYears=100
# maxNlayers=6
# layerNam=c(1:6)
# 
# initPrebas$multiEnergyWood <- array(0, dim=c(nSites,(maxYears),maxNlayers,17,2),
#                          dimnames = list(site=NULL,year=NULL,layer=layerNam,
#                                          variable=c("v_harvested", "roundw_tot", "sawnwood", "pulpwood",
#                                                     "energywood_roundw", "energywood_tot", "energyw_stump",
#                                                     "stump_stem", "n_harvested", "d_harvested", "h_harvested",
#                                                     "qredfact", "stemwood_taper", "mgmt_type",
#                                                     "dummy1", "dummy2", "dummy3"),
#                                          assorttype=c("realised", "potential"))) #jhassort
# 

dim(initPrebas$multiEnergyWood)


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


# 
# pout$outDist[1,,]
# any(pout$outDist[,,]>0)
# 
# pout$siteInfoDist
# any(pout$outdist[,,]>0)
# 
# 
# pout$outDist
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
# save(pout, file="~/Desktop/assort_brosock_testpout_v0.2_assort1_wdistoff.Rdata")
# 
# 
# load("~/Desktop/assort_brosock_testpout_v0.2_assort1_wdistoff.Rdata")
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
# mew<- pout$multiEnergyWood
# names(mew[1,1,1,,1])
# mew[1,,,"sawnwood",1]
# mew[1,,,"pulpwood",1]
# mew[1,,,"sawnwood",2]
# mew[1,,,"pulpwood",2]
# 
# mew[1,80,,,2]
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

