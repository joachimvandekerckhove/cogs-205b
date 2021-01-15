# COGS 205B: Computational Lab Skills for Cognitive Scientists I

## Instructor Information
 Prof. Joachim Vandekerckhove

* Email: joachim@uci.edu
* Phone: No
* Office: No!

## Course description
This course provides an in-depth introduction to writing MATLAB programs to run simulations and numerical experiments.  Topics covered include program structure, random number generation, plotting, version control, basic model fitting, and numerical methods for integration and optimization.  Weekly programming assignments will ensure that students master the techniques presented.  Material includes working with linux-based remote computers and using common collaboration tools.

## Weekly meeting time and place
Fridays 1:00 - 3:50P via Zoom; or asynchronously as determined by the instructor.

## Prerequisites
Must be comfortable with basic MATLAB and mathematical statistics at the level of one graduate course (e.g., COGS 203A/B, STATS 210, or equivalent).

Prerequisite: COGS 205A, or equivalent.

## Assessment
Grades will be based on regular homework assignments.  The homework should be done individually.  The homework assignments have particular requirements.  Your grade depends entirely on how much of the requirements you deliver by the assignment deadline.  A grade of ‘A’ requires that all assignments are delivered on time and are functional.

## Academic dishonesty
There is no tolerance for academic dishonesty or fraud.  Any form of fraud designed to circumvent course policies will result in a failing grade.  The professor makes no judgment calls regarding academic dishonesty.  Any academic dishonesty, no matter how small, will be escalated to academic authorities.

## Schedule
### Unix
#### Topics
* Using the command line on your machine
* Accessing remote computers
* Shell commands:  cd, ls, cp, mv, rm, echo, alias, ln
* Shell commands:  wget, ssh, scp, sshfs, screen
* Permissions:  rwxrwxrwxd, dotfiles, sudo, ssh keys
* Basic scripting:  nano, grep, sed,  #!  ./
* Bash variables
* Version control with git
* Markdown

#### Assignment: Write and run a shell script named \<your-pseudonym\>.sh that
1. First clones the class git repository and makes a new branch
1. Then makes a new directory /assignment/\<your-pseudonym\>/ in the git repository
1. Makes a copy of itself in the new directory
1. Pushes the updates to the git repository
* Difficulty: your pseudonym appears in script only once

#### Learning goals
* You will need to use these technologies to do and submit the assignments

### MATLAB code organization
#### Topics
* Functions and scripts
* Reading and writing text files
* Printing to the console
* Getting input from the console
* Calling system commands: system(), !
* @classes and +packages

#### Learning goals
* Understand different use cases of functions, scripts, @classes, and +packages
* Know how to write code that interacts with the operating system and the console

#### Assignment: Make a +package called /+\<your-pseudonym\> with just a class @norm2d
* @norm2d % implements the bivariate normal likelihood equivalence class 
* Include getters/setters and these six methods: (log)pdf, (log)cdf, rand, deviance
* Avoid duplicating code

### Good coding practice
#### Topics
* Contractual programming
* Unit testing
* Continuous integration

#### Assignment: Add to your +package
* Contents.m % prints help text for all functions
* main.m % contains settings and runs the analysis
* test.m % tests each function and method in the package
* getData.m % downloads data from a url
* readData.m % reads the data into variables
* summary.m % computes summary statistics
* report.m % prints a report to file in markdown format
* Name the output file \<your-pseudonym\>-1.md and write it to the /reports directory

#### Learning goals
* Understand how to implement contractual programming
* Understand how to implement unit testing
* Understand the principles of continuous integration
* You will be expected to apply contractual programming and unit testing in all assignments going forward

### Optimization I

#### Topics
* Likelihood equivalence classes
* Anonymous functions
* Hill-climbing
* Tabu search
* Newton-Raphson
* Nelder-Mead simplex

#### Assignment: Add to your +package
* neldermead.m % finds optimum of a given function
* Edit main.m so that after computing the summary statistics it also finds the maximum likelihood estimates of the bivariate normal parameters using the downloaded data
* Edit report.m so it also prints out the MLEs
* Name the output file \<your-pseudonym\>-2.md and write it to the /reports directory

#### Learning goals
* Understand the different use cases of some numerical optimization techniques
* Understand the inner workings of the Nelder-Mead algorithm

### Numerical integration

#### Topics
* Trapezoidal rule
* Gaussian quadrature
* Monte Carlo sampling

### Analysis

#### Topics
* Markov Chain Monte Carlo (MCMC) simulation
* Summaries of distributions

#### Assignment
* Estimate parameters of a Weibull function using psychometric data
* Estimate parameters of a Gaussian psychometric function

### Optimization II

#### Topics
* Simulated annealing
* Genetic algorithms

