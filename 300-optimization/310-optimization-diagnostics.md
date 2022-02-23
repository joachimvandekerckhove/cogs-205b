% Optimization diagnostics
% Joachim Vandekerckhove

## Analytical methods

### The Jacobian

The Jacobian matrix is the matrix of all first-order partial derivatives.  It tells us whether a function at a particular point is increasing, decreasing, or flat.

###

<img src="http://www.emathhelp.net/images/calc/135_first_derivative_test.png" style="zoom:75%;" />

### The Hessian

The Hessian matrix or Hessian is the matrix of all _second-order_ partial derivatives. It describes the local curvature of a function of many variables.

If the Hessian is positive-definite at $x$, then the function has an isolated local minimum at $x$.

In practice, it's important to distinguish between _numerical_ deviations from optimality and _practical_ ones.

###

![](https://files.askiitians.com/cdn1/images/201754-1342399-5163-4-the-second-derivative.jpg)

("Concave upward" is also called "convex."  Concave makes a little cave!)



## Visualization

###

Plot the model prediction over the data

<img src="/home/joachim/Dropbox/GitHub/cogs-205b/300-optimization/powerlaw.jpg" style="zoom:67%;" />

###

Plot the loss function around the obtained minimum

<img src="/home/joachim/Dropbox/GitHub/cogs-205b/300-optimization/marginals.jpg" style="zoom:67%;" />



## Sensitivity testing

### The jackknife

An important consideration in model fitting and parameter estimation is how sensitive the outcome is to things that shouldn't matter.  The opposite of sensitivity is _robustness_, and we are often interested in testing the robustness of results (not just in estimation, but in [experiments](https://www.pnas.org/content/115/11/2607) as well!).

One thing to be robust against is:  what would our conclusion have been if we had lost _one data point_?  With $N$ data points, we can construct $N$ synthetic data sets of size $N-1$ that have similar properties to our real data set.  This collection of data sets will give rise to a distribution of parameter estimates, with some variation we can explore.  This procedure is called [jackknife resampling](https://en.wikipedia.org/wiki/Jackknife_resampling).

### The bootstrap

Very similar to the jackknife, we can ask:  what would the conclusion have been if we had observed a *random replacement sample* of our actually obtained sample?  

This procedure is much more flexible than the jackknife, because it allows for infinitely many synthetic samples of any size.  Because you use one data set to imagine many more data sets, these two procedures are both called [bootstrapping](https://en.wikipedia.org/wiki/Bootstrapping_(statistics)).

### Vandekerckhove's demon

In many models, we have a well defined "error model."  A very common example is $y_i = f(x_i) + \epsilon_i$.  It is typically assumed that the $\epsilon_i$ are distributed $N(0, \sigma^2)$, i.i.d.. 

We can ask yet another question:  what if the *measurement error we observed at time $i$ was a different sample from this distribution of measurement errors* we are assuming?  A sensitivity test could involve resampling $\epsilon_i$ from $N(0, \sigma^2)$ and refitting.

(This is obviously something I made up recently.  It has the advantage that it is more easily applicable to our power law project.)

### Model ablation

_**ablation, n.**_

_the process of ablating: such as:_

1. _surgical removal_
2. _loss of a part (such as ice from a glacier or the outside of a nose cone) by melting or vaporization_

Sometimes we are able to separate a model into assumptions that are [core to our theory and others that are ancillary](https://en.wikipedia.org/wiki/Duhem%E2%80%93Quine_thesis) and only needed to get fitting done.  We could swap out the unimportant assumptions and see if our model still works!

## Regularization

### General case

Loss += $\lambda R(\theta)$

* [LASSO](https://en.wikipedia.org/wiki/Lasso_(statistics)): $R(\theta) = sum(|\theta|)$
* [Ridge regression](https://en.wikipedia.org/wiki/Ridge_regression): $R(\theta) = sum(\theta^2)$
* Smoothing of discontinuities
* [Feature selection](https://en.wikipedia.org/wiki/Feature_selection)

### Link functions and mapping

Often it is helpful to force parameters to fit inside some domain or to be allowed to take all real values. 

* log transform to go from $R^+$ to $R$
* exp to go back
* normcdf to go from $R$ to $[0,1]$
* norminv to go back

###

<img src="/home/joachim/Dropbox/GitHub/cogs-205b/300-optimization/link-functions.jpeg" style="zoom:33%;" />

(From [Dias et al., 2012](https://dx.doi.org/10.1177/0272989X12458724). Note _probit_ = normcdf.)