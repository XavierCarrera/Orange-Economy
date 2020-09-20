
pairs(orangeec[,2:6])

pairs(orangeec[,5:10])

newdata <- subset(orangeec,select = c (5,6,10,11,12,13))
newdata

pairs(newdata)

cor(orangeec[,2:6])

# Data Cleaning

cor(orangeec[,2:6],use='complete.obs')

cor(orangeec[,5:10],use = 'complete.obs')

cor(newdata, use='complete.obs')

# Variation Coefficient Consideration

summary(orangeec)

desv <- sd(orangeec$Internet.penetration...population)
desv

prom <- mean(orangeec$Internet.penetration...population)
prom

CoefVar <- (desv/prom)*100
CoefVar

mean(orangeec$Creat.Ind...GDP)
mean(orangeec$Creat.Ind...GDP, na.rm=TRUE)
prom <- mean(orangeec$Creat.Ind...GDP, na.rm=TRUE)

sd(orangeec$Creat.Ind...GDP)
sd(orangeec$Creat.Ind...GDP, na.rm = TRUE)
desv <- sd(orangeec$Creat.Ind...GDP, na.rm = TRUE)

CoefVar<- (desv/prom)*100
CoefVar