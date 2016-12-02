---
title: Characterizing phylogenetic information to input in models of biotic interactions
  as a surrogate/proxy for traits
output: html_document
---

# Rationale: 

Phylogenetic information can be utilize as a surrogate for traits or as complementary information in the models 


# Phylogenetic data input and pre-treatment: 
```{r}

## Load packages
lapply(c("phytools","geiger"), require, character.only=T)

## Load phylogeny/ies
#tree<-read.nexus("my.phylogeny.nex") 

#tree2<-read.nexus("my.phylogeny2.nex") ## whenever using a bipartite network and there is phylogenetic information for both sides

## Simulate phylogeny (only if necessary) 
nsps=100
tree <- sim.bdtree(0.5, n=nsps)  ## simulates tree based on birth-death process with birth rate = 0.5 and no extinction
tree <-  rescale(tree, "lambda", 0.5) ## re-scale the tree according to evolutionary model of interest
plot(tree)

## Check that names in tree coincide with names in species list
Species.names<-rownames(Interaction.Matrix) ## change for appropriate name
Phylo.names<-tree$tip.label

## prune species if necessary (only if the phylogeny has species not in the list
if(sum(which(!Phylo.names%in%Species.names))>0){
prunned.tree<-drop.tip(tree, which(!Phylo.names%in%Species.names))
}

```


# Approaches: 

Three different approaches are provided to include phylogenetic information

Approach 1. Matrix of phylogenetic distances
  
```{r}
## computes the matrix of phylogenetic pairwise distances 
## distances are squared-rooted
phylo.distance<-sqrt(cophenetic(tree))    ## values could be used for the niche model (1 trait only)

## visualize
image(phylo.distance)

```
  
Approach 2. Weighted phylogenetic distances

```{r}
## computes the matrix of phylogenetic pairwise distances 
## alpha ranges (0,max(sqrt(cophenetic(tree)))) and weights the relative importance to close vs distantly related species
alpha=mean(sqrt(cophenetic(tree)))
phylo.distance<-1- exp(-sqrt(cophenetic(tree))/alpha)    ## values could be used for the niche model (1 trait only)
#phylo.distance<-exp(-sqrt(cophenetic(tree))/alpha)    ## using for positive interactions

## visualize
image(phylo.distance)


```

Approach 3. Variance co-variance matrix
 
```{r}
## computes the phylogenetic VCV matrix   
phylo.vcv<-vcv(tree) ## assuming a brownian motion model with Lambda =1
phylo.vcv<-vcv(corPagel(0, tree)) ## Lambda=0 or no phylogenetic structure
phylo.vcv<-vcv(corPagel(0.5, tree)) ## Lambda=0 or no phylogenetic structure

## re-scale to 0,1
phylo.vcv<-(phylo.vcv-min(phylo.vcv))/(range(phylo.vcv)[2]-range(phylo.vcv)[1])

## visualize
image(phylo.vcv)

```
Approach 4. Phylogenetic eigenvectors - weighted or not
```{r}
## Compute phylogenetic eigenvectors
Phylo.eigen<-pcoa(cophenetic(tree))


## select eigenvectors
## choosing an arbitrary threshold e.g. 0.8
plot(seq(1,99,1),Phylo.eigen$values$Cumul_eig)
Selected.Phylo.eigen<-Phylo.eigen$vectors[,1:which(Phylo.eigen$values$Cumul_eig>0.8)]


```

# Which approach to use?

The use of each of these approaches will depend on:
 
 1) Type of Model: 
     a) Niche model or Centrality trait-matching - pairwise values
     b) Logistic regressions, random forests - vector of distance corresponding to focal species
 
 2) Type of interaction:
     a) food-web: lower likelihood to preying upon a closely related species -> use distances
     b) mutualism: higher likelihood to interact (share interactions) with closely related species -> use weighted distances/vcv
     c) parasitism: higher likelihood of share interactions with closely related species -> use weighted distances/vcv 
     
  3) Number of traits in the model:
     a) Using phylogenies as a surrogate for traits is straightforward when only one trait is considered in the model or to include as similarity across species (e.g. I Eat Model) 
     b) While phylogenetic eigenvectors (or vectors of phylogenetic distances) could replace traits when more than one are considered (i.e. trait-matching), their interpretation or usefulness is not clear at all (CAVEAT!!)
     
     
     



