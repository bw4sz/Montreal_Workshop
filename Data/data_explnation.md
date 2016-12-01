Data description
================
I. Bartomeus
12/1/2016

**Note:** This data needs more curation and can be used to play with methods, but needs taxonomic unification, better traits, etc... before looking at results.

Data collected in 2015 across 16 sites. Each site was visited 7 times. Each time we recorded three data types:

-   All interactions in 100 m transects
-   Focal interactions to selected plants
-   Oportunistic new interactions not detected by the last two methods (`out`)

there are three datasets so far:

**Interactions:** This include `transect` and `visitation` data. Data can be used pooled (1445 interactions (5643 visits) general question abouts trait matching) or splited by site (`Site_ID`) and `Round`. Pollinator traits in this table are measured per individual.

``` r
int <- read.csv("interactions.csv", h = T)
head(int)
```

    ##      Site_ID Round Frequency     data tongue_length       IT
    ## 1 Aznalcazar     1         2 transect      4.788663 4.987944
    ## 2    Bonares     1         2 transect            NA       NA
    ## 3   El pinar     6         1      out      2.373156 2.597441
    ## 4     Niebla     7         3 transect            NA 2.821429
    ## 5    Bonares     7         2 transect            NA 2.679600
    ## 6  La Rocina     4         7 transect            NA 2.950436
    ##                    plant                 pol
    ## 1     Teucrium_fruticans   Anthophora_dispar
    ## 2       Cistus_ladanifer            Empis_sp
    ## 3   Convolvulus_arvensis Systropha_planidens
    ## 4      Taraxacum_vulgare         Halictus_sp
    ## 5      Thymus_mastichina  Halictus_scabiosae
    ## 6 Rosmarinus_officinalis        Sphecodes_sp

``` r
nrow(int)
```

    ## [1] 1445

``` r
sum(int$Frequency, na.rm = TRUE)
```

    ## [1] 5643

Challenges:
- long tail of singletones
- not all species are taxonomically resolved. What to do with specimens we ony know Genus?
- Low sample size when you split per site and round

**pollinator traits:**

``` r
pol_tr <- read.csv("traits_pollinators.csv", h = T)
head(pol_tr)
```

    ##                       pol       IT   tongue tongue_estimated
    ## 1    Agapanthia_asphodeli       NA       NA               NA
    ## 2       Amegilla_albigena 3.634712 6.552491               NA
    ## 3       Amegilla_fasciata 3.765542 6.696830               NA
    ## 4 Amegilla_quadrifasciata 4.541124 8.392990               NA
    ## 5       Ammophila_heydini 1.775373       NA               NA
    ## 6         Andrena_abrupta       NA       NA               NA

Challenges:
- We are not sure which trait are driving interactions (quite generalized system)
- Need to inegrate traits across different orders

**plant traits:** Not ready yet

**independent plant flower abundance**: Ca be combined by Site\_ID and Round

``` r
flw <- read.csv("flowers.csv", h = T)
head(flw)
```

    ##      Site_ID Round Plot Plant_genus Plant_species Flower_abundance
    ## 1 Aznalcazar     1    1  Asphodelus    fistulosus               50
    ## 2 Aznalcazar     1    5    Teucrium     fruticans               12
    ## 3 Aznalcazar     1    6    Teucrium     fruticans                1
    ## 4 Aznalcazar     1    8  Rosmarinus   officinalis                6
    ## 5 Aznalcazar     1    9      Cistus     ladanifer                1
    ## 6 Aznalcazar     1    9  Rosmarinus   officinalis                8

**Phylogenies** work in progress.
- Plants: Phylomatic
- Pollinators: Available at genus level only
