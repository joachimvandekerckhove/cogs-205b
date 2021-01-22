# MATLAB code organization

## Calling system commands: system(), !

## Functions and scripts

### Basic scoping
In every programming language, we use names to refer to things -- functions, variables, objects, and so on.  This link between a name and a thing is called **name binding**.

Name bindings are context specific.  The variable `foo` can refer to one thing in one program and to another thing in another program.

Scope rules are the rules that determine where a specific name binding is valid.

### Scripts
In MATLAB, the **workspace** is one scope.  Scripts work in the workspace scope.

This has mostly disadvantages.  Most importantly, running a script _twice_ can easily give different results if a variable was changed in the course of the script.

### Functions
MATLAB functions have their own scope.  You can make variables inside a function, overwrite them and delete them, and they will not affect the workspace (unless you explicitly try).

MATLAB's `function-end statement` defines a scope.

#### Intermediate scoping
You can define a function inside another function's `function-end statement`.  Such nested functions _can_ share variables with their parent function.

You can also define a second function in another function's m-file but outside the `function-end statement`.  Such subfunctions cannot share variables with their parent function.

#### Anonymous functions

You can also define functions "on the fly" inside a script or another function.  Such anonymous functions can _see_ the variables in their parent scope but can't _change_ them.  Anonymous functions can be saved as variables, which will be incredibly useful soon.

    myAnonFun = @(x,y) sprintf('%d^%d = %g', x,y,x^y)

Anonymous functions can store variables:

    >> a = 5;
    >> timesA = @(x) x * a;
    >> timesA(3)
    ans =
        15
    >> a = 4;
    >> timesA(3)
    ans =
        15

#### Default inputs
MATLAB functions start with a template line that defines the input and output variables:

    function [myOutput, secondOut] = thisIsFun(firstIn, another)

There's a function, `nargin` that counts the number of input arguments (there's also `nargout`, the purpose of which I will let you figure out on your own).  So this is a common structure:

    if nargin < 2
        another = 1;      % default in case only one was provided
        if nargin < 1
            firstIn = 0;  % default in case no input was provided
        end
    end

## Reading and writing text files
### Printing to the console
#### Format strings
sprintf(), fprintf()

### Getting input from the console
input()

## @classes and +packages
### Advanced scoping
### Class files, class folders
Constructors, methods, properties, inheritance
### Package folders
