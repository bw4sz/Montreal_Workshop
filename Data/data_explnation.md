Data description
================
I. Bartomeus
12/1/2016

Data collected in 2015 across 16 sites. Each site was visited 7 times. Each time we recorded three data types:

-   All interactions in 100 m transects (`transects`)
-   Focal interactions to selected plants (`focal`)
-   Oportunistic new interactions not detected by the last two methods (`out`)

there are three datasets so far:

**Interactions:** This include `transect`, `visitation` and `out` data. Data can be used pooled (2067 interactions (5732 visits) general question abouts trait matching) or splited by site (`Site_ID`) and `Round`.

``` r
int <- read.csv("interactions.csv", h = T)
head(int)
```

    ##      Site_ID Round           Plant_gen_sp   Pollinator_gen_sp      Out
    ## 1 Aznalcazar     1     Teucrium fruticans   Anthophora dispar transect
    ## 2    Bonares     1       Cistus ladanifer       Empis morpho1 transect
    ## 3    Elpinar     6   Convolvulus arvensis Systropha planidens      out
    ## 4     Niebla     7      Taraxacum vulgare         Halictus sp transect
    ## 5    Bonares     7      Thymus mastichina  Halictus scabiosae transect
    ## 6   LaRocina     4 Rosmarinus officinalis        Sphecodes sp transect
    ##   Pollinator_sex Frequency
    ## 1           male         2
    ## 2           male         2
    ## 3           male         1
    ## 4         female         3
    ## 5         female         2
    ## 6         female         7

``` r
nrow(int)
```

    ## [1] 2067

``` r
sum(int$Frequency, na.rm = TRUE)
```

    ## [1] 5732

Challenges:
- long tail of singletones
- not all species are taxonomically resolved. What to do with specimens we ony know Genus?
- Low sample size when you split per site and round

**pollinator traits:**

``` r
pol_tr <- read.csv("traits_pollinators.csv", h = T)
head(pol_tr)
```

    ##              Pollinator_gen_sp       IT tongue     family
    ## 1            Ammophila heydini 1.775373     NA       <NA>
    ## 2 Ancistrocerus biphalateratus 2.881955     NA       <NA>
    ## 3        Ancistrocerus gazella 1.889862     NA       <NA>
    ## 4            Andrena angustior       NA     NA Andrenidae
    ## 5              Andrena cinerea       NA     NA Andrenidae
    ## 6       Andrena ferrugineicrus       NA     NA Andrenidae

**NOTE:** Quite a lot of NA's still.

Challenges:
- We are not sure which trait are driving interactions (quite generalized system)
- Need to inegrate traits across different orders (e.g. tongue lengths can be set to zero for coleoptera)

**plant traits:**

``` r
plant_tr <- read.csv("traits_plants.csv", h = T)
head(plant_tr)
```

    ##             Plant_gen_sp         family flower_morphology      flower_form
    ## 1         Anchusa azurea   Boraginaceae     Actinomorphic        disc bowl
    ## 2  Andryala integrifolia     Asteraceae     Actinomorphic        disc bowl
    ## 3   Arctotheca calendula     Asteraceae     Actinomorphic        disc bowl
    ## 4       Armeria velutina Plumbaginaceae     Actinomorphic      restrictive
    ## 5  Asphodelus fistulosus  Asphodelaceae     Actinomorphic        disc bowl
    ## 6 Astragalus lusitanicus       Fabaceae       Zigomorphic very restrictive
    ##   nectar_tube_diameter_mm nectar_tube_depth_mm flower_width_mm
    ## 1                   3.686                7.974          18.265
    ## 2                   0.490                5.800           0.490
    ## 3                   0.480                3.800           0.480
    ## 4                   6.540                8.040           9.000
    ## 5                   0.000                0.000          25.000
    ## 6                   5.950               11.900          16.800

Those are complete.

**independent plant flower abundance**: Ca be combined by Site\_ID and Round

``` r
flw <- read.csv("flowers.csv", h = T)
head(flw)
```

    ##      Site_ID Round           Plant_gen_sp Flower_abundance
    ## 1 Aznalcazar     1  Asphodelus fistulosus               50
    ## 2 Aznalcazar     1       Cistus ladanifer                1
    ## 3 Aznalcazar     1 Rosmarinus officinalis               14
    ## 4 Aznalcazar     1     Teucrium fruticans               13
    ## 5 Aznalcazar     2 Rosmarinus officinalis               11
    ## 6 Aznalcazar     2     Teucrium fruticans               24

**Phylogenies** Need to do. - Plants: Phylomatic? - Pollinators: Bees available at genus level only. For other orders I have no idea.

combining data
==============

Question: should we use the pooled data for the package?

``` r
temp <- merge(int, pol_tr, by.x = "Pollinator_gen_sp", by.y = "Pollinator_gen_sp", all.x = TRUE)
temp2 <- merge(temp, plant_tr, by.x = "Plant_gen_sp", by.y = "Plant_gen_sp", all.x = TRUE)
pooled_data <- temp2
head(pooled_data)
```

    ##       Plant_gen_sp        Pollinator_gen_sp         Site_ID Round Out
    ## 1 Acacia adealbata Lasioglossum leucozonium ConventodelaLuz     7 out
    ## 2 Acacia adealbata Lasioglossum leucozonium ConventodelaLuz     7 out
    ## 3 Acacia adealbata Lasioglossum leucozonium ConventodelaLuz     7 out
    ## 4 Acacia adealbata     Eristalinus taeniops ConventodelaLuz     7 out
    ## 5 Acacia adealbata     Eristalinus taeniops ConventodelaLuz     7 out
    ## 6 Acacia adealbata             Eristalis sp ConventodelaLuz     7 out
    ##   Pollinator_sex Frequency       IT   tongue   family.x family.y
    ## 1           male         1       NA       NA Halictidae     <NA>
    ## 2           male         5       NA       NA Halictidae     <NA>
    ## 3           male         2       NA       NA Halictidae     <NA>
    ## 4           male         2 4.118782 1.869784  Syrphidae     <NA>
    ## 5         female         2 4.118782 1.869784  Syrphidae     <NA>
    ## 6           <NA>         6       NA       NA       <NA>     <NA>
    ##   flower_morphology flower_form nectar_tube_diameter_mm
    ## 1              <NA>        <NA>                      NA
    ## 2              <NA>        <NA>                      NA
    ## 3              <NA>        <NA>                      NA
    ## 4              <NA>        <NA>                      NA
    ## 5              <NA>        <NA>                      NA
    ## 6              <NA>        <NA>                      NA
    ##   nectar_tube_depth_mm flower_width_mm
    ## 1                   NA              NA
    ## 2                   NA              NA
    ## 3                   NA              NA
    ## 4                   NA              NA
    ## 5                   NA              NA
    ## 6                   NA              NA
