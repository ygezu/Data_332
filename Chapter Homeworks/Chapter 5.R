#Changing Values in Place 
setwd("~/Desktop/R (DATA 332)")

deck <- read.csv("deck.csv")

shuffle <- function(cards) {
  random <- sample(1:52, size = 52)
  cards[random, ]
}

head(deck)


vec <- c(0, 0, 0, 0, 0, 0)
vec

vec[1] <- 1000
vec

vec[c(1, 3, 5)] <- c(1, 1, 1)
vec

vec[4:6] <- vec[4:6] + 1
vec

vec[7] <- 0
vec

#Logical Subsetting 
vec[c(FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE)]

#Logical Testing 
1 %in% c(3, 4, 5)

c(1, 2) %in% c(3, 4, 5)

c(1, 2, 3) %in% c(3, 4, 5)

#Exercise 1
deck4 <- deck
deck4$value <- 0
head(deck4, 13)

deck4$value[deck4$suit == "hearts"]
deck4$value[deck4$suit == "hearts"] <- 1
deck4$value[deck4$suit == "hearts"]

deck4[deck4$face == "queen", ]
deck4[deck4$suit == "spades", ]

#Boolean Operations 
a <- c(1, 2, 3)
b <- c(1, 2, 3)
c <- c(1, 2, 4)

a == b
a == b & b == c


deck4$face == "queen" & deck4$suit == "spades" #locating queen of spades 
queenOfSpades <- deck4$face == "queen" & deck4$suit == "spades"
deck4$value[queenOfSpades] <- 13

#Exercise 2
w <- c(-1, 0, 1)
x <- c(5, 15)
y <- "February"
z <- c("Monday", "Tuesday", "Friday")


w > 0
10 < x & x < 20
y == "February"
all(z %in% c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday",
             "Saturday", "Sunday"))

# Missing Information
1 + NA

NA == 1

# na.rm will ignore NA values
mean(c(NA, 1:50), na.rm = TRUE)

is.na(NA) 
vec <- c(1, 2, 3, NA)
is.na(vec)

















