data {
    int<lower=1> N;
    vector[N] y;
    vector[N] x;  // Ordinal date
    int<lower=1> nFutureCount;
    vector[nFutureCount] futureDays; // The future days to make predictions for
}

parameters {
    // Linear relationship
    real c0;
    real<lower=0>c1;  // Prior knowledge informs us of increasing c02 levels
    // Seasonal variation
    real c2;
    real c3;
    real<lower=0>sigma;  // Standard deviation has to be positive
}

model {
    y ~ normal(
        c0 + c1*x + c2 * cos(2 * pi() * x / 365.25 + c3),
        sigma
    );
}

generated quantities {
   real x_future[nFutureCount];
   for (t in 1:nFutureCount){
       x_future[t] = normal_rng(
           c0 + c1*(futureDays[t]) + c2 * cos(2 * pi() * (futureDays[t]) / 365.25 + c3),
           sigma
       );
   }
}