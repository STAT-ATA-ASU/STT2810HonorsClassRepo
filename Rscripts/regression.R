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