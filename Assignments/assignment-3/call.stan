data {
    int <lower=1> N;                 // Sample size
    vector[N] y;                     // Outcome
    real alpha;                      // Prior hyperparameter
    real beta;                       // Prior hyperparameter
}

parameters {
    real lambda;                     // the parameter for our posterior model
}

model {
    lambda ~ gamma(alpha, beta);     // Prior distribution
    y ~ exponential(lambda);         // Likelihood distribution
}