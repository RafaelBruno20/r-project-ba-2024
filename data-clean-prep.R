#Add .csv to data frame.
diamonds_sale <- read.csv("diamonds.csv")

#Install Packages
install.packages("dplyr")
install.packages("lubridate")
install.packages("ggplot2")
install.packages("stringr")
install.packages("tidyr")

#Add Plugins to Library
library(dplyr)
library(lubridate)
library(ggplot2)
library(stringr)
library(tidyr)


#Remove unwanted columns.
diamonds_sale <- subset(diamonds_sale, select = -c(X))

#Check for NA values -> 0
sum(is.na(diamonds_sale))
#If you want to remove NA Values
diamonds_sale <- na.omit(diamonds_sale)

#Check for duplicates -> 0
sum(duplicated(diamonds_sale))
#Remove duplicate using Dplyr packages
diamonds_sale <- distinct(diamonds_sale)

#Get Columns Names
names(diamonds_sale)

#Factoring categorical columns
diamonds_sale$cut <- as.factor(diamonds_sale$cut)
diamonds_sale$clarity <- as.factor(diamonds_sale$clarity)
diamonds_sale$color <- as.factor(diamonds_sale$color)

#Save data on new CSV to be used for Regression Modeling
write.csv(diamonds_sale, "diamond_sales_clean.csv")

