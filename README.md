dataproofr
================

dataproofr is a wrapper for the excellent
[Dataproofer](https://github.com/dataproofer/Dataproofer) Node.js
package. It automatically checks for a series of potential errors and
mistakes in a dataset. It ca check for missing or duplicated data,
database export errors, invalid geographical coordinates and more.

## Installation

You can install `dataproofr` with the following command:

``` r
remotes::install_github("nicucalcea/dataproofr")
```

Since dataproofr uses the
[Dataproofer](https://github.com/dataproofer/Dataproofer) package under
the hood, it will need [Node.js](https://nodejs.org/en/download/) and
[npm](https://www.npmjs.com/package/download) installed on your device.

You can run `node_available()` to check whether the necessary software
is installed. If it’s not, install it to use `dataproofr`.

After you’ve confirmed that Node.js and npm are installed, run the
following command to install
[Dataproofer](https://github.com/dataproofer/Dataproofer):

``` r
dataproofer_install()
```

### RStudio

If you're an RStudio user, double-check that your R Console and R Terminal are using the same environments to ensure you're using the same version of Node.js and Dataproofer.

R Console

```r
Sys.getenv("PATH")
```

R Terminal

```sh
echo $PATH
```

If they do not match, you can synchronize the two by creating an `~/.Renviron` file in the terminal.

```sh
touch ~/.Renviron; R_PATH="PATH=$PATH"; echo $R_PATH > ~/.Renviron
```

## Using dataproofr

The most straightforward way to use the library is this:

``` r
proof(iris)
```

There are a few optional arguments you can use. Among other things, you
can specify which suite of tests to run with `suite`, call individual
tests with `tests`, or you can output the result of the tests to a local
JSON file with `out`.

``` r
proof(iris,
      tests = c("duplicate rows", "empty cells"),
      out = "results.json", out_format = "json-pretty")
```

Alternatively, you can use `proof_custom()` with the arguments from the
[original Node.js package](https://github.com/dataproofer/Dataproofer):

``` r
proof_custom(iris, options = "--core --summary")
```

You can run `proof_custom(iris, options = "--help")` for a full list of
commands.
