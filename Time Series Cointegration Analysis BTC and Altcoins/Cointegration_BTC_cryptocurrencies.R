#install.packages("readxl")
#install.packages("urca")
#install.packages("ggplot2")
#install.packages("forecast")
#install.packages("lmtest")
#install.packages("egcm")
#install.packages("vars")

library(readxl)
library(urca)
library(ggplot2)
library(forecast)
library(lmtest)
library(egcm)
library(vars)

Data <- read_excel("C:/Users/sebas/Documents/PUCE/4to Semestre/Aprendizaje estadistico/Trabajo Final/Data.xlsx")

x1 <-ts(Data$BTC, start = c(2023, 8, 5), frequency = 53)
y1 <-ts(Data$SOL, start = c(2023, 8, 5), frequency = 53)
y2 <-ts(Data$ADA, start = c(2023, 8, 5), frequency = 53)
y3 <-ts(Data$BNB, start = c(2023, 8, 5), frequency = 53)

# Obtenemos los principales descriptivos para cada variable
summary(x1)
summary(y1)
summary(y2)
summary(y3)

#Analisamos cada cryptomoneda
bdd1=cbind(y1,x1)
bdd2=cbind(y2,x1)
bdd3=cbind(y3,x1)
plot(bdd1) # Todas las series son no estacionarias se usa SOLANA para mostrar
plot(diff(bdd1)) #Todas las series parecen estacionarias de orden I(1) se usa SOLANA para mostrar


## Graficos del resto de series
plot(bdd2) 
plot(diff(bdd2))
plot(bdd3) 
plot(diff(bdd3))

#Analizamos el orden de las series
summary(ur.df(x1, type="trend", selectlags="AIC")) #none, #drift
summary(ur.df(diff(x1), type="none", selectlags="AIC")) #none, #drift

summary(ur.df(y1, type="trend", selectlags="AIC")) #none, #drift
summary(ur.df(diff(y1), type="none", selectlags="AIC")) #none, #drift

summary(ur.df(y2, type="trend", selectlags="AIC")) #none, #drift
summary(ur.df(diff(y2), type="none", selectlags="AIC")) #none, #drift

summary(ur.df(y3, type="trend", selectlags="AIC")) #none, #drift
summary(ur.df(diff(y3), type="none", selectlags="AIC")) #none, #drift

#Las series son integradas I(1)
#Probamos si están cointegradas, hacemos su modelo de regresion lineal

#Para SOLANA
m1 <- lm(y1~x1, data=bdd1)
summary(m1)

r1 <- m1$residuals

r1 %>% ggtsdisplay(main="")

ur.df(r1, type="none", lags=0) #Al ser mayor a 2 rechazamos la hipotesis nula sugiriendo que hay cointegracion entre las 2 variables

#Para CARDANO
m2 <- lm(y2~x1, data=bdd2)
summary(m2)

r2 <- m2$residuals

r2 %>% ggtsdisplay(main="")

ur.df(r2, type="none", lags=0) #Al ser mayor a 2 rechazamos la hipotesis nula sugiriendo que hay cointegracion entre las 2 variables

#Para BNB
m3 <- lm(y3~x1, data=bdd3)
summary(m3)

r3 <- m3$residuals

r3 %>% ggtsdisplay(main="")

ur.df(r3, type="none", lags=0) #Al ser mayor a 2 rechazamos la hipotesis nula sugiriendo que hay cointegracion entre las 2 variables


# Usamos pruebas de raiz unitaria mas robustas para residuos
test1 <- ca.jo(data.frame(y1, x1), type = "trace", ecdet = "none")
summary(test1)

test2 <- ca.jo(data.frame(y2, x1), type = "trace", ecdet = "none")
summary(test2)

test3 <- ca.jo(data.frame(y3, x1), type = "trace", ecdet = "none")
summary(test3)




