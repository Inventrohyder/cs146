data {
    int<lower=1> N;
    vector[N] y;
    vector[N] x;  // Ordinal date
    int<lower=1> nFutureCount;
    vector[nFutureCount] futureDays; // The future days to make predictions for
    real scalingFactor;  // Used to scale the exponenet avoiding inf errors
}

parameters {
    // Trend relationship
    real t_intercept;
    real<lower=0, upper=1> a;  // (scaling factor) Cannot be below 0
    real<lower=0, upper=5> b; // Prior knowledge informs us of increasing CO2 levels
    real<lower=0, upper=1> c;
    real<lower=-100, upper=0> d;
    // Seasonal variation
    real<lower=0, upper=5> c2;
    real<lower=-5, upper=5> c3;
    real<lower=0>sigma;  // Standard deviation has to be positive
}

model {
    t_intercept ~ cauchy(100, 50);
    a ~ cauchy(0, 0.0001);
    b ~ cauchy(0,1);
    c ~ cauchy(0, 0.001);
    c2 ~ cauchy(2.5, 1);
    c3 ~ cauchy(0, 1);
    for (t in 1:N){
        y[t] ~ normal(
            t_intercept + a * b^(c* x[t] * scalingFactor + d) + c2 * cos(2 * pi() * x[t] / 365.25 + c3),
            sigma
        );
    }
    // y ~ normal(
    //     t_intercept + c1*exp(c2*x*scalingFactor) + 
    //     sigma
    // );
}

generated quantities {
   real x_future[nFutureCount];
   for (t in 1:nFutureCount){
    x_future[t] = normal_rng(
        t_intercept + a * b^(c * futureDays[t] * scalingFactor + d) + c2 * cos(2 * pi() * (futureDays[t]) / 365.25 + c3),
        sigma
    );
    // x_future[t] = normal_rng(
    //     t_intercept + c1*exp(c2*futureDays[t] * scalingFactor) + c3 * cos(2 * pi() * (futureDays[t]) / 365.25 + c4),
    //     sigma
    // );
   }
}