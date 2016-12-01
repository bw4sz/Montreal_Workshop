# Direct matching centrality
# Currently deals with logistic and poisson regression, and random forest

direct.centrality = function(data, algorithm, ...) {

	if(algorithm == "logistic") model = glm(L ~ .*., data, family = "binomial")		

	else if(algorithm == "poisson") model = glm(L ~ .*., data, family = "poisson")

	else if(algorithm == "RF") {
		library(randomForest)
		model = randomForest(L ~ .*., data, ...)
	} 

	return(model)
}


predict.direct.centrality = function(newdata, model, replicates) {

	p = predict(model, newdata, type = "response")

	L = list()
	for(n in 1:replicates) L[[n]] = rbinom(nrow(newdata), size = 1, prob = p)

	return(list(p = p, L = L))

}