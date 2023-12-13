# OptionsPkg

## Preliminary function definitions

Npdf[x] returns the Standard Normal probability distribution function evaluated at x

Ncdf[x] returns the Standard Normal cumulative distribution function evaluated at x

Nicdf[x] returns the inverse of the Standard Normal CDF evaluated at x

Nipdf[x] returns the inverse of the Standard Normal PDF evaluated at x, with the positive branch being chosen

## Valuation functioms

Cvalue[S, Ks, τ, σ, r] returns the value of a call at spot price S, strike price Ks, with time to expiration τ years, annual risk free interest rate r, and IV σ

Pvalue[S, Ks, τ, σ, r] returns the value of a call at spot price S, strike price Ks, with time to expiration τ years, annual risk free interest rate r, and IV σ
