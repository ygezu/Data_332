#Atomic Vectors 

die <- c(1, 2, 3, 4, 5, 6)
die

is.vector(die)

#doubles
double <- c(1, 2, 3, 4, 5)
double 

#integers 
int <- c(-1L, 2L, 4L)
int

#characters 
text <- c("Hello", "World")
text

#logicals 
logic <- c(TRUE, FALSE, TRUE)
logic

3 > 4

#complex and raw
comp <- c(1 + 1i, 1 + 2i, 1 + 3i)
comp

raw(3)

#exercise to create strings
hand <- c("ace", "king", "queen", "jack", "ten")
hand

#attributes 
names(die) <- c("one", "two", "three", "four", "five", "six")

dim(die) <- c(2, 3)

dim(die) <- c(1, 2, 3)

m <- matrix(die, nrow = 2, byrow = TRUE)

ar <- array(c(11:14, 21:24, 31:34), dim = c(2, 2, 3))

#exercise 2
hand1 <- c("ace", "king", "queen", "jack", "ten", "spades", "spades",
           "spades", "spades", "spades")

matrix(hand1, nrow = 5)
matrix(hand1, ncol = 2)
dim(hand1) <- c(5, 2)

#class 
dim(die) <- c(2, 3)
class(die)

#dates & times 
now <- Sys.time()
now
unclass(now)

mil <- 1000000
mil
class(mil) <- c("POSIXct", "POSIXt")
mil

#factors 
gender <- factor(c("male", "female", "female", "male"))

gender <- factor(c("male", "female", "female", "male"))
typeof(gender)
attributes(gender)
unclass(gender)
gender

as.character(gender)

card <- c("ace", "hearts", 1)
card

#coercion 
sum(c(TRUE, TRUE, FALSE, FALSE))

as.character(1)
as.logical(1)
as.numeric(TRUE)

#lists
list1 <- list(100:130, "R", list(TRUE, FALSE))
list1

card <- list("ace", "hearts", 1)
card

#dataframes 
df <- data.frame(face = c("ace", "two", "six"), 
                 suit = c("clubs", "clubs", "clubs"), value = c(1, 2, 3))
df

typeof(df)
class(df)
str(df)

df <- data.frame(face = c("ace", "two", "six"),
                 suit = c("clubs", "clubs", "clubs"), value = c(1, 2, 3),
                 stringsAsFactors = FALSE)

#loading data
head(deck)

#saving data 
write.csv(deck, file = "cards1.csv", row.names = FALSE)



