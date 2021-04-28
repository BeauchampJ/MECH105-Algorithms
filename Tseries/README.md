# T-Series
An algorithm that takes the taylor series of a function

---

## Description

This algorithm allows the user to input a function using matlab symbolic toolbox and specify the stopping criterion and/or the iterations. Then they will recieve the f value that was approximated at the xi+1 value.

---

## Inputs
-   f-a symbolic function with an f(x)
-   xi-Value we know
-   xiplus-Value we want to solve for
-   es-Relative error that the user wants (auto 0.1%) (type as %
-   maxit-max orders the user wants to take it to (auto 10)

---

## Outputs
-   Result: Number at this point
-   Order: What order we're at
-   error: Whats our error (%)
-   et: total error

---

## TODO
- [x] Clean up code to make it more clean
- [ ] Fix maxit and iter inputs so you can leave one blank
- [ ] Remove symbolic toolkit requirement
