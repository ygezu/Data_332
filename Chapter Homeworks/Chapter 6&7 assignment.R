
library(devtools)
parenvs(all = TRUE)

as.environment("package:stats")

globalenv()
baseenv()

#looking up an environements parent 
parent.env(globalenv())

#display object's name 
ls(globalenv())


#The Active Environment 
new 

new <- "Hello Active"
new

roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
}

#Evaluation 
show_env <- function(){
  list(ran.in = environment(),
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}

show_env()

#Objects in a runtime environemnt 
show_env <- function(){
  a <- 1
  b <- 2
  c <- 3
  list(ran.in = environment(),
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}

show_env()

#another object 
foo <- "take me to your runtime"
show_env <- function(x = foo){
  list(ran.in = environment(),
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}
show_env()


#Closure
setup <- function(deck) {
  DECK <- deck
  DEAL <- function() {
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = globalenv())
    card
  }
  SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = globalenv())
  }
  list(deal = DEAL, shuffle = SHUFFLE)
}


setup <- function(deck) {
  DECK <- deck
  DEAL <- function() {
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = parent.env(environment()))
    card
  }
  SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = parent.env(environment()))
  }
  list(deal = DEAL, shuffle = SHUFFLE)
}
cards <- setup(deck)
deal <- cards$deal
shuffle <- cards$shuffle

##CHAPTER 7

#randomly generate 3 symbols 

get_symbols <- function() {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE,
         prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}

get_symbols()

#creating a play function 
play <- function() {
  symbols <- get_symbols()
  print(symbols)
  score(symbols)
}


#Sequential steps 
play <- function() {
  # step 1: generate symbols
  symbols <- get_symbols()
  # step 2: display the symbols
  print(symbols)
  # step 3: score the symbols
  score(symbols)
}

#if statements 
num <- 0

if (num < 0) {
  num <- num * -1
}
num 

num <- -2
if (num < 0) {
  num <- num * -1
}
num

num <- 4
if (num < 0) {
  num <- num * -1
}
num

#else statements 
a <- 1
b <- 1
if (a > b) {
  print("A wins!")
} else if (a < b) {
  print("B wins!")
} else {
  print("Tie.")
}



score <- function(symbols) {
  
  same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
  bars <- symbols %in% c("B", "BB", "BBB")
  
  if (same) {
    payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25,
                 "B" = 10, "C" = 10, "0" = 0)
    prize <- unname(payouts[symbols[1]]) #prize interms of cash
  } else if (all(bars)) {
    prize <- 5 #our assigned price
  } else {

    cherries <- sum(symbols == "C") #cherry count
    prize <- c(0, 2, 5)[cherries + 1]
  }
  # Adjusted for those diamond slots
  diamonds <- sum(symbols == "DD")
  prize * 2 ^ diamonds
}

play()
