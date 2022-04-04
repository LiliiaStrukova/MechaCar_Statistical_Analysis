# Deliverable 1
library(dplyr)

# Import dataset
mechacar_table <- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)
head(mechacar_table)

# Multiple linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_table)

# Generate summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_table))


# Deliverable 2
# Import dataset
suspension_coil <- read.csv('Suspension_Coil.csv',check.names = F,stringsAsFactors = F)
head(suspension_coil)

# Create summary table
total_summary <- suspension_coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
total_summary

# Create summary with grouping
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
lot_summary


# Deliverable 3
# Determine if the PSI across all lots is statistically
# different from the population mean of 1,500 PSI
t.test(suspension_coil$PSI, mu=1500)

# For Lot1
t.test(subset(suspension_coil$PSI, suspension_coil$Manufacturing_Lot=="Lot1"), mu=1500)

# For Lot2
t.test(subset(suspension_coil$PSI, suspension_coil$Manufacturing_Lot=="Lot2"), mu=1500)

# For Lot3
t.test(subset(suspension_coil$PSI, suspension_coil$Manufacturing_Lot=="Lot3"), mu=1500)
