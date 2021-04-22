data {
    int<lower=1> N;
    vector[N] y;
    vector[N] x;  // Ordinal date
    int<lower=1> nFutureCount;
    vector[nFutureCount] futureDays; // The future days to make predictions for
}

parameters {
    // Trend relationship
    real c0;
    real<lower=0>c1;  // (scaling factor) Cannot be below 0
    real<lower=0> c2; // Prior knowledge informs us of increasing c02 levels
    // Seasonal variation
    real c3;
    real c4;
    real<lower=0>sigma;  // Standard deviation has to be positive
}

model {
    y ~ normal(
        c0 + c1*exp(c2*x) + c3 * cos(2 * pi() * x / 365.25 + c4),
        sigma
    );
}

generated quantities {
   real x_future[nFutureCount];
   for (t in 1:nFutureCount){
    x_future[t] = normal_rng(
        c0 + c1*exp(c2*(futureDays[t])) + c3 * cos(2 * pi() * (futureDays[t]) / 365.25 + c4),
        sigma
    );
   }
}