#Title:

* Inferring species interactions from ecological data
* A quantitative comparison of methods for Inferring species interactions from ecological data
* Comparing inferences for species interactions from ecological data
* On the use of ecological data for comparing species interactions
* Comparing methods for inferring species interactions
* A statistical analysis of methods for inferring species interactions.

You get the idea.

#Authors* 
* Ignasi Bartomeus
* Kevin Cazelles
* Guillaume Blanchet
* Mickaël Hedde
* Ignacio Morales Castilla
* Mathilde Besson 
* David Beauchesne
* Dominique Gravel
* Timothée Poisot
* Ben Weinstein
* Steve Vissault 

_Current author order drawn from a multinomial distribution, which, ironically, might be the only acceptable use case for this distribution in this manuscript._

_Target Journals_: Methods in Ecology and Evolution, Ecological Monographs, Annual Review of Ecology, Evolution, and Systematics.

#Introduction
Biotic interactions form the backbone of biodiversity (Bascompte & Jordano 2007). Understanding the strength, direction, and symmetry of species interactions provides insights into the maintenance of assemblages and potential threats from anthropogenic change. Combined with abiotic factors, biotic interactions constrain the distributions of species, shape the evolution of phenotypes and influence the stability of natural systems (Schleuning et al. 2015). Species interactions are often documented using ecological networks, in which each species (nodes) are connected based on the strength and direction of interactions (links)(Jordano 1987). Documenting and analyzing ecological networks is essential to understanding the rules underlying pairwise species interactions (Bascompte et al. 2006), quantifying ecosystem functioning and services (Thomson et al 2012), and predicting changes based on global change climate (ref).

Species characteristics or traits are at the core of biological interactions (Bartomeus et al. 2016). We define traits broadly as phenotypic adaptations to exploit abiotic or biotic resources. We use traits as our principal theoretical mechanism to explain when two species can interact. The foremost requirement for species interaction is species co-occurrence. Species occurrence is often based on environmental filtering for a given set of adaptations to local conditions (Hillerislambers, Mayfield, but see Kraft). If species co-occur, they may interact if their respective traits promote the efficiency of resource extraction. In addition, traits can be represented by phylogenetic information, in which evolution history can directly constrain trait evolution either directly, thereby affecting trait matching, or indirectly via niche conservatism (Graham and Wiens 2005). 

In spite of increasing efforts, it is unlikely that ecologists will empirically document the enormous number of interactions existing in nature (Morales-Castilla et al. 2015). Because of this, complementing field work with models of species interactions is a promising avenue for documenting the complexity of the natural world(ref). While direct inference will often be preferable, many interactions are rare, infrequent, or impossible to detect by human observations. Model-based inference for ecological networks provides three important aspects, i) establishes mechanistic relationships among species, ii) allows for the estimates of uncertainty to be propagated through an analysis, and iii) provides an avenue to predict future interactions based on new species or environmental change. We follow Poisot (2015) and Cazelles (2016) in formulating our general conceptual model of species interactions (Figure 1). We believe there is some true state of potential interactions, term a metaweb, in which species could interact based on co-occurrence. Any given observation we make is an attempt to recover these relationships using empirical data. We then use those empirical data to fit a model, either relating to species phenotypes, or based on phylogenetic proxies for trait relationships. This model can used to predict the observed state of the network, given our uncertainty due to spatial and temporal stochasticity. Or the model can be used to predict the links within a new network, based on the presence of a novel species in the assemblage. From these networks, we can estimate structural properties, such as connectance and nestedness, again accounting for our uncertainty in our proposed model. In this paper, we review the methods proposed to build models of species interactions, emphasizing each method’s utility for predicting the position of a novel species in the network. 

##Models of species interactions
The simplest model of species interactions is
$$Y_{i,j} = \rho_{i,j}$$
Where the probability of interaction among species i and species j is a fixed value (i,j). Using empirical data, we might try to estimate this value by dividing the number of observations by the total number of observations for any pair of species. While this is straightforward, why might it be insufficient? Foremost, it contains no estimate of uncertainty. The estimate is given without any consideration for the variance due to observation, spatial or temporal stochasticity. 

To add uncertainty, we draw our observations from a statistical distribution.

$$ Y_{i,j} \sim Bernoulli(\rho_{i,j}) $$

We can now estimate the probability of interaction, as well as the uncertainty based on sampling stochasticity. Yet this model is still unsatsifying. It is non-mechanistic, it depends wholly on species identity, and uses no ecological theory or inference. Therefore, it is difficult to ascribe meaning to a set of interactions, or understand how they might change in the future. We cannot use the inferences from data to make a predict about a new species not in dataset.

To make our model more useful, we might add a covariate, such that 
$$ Y_{i,j} Bernoulli(\rho_{i,j})$$
$$ logit(\rho_[i,j]) = \alpha_{i,j} + \beta_{i,j} * x $$

In which a link between species i and j is a Bernoulli trial with a probability of success i,j. The probability of success will vary based some ecological principle (x), for example, the similarity in function traits among species i and j:
$$x_{i,j}= |Trait_i,Trait_j|$$
A variety of trait-matching functions may be biologically plausible; the absolute value of the difference between traits, a binary difference based on whether trait_i is larger than traitj, or potentially non-linear models based on tradeoffs in foraging efficiency. Alternatively, the covariate may represent the phylogenetic relatedness of species, or their relative response to a given environmental variable. Regardless of the exact form of regression, this framework satisfies two important goals: it allows for estimates of uncertainty in species interactions, and it provides a mechanism shaping the probability of an interaction.


	While these simple examples simplify the broad array of potential methods we evaluate, they highlight our three major criteria for qualitative comparison 1) Can the method account for the uncertainty in species observations?, 2) Does it provide an ecological mechanism to infer the probability of species interactions, and 3) Can it be used to predict an novel interaction? 
Quantitative comparison
In addition, to qualitative comparison, we provide a quantitative analysis of methods for inferring species interactions. From a quantitative perspective, we are interested in methods which accurately reflect true relationships among data, are relatively insensitive to sampling effort, and make reasonable assumptions about the interdependence of species observations. We use a combination of simulated and empirical data to establish a benchmark dataset to compare the accuracy and sensitivity of currently proposed methods. 


Methods
Results
Discussion
 In a context where novel ecosystems arise as a result of species invasions or due to geographic shifts tracking climate change, our ability to predict future interactions will limit how efficiently we anticipate and respond to threats on biodiversity (i.e. species local extinctions) and on humans (i.e. spread of infectious disease or plagues affecting to crops). 


We have showed that traits are a common currency that link mechanistic understanding of species interactions, but given that different traits are involved in different processes (e.g. traits involved in trait matching are not the same involved in species co-occurrence), one may think using traits for inferring biotic interactions would rapidly become intractable. Luckily, recent research has shown that traits can be organized in ecological syndromes and that less than five trait axis may suffice to describe ecological interactions (EklÃ¶f).


Indeed, on the quest for describing species interactions, traits had played a pivotal role and several methods have recently emerged to test hypotheses of trait matching for pairwise interactions (Stang et al 2006, Delhing et al. 2014, Bartomeus et al 2016) or understand the phylogenetic structure of ecological networks (Rezende et al. 2007). However, generating biological meaningful predictions of species interactions and its emerging properties have proven challenging (Olito and Fox 2014). An ideal method is grounded in ecological theory,  which makes the description of ecological interactions interpretable. This method should be able to not only describe, but also predict ecological interactions based on a set of simple parameters. Importantly, this predictions should be accompanied by an associated uncertainty. In addition, given the difficulty of empirically assessing complete interaction networks, this method should be also robust to the use of incomplete data. 
There is an urgent need to better understand how communities interact and predict new interactions which will inevitably occur as a result of human induced rapid environmental change. In addition, our understanding of how species interact is limited to the few interactions are directly observable such as pollination of predation, but key species interactions not directly observable remains unlocked. Interactions inferences may be the only option for describing and predicting interactions in soil food webs or bacteria-phage networks. 
Finally, traits also relate to the fitness effects gained by both interaction partners. This can potentially establish a link with to modern coexistence theory. In fact, neutral expectations postulating that species abundances are the main drivers of interactions, are not incompatible with the underlying role of species traits shaping species abundances via effects in fitness (Bartomeus et al. 2016). 


Literature cited
Potential Boxes
Soil ecology
Climate changes and alien species


Community/evolution ecology
I am an evolutionary ecologist interested in the importance of morphological evolution on niche partitioning. I'd like to analyze the diet breadth of three bats (genus?) feeding on 10 piperaceae plants from La Selva, Costa Rica. I have morphological information on the bats (e.g. bite force, cranial morphology), and plants (e.g. seed hardness, fruit size), and I'd like to know if the traits contribute to diet specialization. We have observations of diet breadth from fecal samples (n=?). What analysis should I use to test the importance of traits in determining interactions?




Potential Figures






Working outline for reference.
Manuscript Outline


INTRO
Species interactions and the foundations of community ecology
What are species interactions?
What mechanisms determine species interactions?
Centered on traits as a theory for environmental, occurrence, as expressed through phylogeny
What do want to infer from studying species interactions
Ecological rules for pairwise interactions
Reconstructing energetic, ecosystem services
Indirect 
Global change, Invasion of new species
What are the criteria for analyzing species interactions
Generates predictions of biologically meaningful networks
Reasonable statistical quantities
Represents uncertainty 
How do we collect data on species interactions?
Observations of individuals
Spatial and temporal overlap
Phenotypic analysis
Molecular data
Objective of the paper 


METHODS
How do we infer species interactions from data?
Descriptive models
Predictive Models
Descriptive Models
Goals
Pros
Cons
Predictive Models
Goals
Pros
Cons
Comparing models of species interactions
Input criteria
Simulation
Empirical Data
Classifications (Table ?, ordination of classification)
Comparing methods
Evaluation statistics
Sensitivity analysis
Results
Evaluation results
Discussion
How did each method perform?
Against a benchmark
When should we use each method?
Current challenges
Functional mechanisms
Uncertainty
Error propagation
Descriptive v Predictive
The virtue of prediction in network ecology. 
Perspectives and Future Direction
Simultaneous mechanism
Increasingly focused on ‘accounting’ for a given mechanism (abundance v trait
Integration molecular (NGS) data
Expert knowledge
Expanding our view of niche interactions to include non-linear, novel, unconventional nodes
Predicting realized interactions (when p(interaction A and B) is modified by the presence, the activity or the past activity of C.


Boxes : user’s application
Soil ecology
Climate changes and alien species




#Expectations  
  What to predict?
  What the ideal method should do?
Fig.1

#Classification of the methods
Table 1 : list of methods ans their usages
Fig 2 : classification tree
Table 2 : qualitative comparison


#Quantitaive comparisons
-> results: - cross comprison   | real and simulated data
            - sensitivity       |
            - interpretation of probabilities
            - method description for comparaison

#Perspectives
  - guidelines
  - challenges
  - next steps

# References
