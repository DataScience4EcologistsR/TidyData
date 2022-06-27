n <- 100
x <- runif(n, min = 0, max = 10)
error <- rnorm(n, sd = 1 + x/2)
y = 2 * x + error

plot(x, y)

lm(y ~ x)

plot(lm(y ~ x))


n = 1000
lol = rnorm(n)

temp = numeric(n)
temp[0] = 0
for (i in 2:n) {
  temp[i] = temp[i-1] + lol[i]
}

ind = seq(1:n)

plot(ind, temp)
