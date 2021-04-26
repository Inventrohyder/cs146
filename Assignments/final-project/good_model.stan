data {
    int<lower = 0> N;            
    int<lower = 0> nFutureCount; 
    vector[N] y;                 
    vector[N] x;                 
}

parameters {
    //posterior parameters
    real<lower = 0> b;
    real c2;
    real<lower = 0> intercept;
    real<lower = 0> a;
    real<lower = 0> sigma;
}

model {
    // priors
    b ~normal(0, 5);
    intercept ~normal(60000, 10000);

    //likelihood function
    for (t in 1 : N)
    {
        y[t] ~normal(intercept + a * x[t] + b * x[t] ^ 2 + c2 * sin(2 * pi() * x[t] / 365.25), sigma);
    }
}
// future
generated quantities {
    real y_future[nFutureCount];
    for (t in 1 : nFutureCount)
    {
        y_future[t] = normal_rng(intercept + a * (x[N] + 7 * t) + b * (x[N] + 7 * t) ^ 2 + c2 * cos(2 * pi() * (x[N] + 7 * t) / 365.25), sigma);
    }
}