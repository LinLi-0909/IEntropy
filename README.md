## Contents

- [Overview](#overview)
- [Installation Guide](#installation-guide)
- [Tutorial](#tutorial)
- [License](./LICENSE)
- [Citation](#citation)
- [Contact](#Contact)

## Overview
Recent advances of single-cell RNA sequencing (scRNA-seq) technologies have led
extensive study on cellular heterogeneity and cell-to-cell variation. However, the high
frequency of dropout events and noise in scRNA-seq data confound the accuracy of the
downstream analysis, i.e., clustering analysis, whose accuracy depends heavily on the
selected feature genes.Here, by deriving entropy decomposition formula, we proposed a feature selection
method, intrinsic entropy (IE) model, to identify the informative genes for accurately
clustering analysis

## Installation Guide
**Installing dependency package**  
Before installing IEntropy, the “rsvd” package should be installed first:
```
install.packages("rsvd")
```
**Installing IEntropy**  
To install IEntropy, run:
```
install.packages('devtools')
library(devtools)
install_github('LinLi-0909/IEntropy/IEntropy')
library(IEntropy)
```

## Tutorial

## Contact
Please contact us:  
Lin Li: lilin6@sibcb.ac.cn

## Copyright
©2021 Lin Li [Chen Lab]. All rights reserved.
