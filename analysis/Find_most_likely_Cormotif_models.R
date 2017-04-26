source("http://bioconductor.org/biocLite.R")
biocLite("Cormotif")

library("Cormotif")

# Create a factor for the experiments, with the levels ordered such that as.numeric converts them to numbers in a defined manner              

# Note: there are 6 human biological replicates and 4 chimp biological replicates                                                             

species <- c("H", "H","H","H","H","H", "C", "C","C","C",
             "H","H","H","H","H","H",  "C", "C","C","C",
             "H","H","H","H","H","H",  "C", "C","C","C",
             "H","H","H","H","H","H",  "C", "C","C","C")
day <- c("0", "0","0","0","0","0","0", "0", "0", "0", "1","1","1","1","1","1","1","1", "1","1",
         "2", "2","2","2","2","2","2","2","2", "2",
         "3", "3","3","3","3","3","3","3",  "3", "3")

group_fac <- factor(paste(species, day, sep = "."),
                    levels = c("H.0", "H.1", "H.2", "H.3", "C.0", "C.1", "C.2", "C.3"))
groupid <- as.numeric(group_fac)

compid_tran <- data.frame(c1 = c(1, 2, 3, 5, 6, 7),
                          c2 = c(2, 3, 4, 6, 7, 8))

# Load in the data                                                                                                                            

mean_tech_reps_matrix <- read.table("~/ashlar-trial/data/cpm_cyclicloess_40.txt")
mean_tech_reps_matrix <- as.matrix(mean_tech_reps_matrix)

# Find the best seed for K = 7                                                                                                                          

log_likelihood_values = matrix(data = NA, nrow = 100, ncol = 1)

i=1
for (i in 1:100){
  
  set.seed(i)
  print(i)
  cormotif_tran <- cormotiffit(exprs = mean_tech_reps_matrix, groupid = groupid,
                               compid = compid_tran, K = 7, max.iter=500)
  
  log_likelihood_values[i,1] <- cormotif_tran$bestmotif$loglike
  write.table(log_likelihood_values, file="~/Cormotif_comp_over_time_k8_log_likelihood_values.txt")
  
  
}

max(log_likelihood_values)
min(log_likelihood_values)

# Find the best seed for K = 8
log_likelihood_values = matrix(data = NA, nrow = 100, ncol = 1)

i=1
for (i in 1:100){
  
  set.seed(i)
  print(i)
  cormotif_tran <- cormotiffit(exprs = mean_tech_reps_matrix, groupid = groupid,
                               compid = compid_tran, K = 8, max.iter=500)
  
  log_likelihood_values[i,1] <- cormotif_tran$bestmotif$loglike
  write.table(log_likelihood_values, file="~/Cormotif_comp_over_time_k8_log_likelihood_values.txt")
  
  
}

max(log_likelihood_values)
min(log_likelihood_values)

