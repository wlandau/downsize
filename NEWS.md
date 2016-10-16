# 2016-10-16

Version 0.2.0 is on CRAN. Here are the changes.

- Correct the author and maintainer name. Should be "William Landau", not "Landau William".
- Deprecate functions `scale_down()`, `scale_up()`, and `scaling()` in favor of `test_mode()`, `production_mode()`, and `my_mode()`. The new naming convention is clearer and more appropriate. 
- Add `help_downsize()` to print out helpful links to tutorials, instructions for troubleshooting, etc.
- Change the help files and vignette to reflect all these changes.

I explain downsize to people in terms of test and production modes, so it seemed natural to change the naming convention. If I had thought ahead, I might have named the package "testmode" and broadened the scope. Too late for that now.


# 2016-09-21

I am already planning v0.2.0, and I implemented the most important changes in release v0.1.1 (GitHub only). The main updates are these.

- The author and maintainer fields in the DESCRIPTION are corrected.
- There is a new `help_downsize()` function that outputs links to the vignette, troubleshooting instructions, and issues page (for bug reports, questions, and feature requests).


# 2016-09-21

Downsize v0.1.0 is on CRAN!


# 2016-09-19

Versions 0.0.0 and 0.1.0 are released. In v0.1.0, the `ds()` function is deprecated. Use `downsize()` instead for new projects. Also, `scaling()` now returns either `"scaled down"` or `"scaled up"`. In addition, v0.1.0 supports the selection of entire code blocks based on the scaling of the workload. See the vignette for examples.


# 2016-09-17

Version 0.0.0 is under development, and the initial submission to CRAN is pending.
