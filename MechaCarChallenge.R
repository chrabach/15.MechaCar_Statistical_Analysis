
#Deliverable 1
library(dplyr)
mechacar <- read.csv(file='MechaCar_mpg.csv')
head(mechacar)

lm(mpg~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mechacar)
summary (lm(mpg~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mechacar))

#Deliverable 2



Suspension_Coil <- read.csv(file='Suspension_Coil.csv')
total_summary <- Suspension_Coil  %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI) , SD = sd(PSI) )
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot)  %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI) , SD = sd(PSI) )




#Maitree (2)
#temporary test for normality 15.4.4
shapiro.test(Suspension_Coil$PSI)
ggplot(Suspension_Coil,aes(x=PSI)) + geom_density()

#Maitree (3)
#temporary F test
ftest <- var.test(Suspension_Coil$PSI,100)
ftest
#temporary chi-squared test
chisq.test(Suspension_Coil$PSI,100)







#Maitree (6)
#Deliverable 3
t.test(Suspension_Coil$PSI,mu=1500) #compare sample versus population means

#what is subset, how do you use?
#Lot1 <- subset(Suspension_Coil,Manufacturing_Lot == 'Lot1')
#t.test(Lot1$PSI,mu=1500)
#t.test(Suspension_Coil$PSI,mu=1500,subset(Suspension_Coil,Manufacturing_Lot == 'Lot1'))
t.test(subset(Suspension_Coil,Manufacturing_Lot == 'Lot1')$PSI,mu=1500)


#Lot2 <- subset(Suspension_Coil,Manufacturing_Lot == 'Lot2')
#t.test(Lot2$PSI,mu=1500)
#t.test(Suspension_Coil$PSI,mu=1500,subset(Suspension_Coil,Manufacturing_Lot == 'Lot2'))
t.test(subset(Suspension_Coil,Manufacturing_Lot == 'Lot2')$PSI,mu=1500)


#Lot3 <- subset(Suspension_Coil,Manufacturing_Lot == 'Lot3')
#t.test(Lot3$PSI,mu=1500)
t.test(subset(Suspension_Coil,Manufacturing_Lot == 'Lot3')$PSI,mu=1500)

#t.test(Suspension_Coil$PSI,mu=1500,subset(Suspension_Coil,Manufacturing_Lot == 'Lot3'))
#how to interpret the p-values here?