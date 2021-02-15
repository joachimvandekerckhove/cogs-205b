# Homework: Automated report generation

Imagine that we are keeping track of some behavioral data that is placed in a file on a website. There are two variables of interest, x and y, and we want to be able to rapidly report their mean, variance, and correlation. Add:

1. a static method `pseudonym.Norm2d().estimate(X)` 

**Expects:** Input is a 2xN matrix `X` (sufficiently conditioned that you can compute a mean and covariance matrix).

**Promises:** Output is a Norm2d object with its properties `Mean` and `Covariance` set to the mean and covariance matrix of the input matrix `X` (and all contingent properties updated).

2. `pseudonym/getData.m`

**Expects:** Input is a URL to a data file.

**Promises:** Downloads the file to the computer.  Output is the name of the local file. 

3. `pseudonym/readData.m`

**Expects:** Input is the name of a local file `filename` with numbers (like [http://cidlab.com/files/cogs205b.csv](http://cidlab.com/files/cogs205b.csv)).

**Promises:** Output is a MATLAB variable containing the content of `filename`.

4. `pseudonym/report.m`

**Expects:** A MATLAB variable containing bivariate (X and Y) data.

**Promises:** Produces a file, formatted in Markdown, that presents the mean and covariance of the data in a human-readable way and uses some basic formatting (e.g., the report should have a title, present the results as a bullet point list, maybe tells us the date, etc.).

5. `pseudonym/test.m`

**Expects:** No input.

**Promises:** Runs a basic test suite of the functions in the package, making sure they all work without errors as intended (or with errors if that is intended) and give the expected output.

6. `pseudonym/main.m` 

**Expects:** No input.

**Promises:** After running this function, your package directory should contain a report file named `pseudonym-1.md` that contains the mean and covariance of the bivariate data that are contained in [http://cidlab.com/files/cogs205b.csv](http://cidlab.com/files/cogs205b.csv) at the time it was run.

7. `pseudonym/Contents.m` 

**Expects:** No input.

**Promises:** Contains help text for all functions in the package, which is displayed when a user executes `help pseudonym`.  Note that you can automatically generate this file using [these steps](https://www.mathworks.com/help/matlab/matlab_prog/create-a-help-summary-contents-m.html) if you added comments to the top of each function.

---

* You may want to add additional functions, be sure to add+commit those.
* Follow principles of contract programming and test driven development.