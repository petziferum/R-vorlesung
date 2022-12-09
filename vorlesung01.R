help(runif)
runif(20)
matrix(runif(20), nrow=4)*100
matrix(runif(20, min=0, max=100), nrow=4)
2^5

aktien<- c(23,27,26,21)
quartal <- c("Q1", "Q2", "Q3", "Q4")
lockdown <- c(TRUE, TRUE, FALSE, FALSE)
df <- data.frame(quartal, aktien, lockdown)
df
df["aktien"] #Eine Spalte aus dem Dataframe auslesen
df$aktien
ls()
rm(aktien.preise) #löschen

subset(df, aktien >= 21 & lockdown == TRUE)

head(df)
View(df)
ncol(df)
nrow(df)

#dem Dataframe eine weitere Spalte hinzufügen
aktien_2 <- c(200, 22, 48, 18)
df_2 <- cbind(df, aktien_2)
df_2


#neue Spalten/Variablen berechnen
avg_aktien <- (df_2$aktien + df_2$aktien_2)/2
avg_aktien


df_2 <- cbind(df_2, avg_aktien)
df_2$avg_aktien <- (df_2$aktien + df_2$aktien_2)/2
df_2

#Spalten auswählen/sortieren

df_2 <- df_2[ , c("avg_aktien", "aktien", "aktien_2", "quartal", "lockdown")]
df_2

data()

head(mtcars) #head zeigt immer nur 6 Zeilen
df <- mtcars
head(df)
View(df)


#Übung 3 Datei --> F:/R/vorlesung/01_R...html

#1 ------------------------
Alter <- c(25,22,26)
Gewicht <- c(85,76,62)
Geschlecht <- c("M","M","F")
Namen <- c("Sam", "Frank", "Anna")

pf <- data.frame(row.names = Namen, Alter, Gewicht, Geschlecht)
pf

pf["Anna", "Alter"] <- NA
pf
mean(pf$Alter)
mean(pf$Alter, na.rm=TRUE)

is.data.frame(pf)
is.na(pf$Alter)

#2 -------------------
print(is.data.frame(mtcars))

#3 ----------------------------------

mat <- matrix(c(1:25), byrow=F, nrow=5)
mat
class(mat)
is.data.frame(mat)

matdf <- as.data.frame(mat)
class(matdf)
matdf
is.data.frame(matdf)


#5------------------------------------
cars <- as.data.frame(mtcars)
cars
head(cars) 

#6 ----------------------------------
mean(cars$mpg)

#7 ---------------------------------
cylinder <- subset(cars, cyl == 6)
cylinder

#8 Wähle die Spalten am, gear, und carb --------------------

cars_view <- c("am", "gear", "carb")
cars[ , cars_view]
cars[ , c("am", "gear", "carb")]
head(cars[ , c("am","gear","carb")])


#9 ---------------------------------
#10 --------------------------------
performance <- cars$hp/cars$wt #Enthält werte aus hp/wt
performance

cars <- cbind(cars, performance)
cars

#Verkürzte form:
cars$performance <- cars$hp/cars$wt

#12 --------------------------------
#Werte in spalte performance werden auf 2 Stellen gerundet
cars$performance <- round(cars$performance, 2)
head(cars)

#------------------------------------------------------------
#13 Was ist der durchschnittliche mpg Wert für Autos mit mehr als 100 PS (en. hp) und einem wt-Wert über 2.5?
#Filter: mit den Eckigen Klammern kann immer ein Filter auf ein Dataframe angewendet werden
cars_ps <- cars[cars$hp > 100 & cars$wt > 2.5, ] #speichert alle Autos mit mehr als 100PS und wt-Wert über 2.5
cars_ps
mean(cars_ps[ , "mpg"]) #Zeige Durchschnittswert der Spalte mpg

mean(cars[cars$hp > 100 & cars$wt > 2.5, "mpg"]) #verkürzte Form


#15 Wie ist der mpg (Verbrauch) des Hornet Sportabout? 
cars["Hornet Sportabout", "mpg"] 


###############################################################################

library(readxl)
install.packages("dplyr")
library(dplyr)
df <- swiss
df
#filtern mit dpyr

filter(df, Fertility >= 60 & Examination > 12)

select(df, Fertility, Examination) #positive Auswahl
head(select(df, -Fertility, -Examination)) #Spalten Ausschliesen

#sortieren
arrange(df, Fertility, Examination)
arrange(df, desc(Fertility))
help(arrange)

#PIPE - Operator (shortcut: str + shift + m) ----------------------------------
set.seed(123)
df %>% filter(Fertility > 80) %>% sample_n(5) %>% arrange(-Examination)


