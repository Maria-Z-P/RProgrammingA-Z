#### Kirill Eremenko. R Programming A-Z: R For Data Science With Real Exercises!

####################
### Sekcja 1: Hit The Ground Running
####################

mydata <- read.csv(file.choose())   # P2-Mispriced-Diamonds.csv

# install.packages("ggplot2")
library(ggplot2)

ggplot(data = mydata[mydata$carat < 2.5, ],
       aes(x = carat, y = price, colour = clarity)) +
  geom_point(alpha = 0.1) +
  geom_smooth(method = "gam")

####################
### Sekcja 2: Core Programming Principles
####################

# petla while

counter <- 1
while(counter < 5){
  print(counter)
  counter <- counter + 1
}

# petla for

for(i in 1:5){
  print("Hello")
  i <- i + 1
}

# instrukcja if
# roznica pomiedzy nesting i chaining

rm(answer)     # remove
x <- rnorm(1)  # zmienna losowa
if(x > 1){
  answer <- "Greater than 1"
} else{
  
  if(x >= -1){
    answer <- "Between -1 and 1"
  } else{
    answer <- "Less than -1"
  }
  
}
print(answer)

# powyzsze zagniezdzenie nie jest korzystne
# lepiej stosowac wyrazenie lancuchowe:

rm(answer)
x <- rnorm(1)
if(x > 1){
  answer <- "Greater than 1"
} else if(x >= -1){
  answer <- "Between -1 and 1"
} else{
  answer <- "Less than -1"
}
print(answer)


# HOMEWORK

N <- 10000
counter <- 0
for(i in rnorm(N)){
  if(i >= -1 & i <= 1){
    counter <- counter + 1
  }
}
answer <- counter/N
answer

####################
### Sekcja 3: Fundamentals Of R
####################

# Nawet pojedyncza liczba przechowywana jest w R jako wektor 
# (wektor o dlugosci 1)

MyFirstVector <- c(3, 45, 82, 118)   # c as combine
is.numeric(MyFirstVector)
is.integer(MyFirstVector)
is.double(MyFirstVector)

V2 <- c(3L, 12L, 34L)  # L jezeli chcemy miec zmienna typu integer a nie double
is.numeric(V2)
is.integer(V2)
is.double(V2)

V3 <- c("a", "a3", 7)    # 7 jest tu zmienna tekstowa

# W wektorze mozna umieszczac tylko obiekty tego samego typu

is.numeric(V3)
is.character(V3)


seq() # sequence - like ":"
rep() # replicate

seq(1, 15)
1:15

seq(1, 15, 2)

rep(3, 10)

x <- c(1, 5)
rep(x, 3)

w<-c("a","b","c","d","e")
w[1]
w[-1]
w[1:3]
w[c(1, 3, 5)]
w[c(-2, -4)]
w[-3:-5]


# R jest wektoryzowanym jezykiem programowania:

a = c(1, 2, 3); b = rep(1, 3); c = rep(1, 6)
a + b
a + c

x <- rnorm(5)
x

# R specific programming loop
for(i in x){
  print(i)
}
# conventional programming loop
for(j in 1:5){
  print(x[j])
}

?paste()     # ? - wywolanie pomocy

# paste -> concatenate vectors after converting to character 

paste("Hello","John")
paste("1st", "2nd", "3rd", sep = ", ")

x <- c("a","b","c")
rep(x, each = 3)

## Homework ##

# SPRAWOZDANIE FINANSOWE

# Data

revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 
             9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 
              5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

# Solution
# profit -> zysk, dochod; revenue -> przychod; profit margin -> marza zysku

profit <- revenue - expenses
profit

tax <- round(.30*profit)
tax

profitAfterTax <- profit - tax
profitAfterTax                 # zysk netto

profitMargin <- round(profitAfterTax/revenue, 2) * 100
profitMargin

mean_pAT <- mean(profitAfterTax)
mean_pAT

goodMonths <- profitAfterTax > mean_pAT
goodMonths

badMonths <- !goodMonths
badMonths

bestMonth <- profitAfterTax == max(profitAfterTax)
bestMonth

worstMonth <- profitAfterTax == min(profitAfterTax)
worstMonth

# Convert All Calculations To Units Of One Thousand Dollars

revenue.1000 <- round(revenue/1000, 0)
expenses.1000 <- round(expenses/1000, 0)
profit.1000 <- round(profit/1000, 0)
profit.after.tax.1000 <- round(profitAfterTax/1000, 0)

M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profitMargin,
  goodMonths,
  badMonths,
  bestMonth,
  worstMonth
)
print(M)

####################
### Sekcja 4: Matrices
####################

# Matrices
my.data <- 1:20
my.data

?matrix
A <- matrix(my.data, 4, 5)
A
A[2, 3]

B <- matrix(my.data, 4, 5, byrow = T)
B
B[2, 5]

r1 <- c("I","am","happy")
r2 <- c("What","a","day")
r3 <- c(1, 2, 3)
C <- rbind(r1, r2, r3)
C

c1 <- 1:5
c2 <- -1:-5
D <- cbind(c1,c2)
D

# Named Vectors
x <- 1:5; y <- 1:5
x
x[4]
names(x)
# give names
names(y) <- c("a","b","c","d","e")
y
y["d"]
# clear names
names(y) <- NULL
names(y)
y["d"]
y[4]

# Naming Matrix Dimensions 1
rownames(D) <- 101:105
colnames(D) <- c("A","B")
D
D["103","B"]

# Po wczytaniu danych z s4-BasketballData.R odpowiadamy:
# ile bramek w grze przypada na kazdego gracza?

FieldGoals
Games
FieldGoals / Games
round(FieldGoals / Games, 1)
round(MinutesPlayed / Games)

# Po przetransponowaniu macierzy FieldGoals/Games, korzystamy
# z funkcji matplot, ktora plotuje kolumnami

FG <- t(FieldGoals/Games)
round(FG, 1)
matplot(FG, type="b", pch=15:18, col=c(1:4,6))
legend("topright", inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)
# dokladnosc graczy
FGA <- t(FieldGoals/FieldGoalAttempts)
matplot(FGA, type="b", pch=15:18, col=c(1:4,6))
legend("topright", inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)

matplot(t(Salary), type="b", pch=15:18, col=c(1:4,6))
matplot(t(Salary/Points), type="b", pch=15:18, col=c(1:4,6))
legend("topleft", inset=0.01, legend=Players, col=c(1:4,6), pch=15:18 ,horiz=F)
matplot(t(Points/Games), type="b", pch=15:18, col=c(1:4,6))
matplot(t(Points/MinutesPlayed), type="b", pch=15:18, col=c(1:4,6))
matplot(t(Points), type="b", pch=15:18, col=c(1:4,6))

# Podzbiory (Subsets)
x <- 1:5
x[c(1,5)]

Games
Games[1:3,6:10]
Games[c(1,10), ]
Salary[c(1,10), ]
Points[c(1,10), ]
Points[1,]     # otrzymamy wektor
Points[1, 1]   # otrzymamy wektor
is.matrix(Points[1, ])
is.vector(Points[1, ])
Points[1, , drop=F]   # otrzymamy ta sama klase obiektow co w oryginale
is.matrix(Points[1, , drop=F])

# Wizualizowanie podzbiorow
matplot(t(MinutesPlayed), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6), pch=15:18,
       horiz=F)
Data <- MinutesPlayed[1:3,]
matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1:3], col=c(1:4,6), pch=15:18,
       horiz=F)
Data <- MinutesPlayed[1, , drop=F]
matplot(t(Data), type="b", pch=15:18, col=c(1:4,6))

# Funkcje

myplot <- function(){
  dane <- MinutesPlayed[2:7, c(1,5,10)]
  matplot(t(dane), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[2:7], col=c(1:4,6), pch=15:18,
         horiz=F)
}
myplot()

myplot2 <- function(rows, columns){
  dane <- MinutesPlayed[rows, columns, drop=F]
  matplot(t(dane), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6), pch=15:18,
         horiz=F)
}
myplot2(2:8, c(1,3,5,7,10))

myplot3<-function(data, rows, columns){
  matplot(t(data[rows, columns, drop=F]), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6), pch=15:18,
         horiz=F)
}
myplot3(Games, c(3:5,7),)
myplot3(MinutesPlayed, c(3:5,7),)
myplot3(Points, c(3:5,7),)

matplot(t(Salary[c(3:5,7),]), type="b", pch=15:18, col=c(1:4,6))
legend("bottomright", inset=0.01, legend=Players[c(3:5,7)], col=c(1:4,6), 
       pch=15:18, horiz=F)

myplot4 <- function(data, rows=1:10, columns=1:10){    
  # z niektorymi ustawieniami domyslnymi, czyli obligatoryjna jest tylko data
  matplot(t(data[rows, columns, drop=F]), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows] ,col=c(1:4,6), pch=15:18,
         horiz=F)
}
myplot4(Games)
myplot4(Games,1:5)
myplot4(Games, columns=5:10)
myplot4(Games,1)

myplot5 <- function(data, rows=1:10){ 
  Dane <- data[rows, , drop=F]
  matplot(t(Dane), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6), pch=15:18,
         horiz=F)
}
myplot5(Games, 1:5)

# Styl grania zawodnikow

myplot5(Points/FieldGoals)

## Homework ##

# RZUTY WOLNE
# Wczytuje dane z pliku Section4-Homework-Data.R


#Matrix for Free Throws
#Bind the given vectors to form the matrix
FreeThrows <- rbind(KobeBryant_FT, JoeJohnson_FT, LeBronJames_FT, 
                    CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, 
                    ChrisPaul_FT, KevinDurant_FT, DerrickRose_FT, DwayneWade_FT)
#Remove vectors - we don't need them anymore
rm(KobeBryant_FT, JoeJohnson_FT, CarmeloAnthony_FT, DwightHoward_FT, 
   ChrisBosh_FT, LeBronJames_FT, ChrisPaul_FT, DerrickRose_FT, DwayneWade_FT, 
   KevinDurant_FT)
#Rename the columns
colnames(FreeThrows) <- Seasons
#Rename the rows
rownames(FreeThrows) <- Players

#Check the matrix
FreeThrows

#Matrix for Free Throw Attempts
#Bind the given vectors to form the matrix
FreeThrowAttempts <- rbind(KobeBryant_FTA, JoeJohnson_FTA, LeBronJames_FTA, 
                           CarmeloAnthony_FTA, DwightHoward_FTA, ChrisBosh_FTA, 
                           ChrisPaul_FTA, KevinDurant_FTA, DerrickRose_FTA, 
                           DwayneWade_FTA)
#Remove vectors - we don't need them anymore
rm(KobeBryant_FTA, JoeJohnson_FTA, CarmeloAnthony_FTA, DwightHoward_FTA, 
   ChrisBosh_FTA, LeBronJames_FTA, ChrisPaul_FTA, DerrickRose_FTA, 
   DwayneWade_FTA, KevinDurant_FTA)
#Rename the columns
colnames(FreeThrowAttempts) <- Seasons
#Rename the rows
rownames(FreeThrowAttempts) <- Players

#Check the matrix
FreeThrowAttempts

#Re-create the plotting function
myplot <- function(z, who=1:10) {
  matplot(t(z[who,,drop=F]), type="b", pch=15:18, col=c(1:4,6), 
          main="Basketball Players Analysis")
  legend("bottomleft", inset=0.01, legend=Players[who], col=c(1:4,6), 
         pch=15:18, horiz=F)
}

#Visualize the new matrices
myplot(FreeThrows)
myplot(FreeThrowAttempts)

#Part 1 - Free Throw Attempts Per Game 
#(You will need the Games matrix)
myplot(FreeThrowAttempts/Games)
#Notice how Chris Paul gets few attempts per game

#Part 2 - Free Throw Accuracy
myplot(FreeThrows/FreeThrowAttempts)
#And yet Chris Paul's accuracy is one of the highest
#Chances are his team would get more points if he had more FTA's
#Also notice that Dwight Howard's FT Accuracy is extremely poor
#compared to other players. If you recall, Dwight Howard's
#Field Goal Accuracy was exceptional:
myplot(FieldGoals/FieldGoalAttempts)
#How could this be? Why is there such a drastic difference?
#We will see just now...

#Part 3 - Player Style Patterns Excluding Free Throws
myplot((Points-FreeThrows)/FieldGoals)
#Because we have excluded free throws, this plot now shows us
#the true representation of player style change. We can verify
#that this is the case because all the marks without exception
#on this plot are between 2 and 3. That is because Field Goals
#can only be for either 2 points or 3 points.
#Insights:
#1. You can see how players' preference for 2 or 3 point shots
#   changes throughout their career. We can see that almost all
#   players in this dataset experiment with their style throughout
#   their careers. Perhaps, the most drastic change in style has
#   been experienced by Joe Johnson.
#2. There is one exception. You can see that one player has not
#   changed his style at all - almost always scoring only 2-pointers.
#   Who is this mystert player? It's Dwight Howard! 
#   Now that explains a lot. The reason that Dwight Howard's
#   Field Goal accuracy is so good is because he almost always
#   scores 2-pointers only. That means he can be close to the basket
#   or even in contact with it. Free throws, on the other hand require
#   the player to stand 15ft (4.57m) away from the hoop. That's 
#   probably why Dwight Howard's Free Throw Accuracy is poor.

####################
### Sekcja 5: Data Frames
####################

# Data Frames - ramki danych, podobnie jak macierze sa dwuwymiarowe,
# ale moga zawierac dane roznych typow

# Analiza trendow demograficznych - statystyki urodzen i statystyki korzystania
# z Internetu w roznych krajach
# wskaznik urodzen - liczba nowych ludzi na 1000 osob
# uzytkownicy Internetu w procentach

# ---------------------------------------- Importing data
# Method 1: Select The File Manually

stats <- read.csv(file.choose())    # P2-Demographic-Data.csv
stats

# Method 2: Set WD (working directory) and Read Data (from there)

getwd()
setwd("C:/Maja/M/R Programming")
stats <- read.csv("P2-Demographic-Data.csv")

# ---------------------------------------- Exploring data
stats
nrow(stats)
ncol(stats)
head(stats)
tail(stats)
head(stats, n = 10)
str(stats)   # structure str()  ------ runif() (r as random), rnorm()
summary(stats)

# ---------------------------------------- Using the $ sign
head(stats)
stats[3,3]
stats[3,"Birth.rate"]
stats$Internet.users    # to samo: stats[,"Internet.users"]
head(factor(stats$Income.Group))   # levels(stats$Income.Group)

# ---------------------------------------- Basic Operations with a DF
stats[1:10, ]  # subsetting
stats[c(4,100), ]

# Remember how the [] work:

is.data.frame(stats[1, ])  # no need for drop=F
is.data.frame(stats[, 1])
stats[, 1, drop=F]          # wymiar nie zostanie uproszczony
is.data.frame(stats[, 1, drop=F])

# multiply columns

stats$Birth.rate*stats$Internet.users  # wektor mnozony jest przez wektor

# add column

stats$MyCalc <- stats$Birth.rate*stats$Internet.users

# test of knowledge

stats$xyz <- 1:5        # remember about recycling of vectors
head(stats, n = 12)

# remove a column

stats$xyz <- NULL
stats$MyCalc <- NULL

# ---------------------------------------- Filtering a DF
filter <- stats$Internet.users < 2
stats[filter, ]

stats[stats$Birth.rate > 40, ]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2, ]
stats[stats$Income.Group == "High income", ]
stats[stats$Country.Name == "Malta", ]

# ---------------------------------------- qplot()
# install.packages("ggplot2")
library(ggplot2)

qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3), colour=I("blue")) 
# lub color (British)
qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot")

qplot(data=stats, x=Internet.users, y=Birth.rate, color=Income.Group, size=I(5))

# ---------------------------------------- Building a DF
# Wczytuje dane z pliku CountryRegionVectors.R, a nastepnie:

mydf <- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
head(mydf)
colnames(mydf) <- c("Country","Code","Region")
head(mydf)
# mozna to zrobic inaczej
rm(mydf)
mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset,
                   Region=Regions_2012_Dataset)
head(mydf)
tail(mydf)
summary(mydf)   # dobrze jest przejrzec dane i sprawdzic

# ---------------------------------------- Merging Data Frames (laczenie)
head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x="Country.Code", by.y="Code")
head(merged)

merged$Country <- NULL
str(merged)

# ---------------------------------------- qplot() Part2
# Shapes

qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, size=I(4),
      shape=I(19))

# Transparency

qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, size=I(4),
      shape=I(19), alpha=I(0.6))

# Title

qplot(data=merged, x=Internet.users, y=Birth.rate, color=Region, size=I(4),
      shape=I(19), alpha=I(0.6), main="Birth Rate vs Internet Users")

## Homework ##

# Wczytuje dane z pliku CountryLife_Expectancy.R, a nastepnie:

######
# fertility - plodnosc
######

setwd("C:/Maja/M/R Programming")
stats <- read.csv("P2-Section5-Homework-Data.csv")
head(stats)
str(stats)
data1960 <- stats[stats$Year == "1960",]
data2013 <- stats[stats$Year == "2013",]
str(data1960)
str(data2013)
LE1960 <- data.frame(Country_Code, Life.Exp=Life_Expectancy_At_Birth_1960)
head(LE1960)
LE2013 <- data.frame(Country_Code, Life.Exp=Life_Expectancy_At_Birth_2013)
head(LE2013)

Dane1960 <- merge(data1960, LE1960, by.x="Country.Code", by.y="Country_Code")
Dane2013 <- merge(data2013, LE2013, by.x="Country.Code", by.y="Country_Code")
head(Dane1960)
head(Dane2013)

library(ggplot2)

qplot(data=Dane1960, x=Fertility.Rate, y=Life.Exp, color=I("blue"), size=I(4),
      shape=I(19), alpha=I(0.6))
qplot(data=Dane1960, x=Fertility.Rate, y=Life.Exp, color=Region, size=I(4),
      shape=I(19), alpha=I(0.6), main="Life Expectancy vs Fertility (1960)")

qplot(data=Dane2013, x=Fertility.Rate, y=Life.Exp, color=I("red"), size=I(4),
      shape=I(19), alpha=I(0.6))
qplot(data=Dane2013, x=Fertility.Rate, y=Life.Exp, color=Region, size=I(4),
      shape=I(19), alpha=I(0.6), main="Life Expectancy vs Fertility (2013)")

####################
### Sekcja 6: Advanced Visualization With GGPlot2
####################

getwd()
setwd("C:/Maja/M/R Programming")
getwd()

movies <- read.csv("P2-Movie-Ratings.csv")
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating",
                      "BudgetMillions", "Year")
head(movies)                # genre - gatunek
tail(movies)
str(movies)
summary(movies)

# przekonwertowanie int (numeric variable) na factor:

factor(movies$Year)
movies$Year <- factor(movies$Year)
summary(movies)

#---------------- Aestetics (estetyka)
library(ggplot2)

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

# add geometry
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) + 
  geom_point()

# add colour
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre)) + 
  geom_point()

# add size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, 
                        size=Genre)) + 
  geom_point()

# add size - better way
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre,
                        size=BudgetMillions)) + 
  geom_point()

#---------------- Plotting with Layers
p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre,
                             size=BudgetMillions))
p

# points
p + geom_point()

# lines
p + geom_line()

# multiple layers
p + geom_point() + geom_line()
p + geom_line() + geom_point()

#---------------- Overriding Aestetics (override - nadpisac)
q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre,
                             size=BudgetMillions))
# add geom layer
q + geom_point()

# overriding aes
q + geom_point(aes(colour=BudgetMillions))

q + geom_point(aes(x=BudgetMillions)) +
  xlab("Budget Millions $$$")                          # plot01
# reduce line size
p + geom_line(size=1) + geom_point()

q + geom_point(aes(x=BudgetMillions, y=CriticRating)) +
  xlab("Budget Millions $$$") + ylab("CriticRating")   # plot02
## Export, Save as Image...

#---------------- Mapping vs Setting
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r
r + geom_point()

# Add colour
#1. Mapping (what we've done so far):

r + geom_point(aes(colour=Genre))

#2. Setting:

r + geom_point(colour="Red")

# ERROR:
# r + geom_point(aes(colour="Red"))

#---------------- Histograms and Density Charts
s <- ggplot(data=movies, aes(x=BudgetMillions))
s
s + geom_histogram(binwidth=5)

# add colour
s + geom_histogram(binwidth=5, fill="Green")
s + geom_histogram(binwidth=5, aes(fill=Genre))
# add a border
s + geom_histogram(binwidth=5, aes(fill=Genre), colour="Black")   # plot03

# sometimes we need density charts:
s + geom_density()
s + geom_density(aes(fill=Genre), position="stack")   # stack - stos; sterta
# plot03b

#---------------- Starting Layer Tips
t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth=10, fill="White", colour="Black")
# another way:
t <- ggplot(data=movies)
t + geom_histogram(binwidth=10,
                   aes(x=AudienceRating),
                   fill="White", colour="Black")   # plot04

t + geom_histogram(binwidth=10,
                   aes(x=CriticRating),
                   fill="White", colour="Black")   # plot05

t <- ggplot()  # skeleton plot - calkiem pusty plot, aby potem go wypelnic juz
# innymi danymi
t

#---------------- Statistical Transformations
?geom_smooth  # bedzie mozna obserwowac trendy

u <- ggplot(data=movies,aes(x=CriticRating, y=AudienceRating, colour=Genre))
u
u + geom_point() + geom_smooth(fill=NA)   # NA - czyli bez wypelnienia
# plot05b

# boxplots

u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()

# tip / hack:

u + geom_boxplot(size=1.2) + geom_jitter()

# another way:

u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.6)   # plot06

#---------------- Using Facets (facet - aspekt)
# histograms

v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")
# facets:
v + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
  facet_grid(Genre~.,scale="free")   # wiersze

v + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
  facet_grid(.~Genre,scale="free")   # kolumny

# scatterplots   (scatter - rozrzucac) (scatterplot - wykres punktowy)

w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))
w + geom_point(size=3)

# facets:
w + geom_point(size=3) + facet_grid(Genre~.)
w + geom_point(size=3) + facet_grid(.~Year)
w + geom_point(size=3) + facet_grid(Genre~Year)
w + geom_point(size=3) + geom_smooth() +
  facet_grid(Genre~Year)
w + geom_point(aes(size=BudgetMillions)) + geom_smooth() +
  facet_grid(Genre~Year)

#---------------- Coordinates
# limits
# zoom

m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             size=BudgetMillions,
                             colour=Genre))
m + geom_point()

m + geom_point() +
  xlim(50, 100) +
  ylim(50, 100)

# won't work well always:
n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
  ylim(0, 50)

# instead - zoom:
n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
  coord_cartesian(ylim=c(0, 50))

# improve w
w + geom_point(aes(size=BudgetMillions)) + 
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0, 100))              # plot07

#---------------- Theme

o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth=5, aes(fill=Genre), colour="Black")
h

# axes labels
h + 
  xlab("Money Axis") +
  ylab("Number of Movies")

# label formatting
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x=element_text(colour="Green", size=20),
        axis.title.y=element_text(colour="Red", size=20))

# mark formatting
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x=element_text(colour="Green", size=20),
        axis.title.y=element_text(colour="Red", size=20),
        axis.text.x=element_text(size=15),
        axis.text.y=element_text(size=15))

# legend formatting
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x=element_text(colour="Green", size=20),
        axis.title.y=element_text(colour="Red", size=20),
        axis.text.x=element_text(size=15),
        axis.text.y=element_text(size=15),
        
        legend.title=element_text(size=20),
        legend.text=element_text(size=15),
        legend.position=c(1, 1),      # prawy, gorny
        legend.justification=c(1, 1))

# title
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x=element_text(colour="Green", size=20),
        axis.title.y=element_text(colour="Red", size=20),
        axis.text.x=element_text(size=15),
        axis.text.y=element_text(size=15),
        
        legend.title=element_text(size=20),
        legend.text=element_text(size=15),
        legend.position=c(1, 1),      # prawy, gorny
        legend.justification=c(1, 1),
        
        plot.title=element_text(colour="DarkBlue",
                                size=30,
                                family="Courier"))   # plot08


best<-movies[movies$CriticRating > 80 & movies$AudienceRating > 80,]
best
nrow(best)
ggplot(data=best, aes(x=CriticRating, y=AudienceRating)) +
  geom_point(aes(colour=Genre))

## Homework ##

# Import the Data

getwd()
setwd("C:/Maja/M/R Programming")
mov <- read.csv("Section6-Homework-Data.csv")

# Data Exploration

head(mov)    # top rows
str(mov)     # column summaries
summary(mov) # structure of the dataset

# Activate GGPlot2
#install.packages("ggplot2")

library("ggplot2")

#{Offtopic} This Is A Cool Insight:

ggplot(data=mov, aes(x=Day.of.Week)) + geom_bar()

#Notice? No movies are released on a Monday. Ever.

# Now we need to filter our dataset to leave only the 
# Genres and Studios that we are interested in
# We will start with the Genre filter and use the Logical 'OR'
# operator to select multiple Genres:

filt <- (mov$Genre == "action") | (mov$Genre == "adventure") | 
  (mov$Genre == "animation") | (mov$Genre == "comedy") | (mov$Genre == "drama")

# Now let's do the same for the Studio filter:

#filt2 <- (mov$Studio == "Buena Vista Studios") | (mov$Studio == "WB") | 
# (mov$Studio == "Fox") | (mov$Studio == "Universal") | (mov$Studio == "Sony") | 
# (mov$Studio == "Paramount Pictures")

# or:

filt2 <- mov$Studio %in% c("Buena Vista Studios","WB","Fox","Universal","Sony",
                           "Paramount Pictures")

# Apply the row filters to the dataframe

mov2 <- mov[filt & filt2,]

# Prepare the plot's data and aes layers
# Note we did not rename the columns. 
# Use str() or summary() to find out the correct column names

p <- ggplot(data=mov2, aes(x=Genre, y=Gross...US))

p  # Nothing happens. We need a geom.

# Add a Point Geom Layer

p + 
  geom_point()

# Add a boxplot instead of the points

p + 
  geom_boxplot()

# Notice that outliers are part of the boxplot layer
# We will use this observation later (*)

# Add points

p + 
  geom_boxplot() + 
  geom_point()

# Not what we are after

# Replace points with jitter

p + 
  geom_boxplot() + 
  geom_jitter()

# Place boxplot on top of jitter

p + 
  geom_jitter() + 
  geom_boxplot() 

# Add boxplot transparency

p + 
  geom_jitter() + 
  geom_boxplot(alpha=0.7) 

# Good. Now add size and colour to the points:

p + 
  geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha=0.7)

# See the remaining black points? Where are they from?
# They are part of the boxplot - Refer to our observation (*) above 

# Let's remove them:

p + 
  geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha = 0.7, outlier.colour = NA) 

# Let's "Save" our progress by placing it into a new object:

q <- p + 
  geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha = 0.7, outlier.colour = NA) 
q

# Non-data ink

q <- q +
  xlab("Genre") +                      # x axis title
  ylab("Gross % US") +                 # y axis title
  ggtitle("Domestic Gross % by Genre") # plot title
q

# HINT: for the next part use ?theme if you need to 
# refresh which parameters are responsible for what

# Theme

q <- q + 
  theme(
    #this is a shortcut to alter ALL text elements at once:
    text = element_text(family="Comic Sans MS"),
    
    #Axes titles:
    axis.title.x = element_text(colour="Blue", size=20),
    axis.title.y = element_text(colour="Blue", size=20),
    
    #Axes texts:
    axis.text.x = element_text(size=10),
    axis.text.y = element_text(size=10),  
    
    #Plot title:
    plot.title = element_text(colour="Black",
                              size=30),
    
    #Legend title:
    legend.title = element_text(size=10),
    
    #Legend text
    legend.text = element_text(size=9)
  )
q

# Final touch. We haven't discussed this in the course,
# However this is how you can change individual legend titles:

q$labels$size = "Budget $M"
q                                        # plot09

# Well done!