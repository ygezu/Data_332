#arithmetic 

1+1

#numbers 100-130

100:130

#Multi-line 

5-
  
1

#Exercise 1 
10 + 2

12 + 3

36 - 6

3/3

#Dice
1:6

#objects 

a <- 5
a + 3

die <- 1:6

my_number <- 1
my_number

#Functions

round(3.1415)

factorial(3)

sample(x = 1:4, size=2)


#The function constructor 
my_function <- function() {}

roll <- function() {
    die <- 1:6
    dice <- sample(die, size = 2, replace = TRUE)
    sum(dice)
}

roll()

#Arguments 

roll2 <- function(bones) {
    dice <- sample(bones, size = 2, replace = TRUE)
    sum(dice)
}

roll2(bones = 1:20)






