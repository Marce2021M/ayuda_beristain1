install.packages("lsr")
library(lsr)

dat <- read.csv("FIFA_WC_Russia_DB.csv" , header = TRUE)
View(dat)
#Limpieza de Datos
typeof(dat$Country) #character
dat$Country <- as.factor(dat$Country)
typeof(dat$Country)
dat$Mkt_Value_per_player <- as.numeric(dat$Mkt_Value_per_player)

#Modelos de Regresion
#numero de victorias 
modelo1 <- lm(dat$Games_Won ~ Mkt_Value_per_player + Mkt_Value + Bets + Player_Age + Player_Height + Coach_Wage + Goals_For + Goals_Against + Invested_Money, data = dat)
summary(modelo1)
standardCoefs(modelo1)
plot(modelo1)

modelo2 <- lm(dat$Games_Won ~ Goals_For + Goals_Against + Player_Age + Player_Height, data = dat)
summary(modelo2)
standardCoefs(modelo2)

