#Initial Build

#Reading In Pre-existing Data
DATA <- read.csv(file.choose(), header = T)
attach(DATA)

#Packages
install.packages("tidyverse", dependencies = T)
library(tidyverse)
library(dplyr)

#Saving Files
write.csv(DATA,"~/Bartending_Helper/Drinks.csv", row.names = FALSE)

#Make The Dataframe
DATA <- data.frame(
  drinks = c("Gin and Tonic", ""),
  ingredients = I(list(
    #Gin and Tonic
    c("gin", "tonic water"),
    #
    c("")
  )),
  measurements = I(list(
    #Gin and Tonic
    c("2 oz", "fill"),
    #
    c("")
  )),
  garnish = I(list(
    # Gin and Tonic
    c("lime wedge"),
    #
    c("")
  )),
  flavors = I(list(
    #Gin and Tonic
    c("spirit"),
    #
    c("")
  ))
)

#Add Column -> Convert to list
DATA$spirit <- c(NA)
DATA$spirit <- as.list(DATA$spirit)

#Filter By One Pair Flavor
result <- DATA %>%
  filter(sapply(pair_flavor, function(x) "lime" %in% x))
result <- DATA %>%
  filter(sapply(pair_flavor, function(x) "pineapple" %in% x))
print(result)

#Print Last Row Pair Flavors
print(DATA$pair_flavor[length(DATA) - 1])

#Add New Row
DATA <- rbind(DATA, data.frame(
  drinks = "",
  ingredients = I(list(c("", "")
  )),
  measurements = I(list(c("", "")
  )),
  garnish = I(list(c("", "")
  )),
  flavors = I(list(c("", "")
  ))
  )
)
print(DATA)

#Delete Last Row
DATA <- DATA %>% filter(row_number() <=n()-1)

#Needs Updating

#Use [i] to use the whole data frame
#Use [[i]] to use the column
#Use [[i]][i] to use an element in the column
print(DATA[[2]])
print(DATA$pair)
print(DATA$flavor[[2]])
print(DATA$pair_flavor[[2]][2])

#Alter Row
length(DATA$flavor)
#Change row to a list from NA
DATA$pair <- rep(list(NA), nrow(DATA))
DATA$pair[[1]] <- c("mint", "lime", "pineapple", "coffee", "cacao", "vanilla", "matcha", "lemon", "cherry", "orange", "melon", "passionfruit", "mango")
DATA$spirit <- rep(list(NA), nrow(DATA))
DATA$spirit[[1]] <- c("goldrum", "jamacianrum", "bourbon", "whiskey", "gin", "tequilla", "vodka", "whiterum")
DATA$ingredients <- rep(list(NA), nrow(DATA))
DATA$ingredients[[1]] <- c("lime", "soda", "lemon", "pineapple", "cream", "eggwhite", "orange", "grenadine")
head(DATA, n=1)

DATA$pair[[2]] <- c("banana", )
DATA$spirit[[2]] <- c()
