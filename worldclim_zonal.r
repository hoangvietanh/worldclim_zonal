library(raster)
library(rgdal)
setwd("c:/todel/demo r/")

alt <- getData('alt', country = "VNM")
tinh <- getData('GADM', country = "VNM", level = 1)
anual_temp = getData('worldclim', var="bio",res=10)

plot(alt)
plot(tinh, add=T)

alt_tinh=extract(alt, tinh, fun = mean, na.rm = T, small = T, df = T)

province_alt=merge(alt_tinh,tinh,by.x="ID",by.y="OBJECTID",all.y=TRUE)
myvars = c("VNM_msk_alt", "VARNAME_1")
province_alt2 = province_alt[myvars]
write.csv(province_alt2,file="province_alt_csv.csv")
