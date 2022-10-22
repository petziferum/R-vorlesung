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
mean(pf$Alter)
mean(pf$Alter, na.rm=TRUE)

is.data.frame(pf)
is.na(pf$Alter)

#2 -------------------
print(is.data.frame(mtcars))

#5------------------------------------
cars <- as.data.frame(mtcars)
cars
head(cars) 

#6 ----------------------------------
mean(cars$mpg)

#7 ---------------------------------
cylinder <- subset(cars, cyl == 6)
cylinder

#8 ---------------------------------


#9 ---------------------------------
