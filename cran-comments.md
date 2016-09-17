This is the first submission of `downsize` to CRAN. 

When I tested via `R CMD CHECK --as-cran` in R 3.3.1 on Mac OS 10.11.6, the only irregularity was

```
* checking CRAN incoming feasibility ... NOTE
Maintainer: ‘Landau William <will.landau@gmail.com>’

New submission
```

I also tested via `devtools::check_built(.., cran = TRUE)` in R 3.3.1 on Microsoft Windows Server 2012 R2 Base (via Amazon Web Services). I did not get the note above, but I did see a warning.


```
WARNING 'qpdf' is needed for checks on size reduction of PDFs
```

However, at the end of the check, the total number of `R CMD CHECK` warnings was shown as zero. I expect this warning came about because I have a vignette (HTML, not pdf, though) and I was using a brand new Amazon Web Services EC2 instance. No pdf files are in the build.
