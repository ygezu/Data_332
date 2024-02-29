library(readxl)
library(dplyr)
library(tidyverse)
library(tidyr)
library(ggplot2)
library(stringr)

#to automatically clear your environment 
#rm(list - ls())

#setting work directory 
setwd("~/Desktop/R (DATA 332)")

#bringing in the excel file, the sheet part is the second sheet not just its named sheet 2,
#also no spaces in your columns(.name_repair)
df_truck <- read_excel('NP_EX_1-2.xlsx', sheet = 2, skip = 3, .name_repair = 'universal')

#selecting columns 
df <- df_truck[, c(4:15)] 

#deselect columns 
df <- subset(df, select = -c(...10))

#calculating  DAYS OF DRIVING (difference in days within a column)
#option #1
date_min <- min(df$Date)
date_max <- max(df$Date)

num_of_days_on_road <- date_max - date_min
print(num_of_days_on_road)

#option #2
days <- difftime(max(df$Date), min(df$Date))
print(days)

#calculating the NUMBER OF HOURS driving 
total_hours <- sum(df$Hours)
print(paste("Total number of hours driving is", total_hours))


#calculating AVERAGE HOURS PER DAY
number_of_days_recorded <- nrow(df)  #instances for the days of driving 
avg_hours_perday <- round(total_hours / number_of_days_recorded, digits = 3) 

print(paste("Average hours driven per day is", avg_hours_perday))


#adding a column to a new table to show fuel cost 
df$fuel_cost <- df$Gallons * df$Price.per.Gallon

#adding a column to CREATE TOTAL COST
df$total_cost <- df$Tolls + df$Misc + df$fuel_cost
total_sum_of_costs <- sum(df$total_cost)

print(paste("Total cost incurred is", total_sum_of_costs))

#splitting based on the state and city
df[c('warehouse', 'city_state')] <- 
  str_split_fixed(df$Starting.Location, ',', 2) #splitting based on something you pick 

#calculating TOTAL FUEL COST
total_fuel_cost <- round(sum(df$fuel_cost), digits = 3)
print(paste("Total fuel consumed is", total_fuel_cost))

#calculating OTHER COSTS and total other costs  
df$other_costs <- df$Misc + df$Tolls
total_other_costs <- round(sum(df$other_costs), digits = 3)

print(paste("The sum of other total costs is", total_other_costs))


#TOTAL GALLONS CONSUMED 
total_gallons <- sum(df$Gallons)

print(paste("Total gallons consumes is", total_gallons))

#TOTAL MILES DRIVEN with a new column
df$total_miles <- df$Odometer.Ending - df$Odometer.Beginning
total_miles_driven <- sum(df$total_miles)

print(paste("Total number of miles driven is", total_miles_driven))

#MILES PER GALLON 
avg_miles_per_gallon <- round(total_miles_driven / total_gallons, digits = 3)

print(paste("Average miles driven per gallon is", avg_miles_per_gallon))

#TOTAL COST PER MILE 
sum_of_total_cost <- sum(df$total_cost)
sum_of_total_miles <- sum(df$total_miles)
total_cost_per_mile <- round(sum_of_total_cost / sum_of_total_miles, digits = 3)

print(paste("The total cost per mile was", total_cost_per_mile))


#string extract the commas 
df$city_state <- gsub(',', "", df$city_state)

#Separating columns (city and state)
# df[c('col1', 'col2')] <- str_split_fixed(df$city_state, '', 2)  ##this doesn't do the job because there needs to be more data cleaning 

#remove the two omahas ie white spaces 
df$ending_city_state <- str_squish(df$ending_city_state)

#renaming city_state, 
df[(c('warehouse', 'starting_city_state'))] <- 
  str_split_fixed(df$Starting.Location, ',', 2)

#making pivot tables(starting city_state and count) 
df_starting_pivot <- df%>%
  group_by(starting_city_state) %>% 
  summarize(count = n(), 
            mean_size_hours = mean(Hours, na.rm = TRUE),
            sd_hours = sd(Hours, na.rm = TRUE),
            total_hours = sum(Hours, na.rm = TRUE),
            total_gallons = sum(Gallons, na.rm = TRUE)
            )
 
ggplot(df_starting_pivot, aes(x= starting_city_state, y = count)) + 
  geom_col() + 
  theme(axis.text = element_text(angle =  45, vjust = 5, hjust = 1))



#charting the ending location with pivot tables 

df[c('ending_location', 'ending_city_state')] <- 
  str_split_fixed(df$Delivery.Location, ',', 2)

df_ending_pivot <- df%>%
  group_by(ending_city_state) %>% 
  summarize(count = n(), 
            mean_size_hours = mean(Hours, na.rm = TRUE),
            sd_hours = sd(Hours, na.rm = TRUE),
            total_hours = sum(Hours, na.rm = TRUE),
            total_gallons = sum(Gallons, na.rm = TRUE)
  )

ggplot(df_ending_pivot, aes(x= ending_city_state, y = count)) + 
  geom_col() + 
  theme(axis.text = element_text(angle =  45, vjust = 5, hjust = 1))























