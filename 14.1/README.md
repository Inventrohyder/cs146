# Comments
## 1. [Notebook 1](./cs146-14.1-pre-class-work-1.ipynb)
### Task 1

1. The Rhat value is about 1, that means that the stan model was able to do a good sampling. The markov chains mixed well.

2. The total number of samples were 2000*4 - 1000*4 = 4000. The effective number of samples are about 1000 or 1400. In comparison to the number of iterations 1000(*4) which is actually really good.

### Task 2

1. The plots show samples that are reasonably independent. We see a very high jump from the expected 1 at 0, to very low values that follow.

2. The two pair plots show us the paired plots of both the mu and sigma. (x is mu in one, and y is sigma) and vice versa. At the same time we have their histograms.


### Task 3

* The Stan samples are distributed according to the target distribution. As we can see, it is concentrated in the bottom right as well as the bottom. The dots (samples) are clearly lieing there too.

## 2. [Notebook 2](./cs146-14.1-pre-class-work-2.ipynb)
### Task 1

1. The Rhat value is extremely high, it should be as close to 1 as possible. The high value means that the different chains didn't mix well. Therefore, the samples are not effective.

2. n_eff is also very low indicating ineffective sampling. The value 2 is lower the 1/100th of the number of iterations(2000).

### Task 2

1. The autocorrelation is extremelly high. Therefore, the samples seem to not be independent at all.

2. The pair plot shows us the two sides of the samples and hopefully a relation. We don't see also any random distribution, only the histograms.

### Task 3

1. The stan samples seem to be distributed according to the target distribution. 

2. However, in relation to the autocorrelation plot, we expect that the values are highly dependent and correlated to each other.


## 3. [Notebook 3](./cs146-14.1-pre-class-work-3.ipynb)
### Task 1

### Task 2

1. The Rhat value's are way much higher than 1, meaning that Stan's sampling didn't converge. For it to converge it should be a value around 1, that would mean that the different chains have fused together to kinda be like 1 chain.

2. The total number of samples is 4000, the default (2000*4 - 1000*4). The effective number of samples for all parameters are less than 1/100th of the number of iterations 2000. These values are not good.

### Task 3

1. The samples are highly correlated.

2. The pair plots shows us that many of the parameters are correlated with each other through certain relationships. Some are clustered. Some have linear relationship etc.

### Task 4

The 95% confidence interval looks good by actually enconmpassing the true data. However, it is not very great because it is kina not very informative.
