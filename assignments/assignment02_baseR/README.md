Assignment 2
================
Mohamed Jabbar

The goal of this practice is to improve your understanding of vectors and how to manipulate them. The data we use are the prices of the [2017 Big Mac Index](http://www.economist.com/content/big-mac-index).

For each question, please create a new chunck with your reponse. Use narratives to comment the output whenever the question requires to do so.

1.  Edit the code below to assign country names to the vector `countries` and prices to the vector `prices`. Hide the code below when you knit (check the Rmarkdown cheatsheet to find the appropriate chunk option to hide code).

2.  Use `typeof()` to report the type of both vectors.

``` r
typeof(countries)
```

    ## [1] "character"

``` r
typeof(prices)
```

    ## [1] "double"

1.  Use `names()` to name the `prices` using `countries`. Show the first 5 values of your new vector

``` r
`names<-`(prices, countries)[1:5]
```

    ## Argentina Australia    Brazil   Britain    Canada 
    ##  4.125534  4.527955  5.101568  4.111432  4.655697

1.  Use `round()` to round the prices at the 3rd decimal. Overwrite `prices` with the rounded prices.

``` r
round(prices, digits = 3)
```

    ##  [1] 4.126 4.528 5.102 4.111 4.656 3.844 2.917 3.244 4.000 3.281 4.606
    ## [12] 1.754 4.465 2.458 3.209 2.757 2.403 4.773 3.361 2.003 2.754 4.432
    ## [23] 5.914 3.566 3.229 2.649 2.723 2.278 3.200 4.065 2.261 3.844 3.773
    ## [34] 5.819 6.742 2.264 3.496 3.006 3.812 1.698 5.300 4.529 4.056 2.639
    ## [45] 3.883 4.625 3.597 5.207 4.682 4.454 3.826 4.648 4.796 4.122 3.711
    ## [56] 4.339

1.  Use indexing to report the prices for Canada, United States, Mexico

``` r
`names<-`(prices, countries) [c(5,41,21)]
```

    ##        Canada United States        Mexico 
    ##      4.655697      5.300000      2.754240

1.  Use inline code and the function `length()` to display the following sentence:

"There are x observations in the Big-Mac Index"

There are 56 observations in the Big-Mac Index

1.  Convert the prices from Dollar to Euro (1 Dollar = .83 Euro). In the narrative, comment about the property which allows you to combine a vector of length 1 (the exchange rate) with a vector of length 56 (the prices).

``` r
#This function is used to convert a dollar amount to Euro

euro_ex <- .86    #Defined in the global enviroment - 2 levels up

convertToEuro <- function(dollars) {      
  x <- dollars
  conv_toEuro <- function() paste(x*euro_ex, 'Euros')
  c(conv_toEuro())
}

convertToEuro(prices)
```

    ##  [1] "3.54795933402092 Euros" "3.8940413 Euros"       
    ##  [3] "4.38734811242 Euros"    "3.53583109 Euros"      
    ##  [5] "4.00389924354675 Euros" "3.30592216837139 Euros"
    ##  [7] "2.50872928176795 Euros" "2.78949989515622 Euros"
    ##  [9] "3.44003004393051 Euros" "2.82200375392127 Euros"
    ## [11] "3.96158186885322 Euros" "1.50842605535365 Euros"
    ## [13] "3.83992107 Euros"       "2.1138065672406 Euros" 
    ## [15] "2.7596948745067 Euros"  "2.37121945552415 Euros"
    ## [17] "2.06652156026777 Euros" "4.10506990538059 Euros"
    ## [19] "2.89050061914028 Euros" "1.7226039361826 Euros" 
    ## [21] "2.36864662816351 Euros" "3.8117436 Euros"       
    ## [23] "5.08617776275769 Euros" "3.06704707560628 Euros"
    ## [25] "2.77717976318622 Euros" "2.2785285656382 Euros" 
    ## [27] "2.34212371245214 Euros" "1.95919643347096 Euros"
    ## [29] "2.75188992440303 Euros" "3.49568120781012 Euros"
    ## [31] "1.94423511680482 Euros" "3.30581400428079 Euros"
    ## [33] "3.24475524475525 Euros" "5.0042718031287 Euros" 
    ## [35] "5.79785303116735 Euros" "1.94701008941022 Euros"
    ## [37] "3.00677214167144 Euros" "2.58525468044351 Euros"
    ## [39] "3.277974407841 Euros"   "1.46015820953116 Euros"
    ## [41] "4.558 Euros"            "3.89479184811008 Euros"
    ## [43] "3.48777777777778 Euros" "2.26987792807655 Euros"
    ## [45] "3.3390618 Euros"        "3.97741185 Euros"      
    ## [47] "3.09354255 Euros"       "4.47827112 Euros"      
    ## [49] "4.0265157 Euros"        "3.8301003 Euros"       
    ## [51] "3.28995795 Euros"       "3.99705339 Euros"      
    ## [53] "4.1247234 Euros"        "3.54529797 Euros"      
    ## [55] "3.19175025 Euros"       "3.7318926 Euros"

Using the vector 'prices' as the input of the functions allows the function to automatically itterate through the full vector of 'prices'. This is due to R detecting the type of variable that is being used.

-   Could you use the vector `rep(.83, 28)` to do the same?

    No, it cannot do the same.

-   Could you use the vector `rep(.83, 112)` to do the same?

    No, it cannot do the same.

-   Would `rep(.83, 45)` also work? Why?

    No, it cannot do the same. This function will replicate the variable '.83' 45 times.

1.  In your narrative, mention that we are going to drop the 46th element. Use dynamic code to report the country that will drop.

The 46th element of countries is being dropped.

``` r
countries[46]
```

    ## [1] "Belgium"

1.  Overwrite the vector of prices with a new vector without observation 46. Use `length()` to make sure you have one observation less.

``` r
prices <- prices[!prices %in% prices[c(46)]]
length(prices)
```

    ## [1] 55

1.  Knit, commit and push to your GitHub repo `assignment`. Then submit the link to the *assignment folder* on Moodle.
