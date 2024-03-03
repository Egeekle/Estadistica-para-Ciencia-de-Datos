library(datasets)
library(arm)
data=warpbreaks
install.packages('arm')
data

names(data)

data

ls.str(data)

attach(data)

hist(breaks)

mean(breaks, na.rm=FALSE)

poisson.model=glm(breaks~wool+tension,data,family = poisson(link = log))

summary(poisson.model)


poisson.model2=glm(breaks~wool+tension+wool,data=data,family = quasipoisson(link = log))
summary(poisson.model2)


coef1=coef(poisson.model)
coef2=coef(poisson.model2)

se.coef1=se.coef(poisson.model)
se.coef2=se.coef(poisson.model2)

models.both=cbind(coef1,se.coef1,coef2,se.coef2,exponent=exp(coef1))
models.both

rweibull(100,1.5,5000)

rexp(100,1.5)


newdata=data.frame(wool="B",tension='M')
predict(poisson.model2,newdata=newdata,type="response")

installed.packages("jtools")
install.packages("broom")
install.packages("ggstance")


library(jtools)

plot_summs(poisson.model2,scale=TRUE,exp = TRUE)
plot_summs(poisson.model,poisson.model2,scale=TRUE,exp = TRUE)

library(broom)
library(ggstance)
interact_plot(poisson.model2,pred = wool,modx = tension)
cat_plot(poisson.model2,pred = wool,modx = tension)

