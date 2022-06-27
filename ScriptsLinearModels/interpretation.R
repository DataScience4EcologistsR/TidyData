library(Cairo)
library(car)

# generate example data
set.seed(1)
x = rep(0:5, each=5)
intercept = rep(1, 30)
X = cbind(intercept, x)
y = x * -2.6 + rnorm(30, 0, 4)
data = data.frame(y, x)

# plot example data
CairoSVG("interpretation1", width = 6, height = 6)
plot(data$x, data$y, ylab="change in blood pressue (mm Hg)",
     xlab="drug dose (mg)", pch=19)
dev.off()


# alternative data visualization
CairoSVG("interpretation2", width = 6, height = 6)
layout(matrix(1:4, 2, 2))

x = rep(0:5, each=5)
intercept = rep(1, 30)
X = cbind(intercept, x)
y = x * -2.6 + rnorm(30, 0, 4)
data = data.frame(y, x)
plot(data$x, data$y, pch=19, xlab="", ylab="")

set.seed(1)
x = rep(0:5, each=5)
intercept = rep(1, 30)
X = cbind(intercept, x)
y = x * -2.6 + rnorm(30, 0, 4)
data = data.frame(y, x)
plot(data$x, data$y, pch=19, xlab="", ylab="")

x = rep(0:5, each=5)
intercept = rep(1, 30)
X = cbind(intercept, x)
y = x * -2.6 + rnorm(30, 0, 4)
data = data.frame(y, x)
plot(data$x, data$y, pch=19, xlab="", ylab="")

x = rep(0:5, each=5)
intercept = rep(1, 30)
X = cbind(intercept, x)
y = x * -2.6 + rnorm(30, 0, 4)
data = data.frame(y, x)
plot(data$x, data$y, pch=19, xlab="", ylab="")

dev.off()


# estimation and calculation of sample variance for beta0 and beta1
set.seed(1)
x = rep(0:5, each=5)
intercept = rep(1, 30)
X = cbind(intercept, x)
y = x * -2.6 + rnorm(30, 0, 4)
data = data.frame(y, x)

result = lm(y~x, data=data)
result$coefficients
sigmasquared_hat = sum((result$residuals)^2) / result$df.residual 

cov_sample = vcov(result)

var_bet0_hat = cov_sample[1,1]
var_bet1_hat = cov_sample[2,2]

var_bet0_hat
var_bet1_hat

linearHypothesis(result, hypothesis.matrix=c(0, 1), rhs=-2)

summary()


# plot of data plus estimated function
CairoSVG("interpretation3", width = 6, height = 6)
plot(data$x, data$y, ylab="change in blood pressue (mm Hg)",
     xlab="drug dose (mg)", pch=19)
abline(result$coefficients[1], result$coefficients[2], col="cornflowerblue")
dev.off()

# visualize sample distribution for beta1

CairoSVG("interpretation4", width = 6, height = 6)
ind = seq(-5,2,by=0.001)
plot(ind, dnorm(ind, mean=0, sd=sqrt(0.16)), type = "l", xlim = c(-4.5,2), axes = FALSE, ylab = "density", xlab = "x")
axis(1, at = seq(-6,6,by=1))
axis(2)
lines(ind,dnorm(ind, mean = -1, sd=sqrt(0.16)), col = "tomato")
lines(ind,dnorm(ind, mean = -2, sd=sqrt(0.16)), col = "cornflowerblue")
legend(-4.5,1,
       legend = c(expression(paste(hat(beta)[1], "~ N( 0, 0.16)")),
                  expression(paste(hat(beta)[1], "~ N(-1, 0.16)")),
                  expression(paste(hat(beta)[1], "~ N(-2, 0.16)"))),
       fill=c("tomato", "black", "cornflowerblue"),bty="n", y.intersp=1.4)
dev.off()

CairoSVG("interpretation5", width = 6, height = 6)
ind = seq(-5,2,by=0.001)
plot(ind, dnorm(ind, mean=0, sd=sqrt(0.16)), type = "l", xlim = c(-4.5,2), axes = FALSE, ylab = "density", xlab = "x")
axis(1, at = seq(-6,6,by=1))
axis(2)
lines(ind,dnorm(ind, mean = -1, sd=sqrt(0.16)), col = "tomato")
lines(ind,dnorm(ind, mean = -2, sd=sqrt(0.16)), col = "cornflowerblue")
legend(-4.5,1,
       legend = c(expression(paste(hat(beta)[1], "~ N( 0, 0.16)")),
                  expression(paste(hat(beta)[1], "~ N(-1, 0.16)")),
                  expression(paste(hat(beta)[1], "~ N(-2, 0.16)"))),
       fill=c("tomato", "black", "cornflowerblue"),bty="n", y.intersp=1.4)
dev.off()

CairoSVG("interpretation6", width = 6, height = 6)
ind = seq(-5,2,by=0.001)
plot(ind, dnorm(ind, mean=0, sd=sqrt(0.16)), type = "l", xlim = c(-4.5,2), axes = FALSE, ylab = "density", xlab = "x")
axis(1, at = seq(-6,6,by=1))
axis(2)
lines(ind,dnorm(ind, mean = -1, sd=sqrt(0.16)), col = "tomato")
lines(ind,dnorm(ind, mean = -2, sd=sqrt(0.16)), col = "cornflowerblue")
legend(-4.5,1,
       legend = c(expression(paste(hat(beta)[1], "~ N( 0, 0.16)")),
                  expression(paste(hat(beta)[1], "~ N(-1, 0.16)")),
                  expression(paste(hat(beta)[1], "~ N(-2, 0.16)"))),
       fill=c("tomato", "black", "cornflowerblue"),bty="n", y.intersp=1.4)
dev.off()


pnorm(-2.84, -2, 0.4)








