
# This function use a pair of traits 
# By convention, i is the target layer and j is the opposed layer

# Data: a data frame with Ti as traits of the layer i and Tj traits of the layer j
# each row correspond to a pair of species with known interaction
niche.bin = function(L, data, thresh) {

	# Fit model
	library(quantreg)
	model_o = lm(Tj ~ Ti, data)
	model_lo = rq(Tj ~ Ti, tau = thresh, data)
	model_up = rq(Tj ~ Ti, tau = 1 - thresh, data)

	# Return results
	return(list(model_o = model_o, model_lo = model_lo, model_up = model_up))
	 
}

# newdata: a dataframe with a data frame with Ti as traits of the layer i and Tj traits of the layer j
# each row correspond to a pair of trait for which we want to know if there is an 
# interaction happenning
predict.niche.bin = function(newdata, models, net_type = "unipartite") {
	with(newdata, {
		npairs = length(Ti)

		# Lower boundary
		lo = models$model_lo[1] + models$model_lo[2]*Ti

		# Upper boundary
		up = models$model_up[1] + models$model_up[2]*Ti

		# Compute interactions among pairs of species
		L = numeric(npairs)
		k = 1
		for(i in 1:npairs)
			for(j in 1:npairs) {
				if(Tj[j] > lo[i] & newTj[j] < up[i]) L[k] = 1
				k = k+1
			}
	})
	return(list(L = L))
}




