# Comments
## 1. Notebook 1
### Task 1

1. The Rhat value is about 1, that means that the stan model was able to do a good sampling. The markov chains mixed well.

2. The total number of samples were 2000*4 - 1000*4 = 4000. The effective number of samples are about 1000 or 1400. In comparison to the number of iterations 1000(*4) which is actually really good.

### Task 2

1. The plots show samples that are reasonably independent. We see a very high jump from the expected 1 at 0, to very low values that follow.

2. The two pair plots show us the paired plots of both the mu and sigma. (x is mu in one, and y is sigma) and vice versa. At the same time we have their histograms.


### Task 3

* The Stan samples are distributed according to the target distribution. As we can see, it is concentrated in the bottom right as well as the bottom. The dots (samples) are clearly lieing there too.

## 2. Notebook 2
### Task 1

1. The Rhat value is extremely high, it should be as close to 1 as possible. The high value means that the different chains didn't mix well. Therefore, the samples are not effective.

2. n_eff is also very low indicating ineffective sampling. The value 2 is lower the 1/100th of the number of iterations(2000).
