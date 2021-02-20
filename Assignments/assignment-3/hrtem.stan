data {
    int <lower=1> N;   
    vector[N] y;       
    real<lower=0> mu_0; 
    real nu_0;
    real alpha_0;
    real beta_0;        
}

parameters {
    real x;                                 // the parameter for our posterior model
    real sigma;                             // the parameter for our posterior model
}

model {
    sigma ~ inv_gamma(alpha_0, beta_0);
    x ~ normal(mu_0, sqrt(sigma / nu_0));   // Normal-inverse-Gamma prior
    
    y ~ lognormal(x, sqrt(sigma));          // Likelihood distribution
}