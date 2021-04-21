data {
    int<lower=1> N;
    vector[N] y;
    vector[N] x;  // timestamp
}

parameters {
   real c0;
   real<lower=0>c1;  // Prior knowledge informs us of increasing c02 levels
   real<lower=0>s;  // Standard deviation has to be positive
}

model {
   y ~ normal(c0 + c1*x, s);
}