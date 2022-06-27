library(Cairo)

####numberline normal data####

# generate data
set.seed(1)
n1 = 10000
x1 <- rnorm(n1)

# numberline plots
for (i in 1:10) {
CairoSVG(paste("normal", i, sep = ""), width = 6, height = 6)
plot(x1[1:i],rep(0,i), pch = 1,
     axes = FALSE, xlab = "", ylab = "", ylim = c(0,1), xlim = c(-4, 4), col = "tomato")
axis(1, at = seq(-4,4,by=1))
dev.off()
}

CairoSVG("normal11", width = 6, height = 6)
plot(x1,rep(0,length(x1)), pch = 1,
     axes = FALSE, xlab = "", ylab = "", ylim = c(0,1), xlim = c(-4, 4), col = "tomato")
axis(1, at = seq(-4,4,by=1))
dev.off()

####histogram normal data####

# histograms with different colorings to indicate standard deviation intervals
breaks_large = seq(-6,6,by=0.1)
CairoSVG("normalhist0", width = 6, height = 6)
plot(seq(-4,4,by=0.001), dnorm(seq(-4,4,by=0.001)), xlim = c(-4,4),xlab = "", 
     ylab = "", main = "", axes = FALSE, type = "l")
dev.off()

breaks_large = seq(-6,6,by=0.1)
CairoSVG("normalhist1", width = 6, height = 6)
hist(x1, freq = TRUE, xlim = c(-4,4), breaks = breaks_large, 
     xlab = "", ylab = "", main = "", col = "grey", axes = FALSE)
axis(1, at = seq(-4,4,by=1))
axis(2, at = seq(0,400,100))
dev.off()

col = ifelse(breaks_large >= -0.1 & breaks_large <0, "tomato", "grey")
CairoSVG("normalhist2", width = 6, height = 6)
hist(x1, freq = TRUE, xlim = c(-4,4), breaks = breaks_large, 
     xlab = "", ylab = "", main = "", col = col, axes = FALSE)
axis(1, at = seq(-4,4,by=1))
axis(2, at = seq(0,400,100))
dev.off()

# col = ifelse(breaks_large >= -1 & breaks_large <1, "tomato", "grey")
# CairoSVG("normalhist3", width = 6, height = 6)
# hist(x1, freq = TRUE, xlim = c(-4,4), breaks = breaks_large, 
#      xlab = "", ylab = "", main = "", col = col, axes = FALSE)
# axis(1, at = seq(-4,4,by=1))
# axis(2, at = seq(0,400,100))
# dev.off()
# 
# col = ifelse(breaks_large >= -2 & breaks_large <2, "tomato", "grey")
# CairoSVG("normalhist4", width = 6, height = 6)
# hist(x1, freq = TRUE, xlim = c(-4,4), breaks = breaks_large, 
#      xlab = "", ylab = "", main = "", col = col, axes = FALSE)
# axis(1, at = seq(-4,4,by=1))
# axis(2, at = seq(0,400,100))
# dev.off()

breaks_large = seq(-6,6,by=0.1)
CairoSVG("normalhist3", width = 6, height = 6)
hist(x1, freq = FALSE, xlim = c(-4,4), breaks = breaks_large, 
     xlab = "", ylab = "", main = "", col = "grey", axes = FALSE)
axis(1, at = seq(-4,4,by=1))
axis(2)
dev.off()

breaks_large = seq(-6,6,by=0.1)
CairoSVG("normalhist4", width = 6, height = 6)
hist(x1, freq = FALSE, xlim = c(-4,4), breaks = breaks_large, 
     xlab = "", ylab = "", main = "", col = "grey", axes = FALSE)
axis(1, at = seq(-4,4,by=1))
axis(2)
lines(seq(-4,4,by=0.001),dnorm(seq(-4,4,by=0.001)), col = "tomato")
dev.off()

# breaks_small = seq(-6,6,by = 0.5)
# CairoSVG("normalhist1", width = 6, height = 6)
# hist(x1, freq = FALSE, xlim = c(-3,3), ylim = c(0,0.5), breaks = breaks_small, xlab = "", ylab = "", main = "", col = "grey")
# dev.off()
# 
# col = ifelse(breaks_small >= -1 & breaks_small <=1, "tomato", "grey")
# CairoSVG("normalhist2", width = 6, height = 6)
# hist(x1, freq = FALSE, xlim = c(-3,3), ylim = c(0,0.5), breaks = breaks_small, xlab = "", ylab = "", main = "", col = col)
# dev.off()
# 
# col = ifelse(breaks_small >= -2 & breaks_small <=2, "tomato", "grey")
# CairoSVG("normalhist3", width = 6, height = 6)
# hist(x1, freq = FALSE, xlim = c(-3,3), ylim = c(0,0.5), breaks = breaks_small, xlab = "", ylab = "", main = "", col = col)
# dev.off()

####parameter influence####
CairoSVG("normalhist4", width = 6, height = 6)
ind = seq(-6,6,by=0.001)
plot(ind, dnorm(ind), type = "l", xlim = c(-6,6), axes = FALSE, ylab = "density", xlab = "x")
axis(1, at = seq(-6,6,by=1))
axis(2)
lines(ind,dnorm(ind, mean = -2), col = "tomato")
lines(ind,dnorm(ind, mean = 2), col = "cornflowerblue")
legend(-6,0.4,c("N(-2,1)","N( 0,1)","N(-2,1)"),fill=c("tomato", "black", "cornflowerblue"),bty="n")
dev.off()


####linear model scatterplots####

CairoSVG("lmdata1", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(3, 0.5)
dev.off()

CairoSVG("lmdata2", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(3, 0.5)
symbols(x= 2, y= 0, circles=0.2, add=T, inches=F, fg = "tomato")
dev.off()

CairoSVG("lmdata3", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(3, 0.5)
arrows(2, 0, 2, 2.5 + 2 * 0.5, length = 0.25, angle = 30,
       code = 2, col = "tomato")
symbols(x= 2, y= 3 + 2 * 0.5, circles=0.2, add=T, inches=F, fg = "tomato")
dev.off()

CairoSVG("lmdata4", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(3, 0.5)
arrows(2, 3 + 2 * 0.5, 2, 3 + 2 * 0.5 + error[4] - 0.5, length = 0.25, angle = 30,
       code = 2, col = "tomato")
symbols(x= 2, y= 3 + 2 * 0.5 + error[4], circles=0.2, add=T, inches=F, fg = "tomato")
dev.off()

CairoSVG("lmdata5", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(3, 0.5)

symbols(x= 2, y= 3 + 2 * 0.5 + error[4], circles=0.2, add=T, inches=F, fg = "tomato")
symbols(x= 5.5, y= 3 + 5.5 * 0.5 + error[11], circles=0.2, add=T, inches=F, fg = "tomato")
dev.off()

CairoSVG("lmdata6", width = 6, height = 6)
set.seed(16)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(3, 0.5)
symbols(x= 2, y= 3 + 2 * 0.5 + error[4], circles=0.2, add=T, inches=F, fg = "tomato")
symbols(x= 5.5, y= 3 + 5.5 * 0.5 + error[11], circles=0.2, add=T, inches=F, fg = "tomato")
dev.off()

CairoSVG("lmdata7", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
dev.off()

CairoSVG("lmdata8", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(lm(y~x), col = "tomato")
legend(0,11,c("estimated"),fill=c("tomato"),bty="n")
dev.off()

CairoSVG("lmdata9", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(lm(y~x), col = "tomato")
abline(3, 0.5)
legend(0,11,c("estimated", "true"),fill=c("tomato", "black"),bty="n")

summary(lm(y~x))
dev.off()

CairoSVG("lmdata10", width = 6, height = 6)
set.seed(18)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 0.1)
y = 0.4 + 0.1 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,1.5), xlab="Age in years", ylab="Height in metres")
dev.off()

CairoSVG("lmdata11", width = 6, height = 6)
layout(matrix(1:4, 2, 2))
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 0.1)
y = 0.4 + 0.1 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,1.5), xlab="Age in years", ylab="Height in metres")
abline(0.4, 0.1)

x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 0.1)
y = 0.4 + 0.1 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,1.5), xlab="Age in years", ylab="Height in metres")
abline(0.4, 0.1)

x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 0.1)
y = 0.4 + 0.1 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,1.5), xlab="Age in years", ylab="Height in metres")
abline(0.4, 0.1)

set.seed(18)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 0.1)
y = 0.4 + 0.1 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,1.5), xlab="Age in years", ylab="Height in metres")
abline(0.4, 0.1)
dev.off()

CairoSVG("lmdata12", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
dev.off()

CairoSVG("lmdata13", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(2, 0.9, col="chartreuse4")
dev.off()

CairoSVG("lmdata14", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(2, 0.9, col="chartreuse4")
segments(x[1], y[1] - 0.07, x[1], 2 + 0.9 * x[1], col="red")
print(y[1])
print(2 + 0.9 * x[1])
dev.off()

CairoSVG("lmdata15", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(2, 0.9, col="chartreuse4")
segments(x[2], y[2] - 0.07, x[2], 2 + 0.9 * x[2], col="red")
print(y[2])
print(2 + 0.9 * x[2])
dev.off()

CairoSVG("lmdata16", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(2, 0.9, col="chartreuse4")
# abline(3, 0.5, col = "cornflowerblue")
# abline(test$coefficients, col = "goldenrod3")
segments(x[20], y[20] + 0.07, x[20], 2 + 0.9 * x[20], col="red")
print(y[20])
print(2 + 0.9 * x[20])
dev.off()

CairoSVG("lmdata17", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(2, 0.9, col="chartreuse4")
abline(3.8, 0.4, col = "goldenrod3")



pred1 = 3.8 + 0.4 * x
sum((y - pred1)^2)

test = lm(y ~ x)
pred2 = test$coefficients[1] + test$coefficients[2] * x
sum((y - pred2)^2)


dev.off()

CairoSVG("lmdata18", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(2, 0.9, col="chartreuse4")
abline(3.8, 0.4, col = "goldenrod3")
abline(test$coefficients, col = "cornflowerblue")
dev.off()

CairoSVG("lmdata19", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 0.5)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(3, 0.5)
legend(0,11,c("true"),fill=c("black"),bty="n")
dev.off()

CairoSVG("lmdata20", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 0.5)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(3, 0.5)
segments(x[2], y[2] - 0.07, x[2], 3 + 0.5 * x[2], col="red")
legend(0,11,c("true"),fill=c("black"),bty="n")
dev.off()


CairoSVG("lmdata21", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(3, 0.5)
legend(0,11,c("true"),fill=c("black"),bty="n")
dev.off()

CairoSVG("lmdata22", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(3, 0.5)
segments(x[2], y[2] - 0.07, x[2], 3 + 0.5 * x[2], col="red")
legend(0,11,c("true"),fill=c("black"),bty="n")
dev.off()

CairoSVG("lmdata23", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(3, 0.5)
abline(test$coefficients, col = "cornflowerblue")
legend(0,11,c("true", "estimated"),fill=c("black", "cornflowerblue"),bty="n")
dev.off()

CairoSVG("lmdata24", width = 6, height = 6)
set.seed(15)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(3, 0.5)
abline(test$coefficients, col = "cornflowerblue")
segments(x[2], y[2] - 0.07, x[2], test$coefficients[1] + test$coefficients[2] * x[2], col="red")
legend(0,11,c("true", "estimated"),fill=c("black", "cornflowerblue"),bty="n")
dev.off()


# properties of estimates video

CairoSVG("lmdata25", width = 6, height = 6)
set.seed(1)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error
plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(3, 0.5)
legend(0,11,c("true"),fill=c("black"),bty="n")
dev.off()

# simulate estimates with plots of estimated function
set.seed(2)
for(i in 26:46)
{
CairoSVG(paste("lmdata", i, sep=""), width = 6, height = 6)
x = seq(0.5, 10, by = 0.5)
error = rnorm(20, 0, 2)
y = 3 + 0.5 * x + error

temp = lm(y~x)

plot(x, y, pch = 19, cex = 0.5, xlim = c(0, 10), ylim = c(0,11))
abline(3, 0.5)
abline(temp$coefficients[1], temp$coefficients[2], col="cornflowerblue")
legend(0,11,c("true", "estimated"),fill=c("black", "cornflowerblue"),bty="n")
dev.off()
}

# simulate estimates to show histogram of estimates
n = 10000
beta0_estimates = numeric(n)
beta1_estimates = numeric(n)

set.seed(1)
for(i in 1:n)
{
        x = seq(0.5, 10, by = 0.5)
        error = rnorm(20, 0, 2)
        y = 3 + 0.5 * x + error
        
        temp = lm(y~x)
        
        beta0_estimates[i] = temp$coefficients[1]
        beta1_estimates[i] = temp$coefficients[2]
}

# calculate means of estimates
mean(beta0_estimates)
mean((beta1_estimates))

CairoSVG("histestimates1", width = 6, height = 6)

layout(matrix(1:2, 2, 1))

hist(beta0_estimates, freq = FALSE, xlim=c(-1, 7), breaks=seq(-1,7,by=0.1),
     xlab = expression(paste(hat(beta)[0])), ylab = "density", main = "", col = "grey", axes=FALSE)
axis(1, at = seq(-1,7,by=1))
axis(2)

hist(beta1_estimates, freq = FALSE, xlim=c(-0.2, 1.2), breaks=seq(-0.2, 1.2, length.out=80),
     xlab = expression(paste(hat(beta)[1])), ylab = "density", main = "", col = "grey", axes=FALSE)
axis(1, at = seq(-0.2, 1.2,by=0.2))
axis(2)

dev.off()

CairoSVG("histestimates2", width = 6, height = 6)

layout(matrix(1:2, 2, 1))

hist(beta0_estimates, freq = FALSE, xlim=c(-1, 7), breaks=seq(-1,7,by=0.1),
     xlab = expression(paste(hat(beta)[0])), ylab = "density", main = "", col = "grey", axes=FALSE)
axis(1, at = seq(-1,7,by=1))
axis(2)

abline(v=mean(beta0_estimates), col="tomato", lwd=2)

hist(beta1_estimates, freq = FALSE, xlim=c(-0.2, 1.2), breaks=seq(-0.2, 1.2, length.out=80),
     xlab = expression(paste(hat(beta)[1])), ylab = "density", main = "", col = "grey", axes=FALSE)
axis(1, at = seq(-0.2, 1.2,by=0.2))
axis(2)

abline(v=mean(beta1_estimates), col="tomato", lwd=2)

dev.off()


dev.off()

# calculate theoretic variances
x = seq(0.5, 10, by = 0.5)
X = cbind(rep(1, length((x))), x)
covariance = solve(t(X) %*% X) * 4

CairoSVG("histestimates3", width = 6, height = 6)
layout(matrix(1:2, 2, 1))

hist(beta0_estimates, freq = FALSE, xlim=c(-1, 7), breaks=seq(-1,7,by=0.1),
     xlab = expression(paste(hat(beta)[0])), ylab = "density", main = "", col = "grey", axes=FALSE)
lines(seq(-1,7,by=0.001), dnorm(seq(-1,7,by=0.001), 3, sqrt(covariance[1, 1])), xlim = c(-0.2,1.2),xlab = "", 
      ylab = "", main = "", type = "l", col="tomato", lwd=2)
axis(1, at = seq(-1,7,by=1))
axis(2)

abline(v=mean(beta0_estimates), col="tomato", lwd=2)

hist(beta1_estimates, freq = FALSE, xlim=c(-0.2, 1.2), breaks=seq(-0.2, 1.2, length.out=80),
     xlab = expression(paste(hat(beta)[1])), ylab = "density", main = "", col = "grey", axes=FALSE)
lines(seq(-0.2,1.2,by=0.001), dnorm(seq(-0.2,1.2,by=0.001), 0.5, sqrt(covariance[2, 2])), xlim = c(-0.2,1.2),xlab = "", 
      ylab = "", main = "", type = "l", col="tomato", lwd=2)
axis(1, at = seq(-0.2, 1.2,by=0.2))
axis(2)

abline(v=mean(beta1_estimates), col="tomato", lwd=2)

dev.off()

# second example no association between x and y

# simulate estimates to show histogram of estimates
n = 10000
beta0_estimates = numeric(n)
beta1_estimates = numeric(n)

set.seed(100)
for(i in 1:n)
{
  x = seq(0.5, 10, by = 0.5)
  error = rnorm(20, 0, 2)
  y = error
  
  temp = lm(y~x)
  
  beta0_estimates[i] = temp$coefficients[1]
  beta1_estimates[i] = temp$coefficients[2]
}

# calculate means of estimates
mean(beta0_estimates)
mean((beta1_estimates))

CairoSVG("histestimates4", width = 6, height = 6)

layout(matrix(1:2, 2, 1))

hist(beta0_estimates, freq = FALSE, xlim=c(-4, 4), breaks=seq(-4,4,by=0.1),
     xlab = expression(paste(hat(beta)[0])), ylab = "density", main = "", col = "grey", axes=FALSE)
axis(1, at = seq(-4,4,by=1))
axis(2)

hist(beta1_estimates, freq = FALSE, xlim=c(-0.7, 0.7), breaks=seq(-0.7, 0.7, length.out=80),
     xlab = expression(paste(hat(beta)[1])), ylab = "density", main = "", col = "grey", axes=FALSE)
axis(1, at = seq(-0.7, 0.7,by=0.2))
axis(2)

dev.off()


CairoSVG("histestimates5", width = 6, height = 6)

layout(matrix(1:2, 2, 1))

hist(beta0_estimates, freq = FALSE, xlim=c(-4, 4), breaks=seq(-4,4,by=0.1),
     xlab = expression(paste(hat(beta)[0])), ylab = "density", main = "", col = "grey", axes=FALSE)
axis(1, at = seq(-4,4,by=1))
axis(2)
abline(v=mean(beta0_estimates), col="tomato", lwd=2)

hist(beta1_estimates, freq = FALSE, xlim=c(-0.7, 0.7), breaks=seq(-0.7, 0.7, length.out=80),
     xlab = expression(paste(hat(beta)[1])), ylab = "density", main = "", col = "grey", axes=FALSE)
axis(1, at = seq(-0.7, 0.7,by=0.2))
axis(2)
abline(v = mean(beta1_estimates), col="tomato", lwd=2)

dev.off()


dev.off()

# calculate theoretic variances
x = seq(0.5, 10, by = 0.5)
X = cbind(rep(1, length((x))), x)
covariance = solve(t(X) %*% X) * 4

CairoSVG("histestimates6", width = 6, height = 6)
layout(matrix(1:2, 2, 1))

hist(beta0_estimates, freq = FALSE, xlim=c(-4, 4), breaks=seq(-4,4,by=0.1),
     xlab = expression(paste(hat(beta)[0])), ylab = "density", main = "", col = "grey", axes=FALSE)
lines(seq(-4,4,by=0.001), dnorm(seq(-4,4,by=0.001), 0, sqrt(covariance[1, 1])), xlim = c(-0.2,1.2),xlab = "", 
      ylab = "", main = "", type = "l", col="tomato", lwd=2)
axis(1, at = seq(-4,4,by=1))
axis(2)

hist(beta1_estimates, freq = FALSE, xlim=c(-0.7,0.7), breaks=seq(-0.7,0.7, length.out=80),
     xlab = expression(paste(hat(beta)[1])), ylab = "density", main = "", col = "grey", axes=FALSE)
lines(seq(-0.7,0.7,by=0.001), dnorm(seq(-0.7,0.7,by=0.001), 0, sqrt(covariance[2, 2])), xlim = c(-0.7,0.7),xlab = "", 
      ylab = "", main = "", type = "l", col="tomato", lwd=2)
axis(1, at = seq(-0.7,0.7,by=0.2))
axis(2)
dev.off()



