Assignment 3
================

For this assignment we are using a dataset from the website [Fivethirtyeight](http://fivethirtyeight.com/). All these datasets are available on their [GitHub page](https://github.com/fivethirtyeight/data/) and in the `fivethirtyeight` package.

1.  Install and load the `fivethirtyeight` library. For this assigment we are using the dataset `bad_drivers`.

The fivethirtyeight and all other dependencies are loaded.

1.  In the narrative, add a brief description (`?bad_drivers` for a description of the dataset) using *inline code* to show the variable names.

The Variable names for bad\_drivers: state, num\_drivers, perc\_speeding, perc\_alcohol, perc\_not\_distracted, perc\_no\_previous, insurance\_premiums, losses

1.  Plot a dot chart of premiums by losses. Map the count of drivers to the size of the dots.

![](README_files/figure-markdown_github/unnamed-chunk-1-1.png)

1.  Test what values from `state` are equal to "Louisiana" and assign the output to a new variable called \`Louisiana' (logical)

``` r
Louisiana <- bad_drivers %>%
  filter(state == "Louisiana") 
```

1.  Map the variable "Louisiana" to `color`. That way, the dot referring to Louisiana should have a different color.

![](README_files/figure-markdown_github/unnamed-chunk-3-1.png)

1.  In your narrative, use inline code to report the average insurance premium and count of losses in US, and the premium and losses in Louisiana. Do not type those values manually, but extract them from the dataset using inline code.

The average insurance premium in US is 886.9576471 and the count of losses is 6859.15. The average insurance premium in Louisiana is 1281.55 and the count of losses is 194.78.

1.  Report in a tabular format the 5 states with the highest premiums (include only state and insurance\_premiums)

``` r
bad_drivers %>% 
  arrange(desc(insurance_premiums)) %>%
  select(state, insurance_premiums) %>%
  head(n=5)
```

    ## # A tibble: 5 x 2
    ##   state                insurance_premiums
    ##   <chr>                             <dbl>
    ## 1 New Jersey                        1302.
    ## 2 Louisiana                         1282.
    ## 3 District of Columbia              1274.
    ## 4 New York                          1234.
    ## 5 Florida                           1160.

1.  Reshape the dataset gathering together perc\_speeding, perc\_alcohol, perc\_not\_distracted in one variable, paired with their pecentages. Name this variable "ViolationType" and the variable for the value pairs "perc".

``` r
gather(bad_drivers, key = 'perc', value = 'ViolationType', perc_alcohol, perc_speeding, perc_not_distracted)
```

    ## # A tibble: 153 x 7
    ##    state num_drivers perc_no_previous insurance_premi~ losses perc 
    ##    <chr>       <dbl>            <int>            <dbl>  <dbl> <chr>
    ##  1 Alab~        18.8               80             785.   145. perc~
    ##  2 Alas~        18.1               94            1053.   134. perc~
    ##  3 Ariz~        18.6               96             899.   110. perc~
    ##  4 Arka~        22.4               95             827.   142. perc~
    ##  5 Cali~        12                 89             878.   166. perc~
    ##  6 Colo~        13.6               95             836.   140. perc~
    ##  7 Conn~        10.8               82            1069.   167. perc~
    ##  8 Dela~        16.2               99            1138.   151. perc~
    ##  9 Dist~         5.9              100            1274.   136. perc~
    ## 10 Flor~        17.9               94            1160.   144. perc~
    ## # ... with 143 more rows, and 1 more variable: ViolationType <int>

1.  Use facetting (DO NOT use 3 distinct calls to `ggplot()`) to plot 3 dot plots for the correlation between:

-   insurance\_premiums and perc\_alcohol
-   insurance\_premiums and perc\_speeding
-   insurance\_premiums and perc\_not\_distracted

``` r
gather(bad_drivers, key = 'perc', value = 'ViolationType', perc_alcohol, perc_speeding, perc_not_distracted) %>%
 ggplot() +
  geom_point(aes(x= ViolationType, y = insurance_premiums)) +
    facet_wrap(~perc)
```

![](README_files/figure-markdown_github/unnamed-chunk-6-1.png)

1.  Mute the code for both charts and add a title to both. Knit to html.
