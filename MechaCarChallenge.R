#import dplyr library
library(dplyr)

#import mpg data 
mc_table <- read.csv(file='Resources/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#generate a multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mc_table)

#generate summary statistics for the above multiple linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mc_table)) 

# import suspension coil data 
sc_table <- read.csv(file='Resources/Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# Create a table with summary stats for suspension coil's PSI column
total_summary <- sc_table %>% summarize(Mean=mean(PSI), Median=median(PSI), 
                            Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

#Group manufacturing lot by summary stats generated above
lot_summary <- sc_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), 
            Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

#Perform a T-test to determine statistical difference between sample and population (if any)
t.test(sc_table$PSI,mu=1500)

# T-test repeated for three manufacturing lots from the suspension coil data
t.test(subset(sc_table,Manufacturing_Lot=='Lot1')$PSI,mu=1500)
t.test(subset(sc_table,Manufacturing_Lot=='Lot2')$PSI,mu=1500)
t.test(subset(sc_table,Manufacturing_Lot=='Lot3')$PSI,mu=1500)

