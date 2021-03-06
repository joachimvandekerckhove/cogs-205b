class: center, middle

# MATLAB code organization
.right[Joachim Vandekerckhove]
.right[Winter 2021]

---

## Calling system commands

    system()
    
    !

---

## Functions and scripts

### Basic scoping
In every programming language, we use names to refer to things -- functions, variables, objects, and so on.  This link between a name and a thing is called **name binding**.

Name bindings are context specific.  The variable `foo` can refer to one thing in one program and to another thing in another program.

Scope rules are the rules that determine where a specific name binding is valid.

---

### Scripts
In MATLAB, the **workspace** is one scope.  Scripts work in the workspace scope.

This has mostly disadvantages.  Most importantly, running a script _twice_ can easily give different results if a variable was changed in the course of the script.

The main use case of a script is if you are automating an entire MATLAB session (e.g., running in batch mode on the cluster).

---


### Functions
MATLAB functions have their own scope.  You can make variables inside a function, overwrite them and delete them, and they will not affect the workspace (unless you explicitly try, which you shouldn't, it's very rude).

MATLAB's `function-end statement` defines a scope.

---


#### Intermediate scoping
You can define a function inside another function's `function-end statement`.  Such nested functions _can_ share variables with their parent function.

You can also define a second function in another function's m-file but outside the `function-end statement`.  Such subfunctions cannot share variables with their parent function.

---


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

---


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

---

## Reading and writing text files

    uiimport()
    readmatrix(), writematrix()
    readcell(), writecell()
    readtable(), writetable()

### Getting input from the console

    input()

---


### Printing to the console

Unformatted printing

    disp()

Formatted printing and format strings

    sprintf()
    fprintf()

---


### Printing to a file

Streams and file IDs

    fopen(), fclose()
    fprintf()

### Low-level I/O

Pointers in streams

    fscanf()

A relatively general-purpose structure is this:

    fid = fopen('myFile.ext');
    while ~feof(fid)
        buffer = fgetl();  % read until next line break
        % do something depending on line
    end
    fclose(fid);

---

## @classes and +packages

### Object-oriented programming

Object-oriented programming involves thinking of problems as interactions between entities.

A class is a set of objects with similar features.  A typical kind of class is a `User` or a `Product`.  MATLAB objects have _properties_ (variables that belong to it) and _methods_ (functions that belong to it).

Classes can exist in a hierarchy, where they inherit properties or methods from superclasses.

---


### Methods

Constructor -- `className()`

Display -- `disp()`

Getters -- `get.MyProperty()`

Setters -- `set.MyProperty()`

Ordinary methods -- `obj.someMethod()` or (equivalently) `someMethod(obj)`

Static methods -- `someMethod()` (does not take an object as input)

---


### Class files, class folders

There are two ways to define a MATLAB class.  You can define a class in its own file (which will get large), or you can define it in many files inside a dedicated folder that starts with an `@`.

Class methods and properties are _scoped to the class_; they can be _public_ (visible externally), _private_ (visible only to other methods in the class), or _protected_ (also visible to child class methods).  They can be given a number of attributes.

---


### A class

    classdef LabResult
       properties
          CurrentValue
       end
       properties (Transient)
          Status
       end
       methods
          function obj = LabResult(cv)
             obj.CurrentValue = cv;
             obj = assignStatus(obj);
          end
          function obj = assignStatus(obj)
             if obj.CurrentValue < 10
                 obj.Status = 'Too low';
             else 
                 obj.Status = 'Too high';
             end
          end
       end
       methods (Static)
          function obj = loadobj(s)
             if isstruct(s) 
                 obj = LabResults(s.CurrentValue);
             else 
                 obj = assignStatus(s);
             end
          end
       end
    end

---

### Package folders

MATLAB is very widely used and many people contribute code to it.  Function name clashes are somewhat inevitable.  This is where **package folders** come in handy.

A package folder is just a folder whose name starts with `+`. 
 
Names of classes and functions are _scoped to the package folder_.  Internally, they all see each other.  Externally, you have to prepend the package name (i.e., you can call functions in the package with `myPackage.myFun` and you can create classes with `myPackage.myClass`).


---

## Use cases

**Classes** are most useful when you have multiple functions that operate on a similar kind of data or type of variable.

**Packages** are most useful when you have many functions that functionally belong together but aren't necessarily associated with a particular kind of input.

---

## Assignment

Make a +package called /+\<your-pseudonym\> with just a class `@Norm2d`

* `@norm2d % implements the bivariate normal likelihood equivalence class` 
* Has at least the properties `Mean` (2x1 vector) and `Covariance` (2x2 matrix)
* Include getters/setters and these six methods: (log)pdf, (log)cdf, rand, deviance
* Make sure everything works on matrix input
* Avoid duplicating code