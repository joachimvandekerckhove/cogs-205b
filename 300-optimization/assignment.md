# Homework Week 6

## The power law of practice

The power law of practice says that expected (mean) reaction time ERT decreases according to a power law as a function of number of trials N.

### The law

$ERT_N = A + B (N + E)^{-\beta}$

### Parameters

  - Asymptote A
  - Range B
  - Exposure E
  - Rate $\beta$



## Assignment

Create a new class, **PowerLawFitter**, a subclass of **handle**.

### Properties

  - **ObservedRT**, a row vector of observed mean reaction times over N trials
  - **Count** (Dependent), a scalar giving the number of trials in MeanRT
  - **EstimatedAsymptote** (SetAccess = private)
  - **EstimatedRange** (SetAccess = private)
  - **EstimatedExposure** (SetAccess = private)
  - **EstimatedRate** (SetAccess = private)

Implement other properties as needed.

Implement at least one test for each property.

### Methods

- **Expectation**
    - Input: A, B, E, $\beta$
    - Output: ERT, a vector of expected reaction times over N trials (where N is Count)
- **SumOfSquaredError**
    - Input: A, B, E, $\beta$
    - Output: SSE, a scalar that is the squared difference between ERT and ObservedRT, summed
- **Fit**
    - Input: None
    - Output: None
    - After running **Fit**, the private access properties should be set to be the estimated parameters of the power law to these data
- **disp**
  - Input: None
  - Output: None
  - Prints to the screen information about the current data, such as the number of trials, and also parameter estimates if they are available.

Implement other methods as needed.

Implement at least one test for each method.

## Bonus

Implement some way to keep track of the data (ObservedRT) and the parameter estimates.  

For example, if the parameter estimates are set, then the Fit method should not recompute them unless the data have changed.  Conversely, if the data have changed, the user should not be able to extract outdated parameter estimates.

Implement two tests for this.

## Data

TBD
