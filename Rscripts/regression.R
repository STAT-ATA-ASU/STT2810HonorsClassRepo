## 4/13/17

head(mtcars)
# Develop a model to predict mpg

cor(mtcars)
#
mod1 <- lm(mpg ~ wt, data = mtcars)
plot(mod1)
# Base R
plot(mpg ~ wt, data = mtcars)
abline(mod1)
# GGplot2
library(ggplot2)
ggplot(data = mtcars, aes(x = wt, y = mpg)) + 
  geom_point() + 
  theme_bw()
##
g1 <- ggplot(data = mtcars, aes(x = wt, y = mpg, color = cyl, size = disp)) + 
  geom_point() + 
  theme_bw() +
  geom_smooth(method = "lm", se = FALSE)
g1
##
summary(mod1)
resid(mod1)
## Interactivity
library(plotly)
g2 <- ggplotly(g1)
g2
# detach plotly
detach("package:plotly", unload=TRUE)
library(MASS)
stepAIC(lm(mpg ~ ., data = mtcars), method = "backwards")
mod2 <- lm(mpg ~ wt + qsec + am, data = mtcars)
summary(mod2)
plot(mod2, which = 1)
##
library(car)
residualPlots(mod2)
mod3 <- update(mod2, .~. + I(wt^2))
summary(mod3)
residualPlots(mod3)
##
mod4 <- update(mod3, .~. - am)
summary(mod4)
residualPlots(mod4)
#
mod.glm <- glm(mpg ~ poly(wt, 2) + qsec, data = mtcars)
summary(mod.glm)
# 
library(boot)
cv.glm(data = mtcars, glmfit = mod.glm, K = 5)$delta[1]
# Note how this is considerably larger than rse from mod3!
