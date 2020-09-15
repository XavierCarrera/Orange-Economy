str(orangeec)

#EDA orangeec

plot(orangeec$Unemployment ~ orangeec$Education.invest...GDP, xlab="Education Invesment (%GDP)", ylab = "Unemployment", main="Investment -- Unemployment Ratio")

# Plotting 

plot(orangeec$GDP.PC ~ orangeec$Creat.Ind...GDP, xlab="Orange Ec. contribution to GDP(%)", ylab = "GDP per capita", main="Orange Ec. y GDP per cápita ratio")

hist orangeec ggplot()+geom_histogram(data=orangeec, aes(x=GDP.PC),fill="blue",color="red", binwidth = 2000)+ labs(x="gdp per cápita", y="Number of countries", title="LATAM GDS per Country")+ theme(legend.position = "none")+ theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())

ggplot()+geom_histogram(data=orangeec, aes(x=Creat.Ind...GDP),fill="blue",color="red", binwidth = 1)+ labs(x="Orange Ec. contribution to GDP(%)", y="Number of Countries", title="LATAM Orange Economy Contributions to GDP")+ theme(legend.position = "none")+ theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())

ggplot()+geom_histogram(data=orangeec, aes(x=Internet.penetration...population),fill="red",color="yellow", binwidth = 5)+ labs(x="Percentual Internet Use", y="Number of countries", title="Internet Use in LATAM")+ theme(legend.position = "none")+ theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())

# Calculating variables' mean 

economy <- mean(orangeec$GDP.PC) economy

# Additional plotting

orangeec <- orangeec %>% mutate(Strong_economy = ifelse(GDP.PC < economy, "Underaverage GDP per capita", "Overaverage GDP per capita"))


ggplot(orangeec, aes(x=Strong_economy, y=Creat.Ind...GDP, fill=Strong_economy))+ geom_boxplot(alpha=0.4)+ labs(x="Country Type", y="Orange Ec. Contribution to GDP", title="Orange Ec contribution in low and high GDP per capita countries")+ theme(legend.position = "none")+ theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())



ggplot(orangeec, aes(x=Strong_economy, y=Internet.penetration...population, fill=Strong_economy))+ geom_boxplot(alpha=0.4)+ labs(x="Country Type", y="Internet Penetration(%)", title="Internet Penetration in low and high GDP per capita countries")+ theme(legend.position = "none")+ theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())


ggplot(orangeec, aes(Internet.penetration...population,Creat.Ind...GDP))+ geom_point(aes(color=factor(Strong_economy), size=GDP.Growth..))+ labs(x="Internet Penetration", y="Orange Ec Contribution to GDP", title="Internet y and Orange Ec Contribution to GDPs")

education <- mean(orangeec$Education.invest...GDP) education

orangeec <- orangeec %>% mutate(Inversión_Educación = ifelse(Education.invest...GDP < education, "Under-average Investment", "Equal or overaverage investment"))

ggplot(orangeec, aes(Internet.penetration...population,Creat.Ind...GDP))+ geom_point(aes(color=factor(Inversión_Educación), size=GDP.Growth..))+ labs(x="Internet Penetration", y="Orange Ec Contribution to GDP", title="Internet and Orange Ec Contribution to National GDP")

# Preparing for use

my_graph <- ggplot(orangeec, aes(Internet.penetration...population, Creat.Ind...GDP,label=row.names(orangeec)))+ geom_point()+ labs(x="Internet penetration", y="Contribution of Orange Ec", title="Internet and Orange Ec contribution") my_graph

p = ggplotly(my_graph) p

