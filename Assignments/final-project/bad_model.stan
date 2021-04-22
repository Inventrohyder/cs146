data {
    int<lower=1> N;
    vector[N] y;
    vector[N] x;  // timestamp
}

parameters {
    // Linear relationship
    real c0;
    real<lower=0>c1;  // Prior knowledge informs us of increasing c02 levels
    // Seasonal variation
    real c2;
    real c3;
    real<lower=0>s;  // Standard deviation has to be positive
}

model {
    y ~ normal(c0 + c1*x + c2 * cos(2 * pi() * x / 365.25 + c3), s);
}