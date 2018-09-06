## R Code for the Finance Ministers' career description for the dissertation ##
## February, 10, 2018 ##

# This is to read in the data and save it as carreira_prop #
carreira_prop <- read.csv2(file = "~/Dropbox/Projetos_R/fuzzyminitros/carreira_prop.csv", header = T, sep = ",")

# Attach the data
attach(carreira_prop)

# This is to set the working directory
# First, save the path to the WD in the object ?ProjectCareer?
ProjectCareer <- "~/Dropbox/Projetos_R/fuzzyminitros"
# Then set the WD using this object
setwd(ProjectCareer)

# Save workspace
save.image(file = "C:\\Users\\Hurko\\Dropbox\\Projetos\ R\\fuzzyminitros\\ProjectCareer.Rdata")

# Load ggplot2
library(ggplot2)
# Load reshape2
library(reshape2)
# Load gridExtra
library(gridExtra)

# Create the objects for individual plots
economistas <- ggplot(carreira_prop, aes(ano_entrada, propecono))
politicos <- ggplot(carreira_prop, aes(ano_entrada, proppolitico))
expublicos <- ggplot(carreira_prop, aes(ano_entrada, proppublico))
privado <- ggplot(carreira_prop, aes(ano_entrada, propprivado))

# Create objects for the plots for later arrengement with gridExtra
plotecon <- economistas + geom_step(colour = "#000000") + theme_minimal() + xlab("") + ylab("Proporcao como economista")
plotpol <- politicos + geom_step(colour = "#000000") + theme_minimal() + xlab("") + ylab("Proporcao como politico")
plotpriv <- privado + geom_step(colour = "#000000") + theme_minimal() + xlab("") + ylab("Proporcao no setor privado")
plotpub <- expublicos + geom_step(colour = "#000000") + theme_minimal() + xlab("") + ylab("Proporcao como executivo publico")

# Arrange the four plots in a single page with gridExtra
grid.arrange(plotecon, plotpol, plotpub, plotpriv, nrow = 2)

# Transform data to plot multiple variables in the y axis
carreira_prop_long <- melt(carreira_prop, id.vars = "ano_entrada")

# Plot all variables in a single graph, for comparison
propAgregado <- ggplot(carreira_prop_long, aes(x = ano_entrada, y = value, group = variable, colour = variable))

propAgregado + geom_point(alpha = .7) + geom_smooth(method = "lm", alpha = .1) + xlab("") + ylab("Proporcao da carreira") + scale_colour_manual(values=c("#ff7373", "#ffd700", "#008080", "#00ffff"), name="", breaks=c("propprivado", "proppublico", "proppolitico", "propecono"), labels=c("Setor privado", "Executivo Publico", "Politico", "Economista")) + theme_light()

propAgregado + geom_point(alpha = .7) + geom_smooth(method = "lm", alpha = .1) + xlab("") + ylab("Proporcao da carreira") + scale_colour_manual(values=c("#ffc0cb", "#ffd700", "#008080", "#800080"), name="", breaks=c("propprivado", "proppublico", "proppolitico", "propecono"), labels=c("Setor privado", "Executivo Publico", "Politico", "Economista")) + theme_light()