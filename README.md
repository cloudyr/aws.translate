# Machine Translation from AWS Translate

**aws.translate** is a package for [AWS Translate](https://aws.amazon.com/translate/), an Amazon Web Services machine translation web service.

To use the package, you will need an AWS account and to enter your credentials into R. Your keypair can be generated on the [IAM Management Console](https://aws.amazon.com/) under the heading *Access Keys*. Note that you only have access to your secret key once. After it is generated, you need to save it in a secure location. New keypairs can be generated at any time if yours has been lost, stolen, or forgotten. The [**aws.iam** package](https://github.com/cloudyr/aws.iam) profiles tools for working with IAM, including creating roles, users, groups, and credentials programmatically; it is not needed to *use* IAM credentials.

A detailed description of how credentials can be specified is provided at: https://github.com/cloudyr/aws.signature/. The easiest way is to simply set environment variables on the command line prior to starting R or via an `Renviron.site` or `.Renviron` file, which are used to set environment variables in R during startup (see `? Startup`). They can be also set within R:

```R
Sys.setenv("AWS_ACCESS_KEY_ID" = "mykey",
           "AWS_SECRET_ACCESS_KEY" = "mysecretkey",
           "AWS_DEFAULT_REGION" = "us-east-1",
           "AWS_SESSION_TOKEN" = "mytoken")
```


## Code Examples

The basic use of the package is super simple and revolves around the `translate()` function, which takes a character string as input:


```r
library("aws.translate")

# translate some text from English
translate("Bonjour le monde!", from = "fr", to = "en")
```

```
## [1] "Hello, world!"
## attr(,"SourceLanguageCode")
## [1] "fr"
## attr(,"TargetLanguageCode")
## [1] "en"
```

```r
# translate some text to English
translate("Hola mundo!", from = "auto", to = "en")
```

```
## [1] "Hello world!"
## attr(,"SourceLanguageCode")
## [1] "es"
## attr(,"TargetLanguageCode")
## [1] "en"
```

## Installation

[![CRAN](https://www.r-pkg.org/badges/version/aws.translate)](https://cran.r-project.org/package=aws.translate)
![Downloads](https://cranlogs.r-pkg.org/badges/aws.translate)
[![Build Status](https://travis-ci.org/cloudyr/aws.translate.png?branch=master)](https://travis-ci.org/cloudyr/aws.translate)
[![codecov.io](https://codecov.io/github/cloudyr/aws.translate/coverage.svg?branch=master)](https://codecov.io/github/cloudyr/aws.translate?branch=master)

This package is not yet on CRAN. To install the latest development version you can install from the cloudyr drat repository:

```R
# latest stable version
install.packages("aws.translate", repos = c(getOption("repos"), "http://cloudyr.github.io/drat"))
```

Or, to pull a potentially unstable version directly from GitHub:

```R
if(!require("remotes")){
    install.packages("remotes")
}
remotes::install_github("cloudyr/aws.translate")
```

---
[![cloudyr project logo](http://i.imgur.com/JHS98Y7.png)](https://github.com/cloudyr)
