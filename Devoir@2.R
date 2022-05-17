#Devoir de manipulation
# Ingrid Jacquet, code JA184143

#Appel aux bibliotheques dont j'aurai besoin

library(tidyverse)
library(funModeling)
library(dplyr)
library(nlme)
library(xlsx)
library(lubridate)
library(openxlsx)
library(data.table)



# Importation des donnees depuis le lien url
library(readxl)
url <- "https://www.brh.ht/wp-content/uploads/agregatsmon.xls"
destfile <- "agregatsmon.xls"
curl::curl_download(url, destfile)
agregatsmon <- read_excel(destfile)


#Je determine la classe de agregatsmon
class(agregatsmon)

#J'insere la ligne comportant les noms des colonnes, autrement dit je renome ma 1ere ligne
colnames(agregatsmon)<-agregatsmon[2,]

#Creation d'un objet comportant les donnes d'octobre 1990 jusqu'au dernier mois de disponibilite
df1<-agregatsmon
view(df1)
df<-df1[147:521,]
str(df)
view(df)
class(df)


#Suppression des colonnes inutiles
#Pour cela, j'ai cree deux objets df2 et df3

df2<-df[,-c(5,9,11,15,20,23,25,30,35,42,47)]
view(df2)
df3 <-df2[, -c(31,45)]
view(df3)

#Tentative pour changer le format des dates
df4<-agregatsmon[,1]
view(df4)
df4<- as.Date("1990-10", format="%m-%Y")
view(df4)


#Creation de nouveaux objets pour mieux manipuler les elements necessaires au calcul du taux de change
df5<-df3[,7]
df6<- df3[,17]
class(df5)

#tentative pour calculer les statistiques demandees
Calcul <- lm(TAUX DE CHANGE BRH ~ M3 + Reserves nettes de change, data= df3)

summary(df3)

