data {
    int<lower=1> N;
    vector[N] y;
    vector[N] x;  // Ordinal date
    int<lower=1> nFutureCount;
    vector[nFutureCount] futureDays; // The future days to make predictions for
}

parameters {
    // Trend relationship
    real t_intercept;
    real<lower=0, upper=1> a;  // (scaling factor) Cannot be below 0
    real<lower=0, upper=5> b; // Prior knowledge informs us of increasing CO2 levels
    real<lower=1, upper=5> c;
    // Seasonal variation
    real<lower=0, upper=5> c2;
    real<lower=-2, upper=2> c3;
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
            t_intercept + a * x[t] + b * x[t]^c + c2 * cos(2 * pi() * x[t] / 365.25 + c3),
            sigma
        );
    }
}

generated quantities {
   real x_future[nFutureCount];
   for (t in 1:nFutureCount){
    x_future[t] = normal_rng(
        t_intercept + a * futureDays[t] + b * futureDays[t]^c + c2 * cos(2 * pi() * futureDays[t] / 365.25 + c3),
        sigma
    );
   }
}