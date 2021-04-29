# False Position
Finds the root of a function using false position method

---

## Description

Ultimate goal is to find the 0!
While typically superior to the bisection method, check by hand to
guarantee the results you want. If not, look into the bisect() function
for cross reference. Keep in mind that even though this is a closed method that is usually rather fast, some situations may make bisection faster

---

## Inputs
-   func = user inputs the function that they wish to have evaluated
-   xl = Users lower guess for the root
-   xu = Users upper guess for the root
-   es = Users desired relative error, Type as a percentage (defaults to 0.0001%)
-   maxit = Maximum number of iterations this program will use (defaults to 200)
-   varargin = allows program to accept any number of input arguments

---

## Outputs
-   root = Estimated root location
-   fx = function that got evaluated at said location of root
-   ea = approximate relative error (%)
-   iter = the number of iterations which were preformed
