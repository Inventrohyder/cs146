data {
    int<lower=1> N;
    vector[N] y;
    vector[N] x;  // Ordinal date
    int<lower=1> nFutureDays; // The count of future days from last observed
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
   real x_future[nFutureDays];
   for (t in 1:nFutureDays) {
       x_future[t] = normal_rng(
           c0 + c1*(t + x[N]) + c2 * cos(2 * pi() * (t + x[N]) / 365.25 + c3),
           sigma
       );
   }
}