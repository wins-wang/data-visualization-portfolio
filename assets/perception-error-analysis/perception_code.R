pe$error = pe$Response - pe$TrueValue
pe$aber = abs(pe$error)

write.csv(pe, 'pe.csv')
install.packages('beeswarm')
library(beeswarm)
library(cowplot)
library(dplyr)
library(readr)

source("R_rainclouds.R")
source("summarySE.R")
source("simulateData.R")

# perception raincloud

ggplot(pe,aes(x=Test,y=aber, fill = Test, colour = Test))+
  geom_flat_violin(position = position_nudge(x = .25, y = 0),adjust =2, trim = FALSE)+
  geom_point(position = position_jitter(width = .15), size = .25)+
  ylab('Absolute Error')+xlab('Test')+coord_flip()+theme_cowplot()+guides(fill = FALSE, colour = FALSE) +
  geom_boxplot(aes(x = as.numeric(Test)+0.25, y = aber),outlier.shape = NA, alpha = 0.3, width = .1, colour = "BLACK") +
  scale_colour_brewer(palette = "Dark2")+
  scale_fill_brewer(palette = "Dark2")+
  ggtitle("Distributions of different tests")

# perception anomalous


pe1b = subset(pe, Display == 1 & TestNumber == 3 & Trial == 'B')
pe1c = subset(pe, Display == 1 & TestNumber == 3 & Trial == 'C')
pe1d = subset(pe, Display == 1 & TestNumber == 3 & Trial == 'D')


install.packages("devtools")
library(devtools) install_github("easyGgplot2", "kassambara")

# set up the function that can put pics together
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}


# draw all 
p1 = ggplot(pe1b, aes(x=Subject, y= Response, fill= Response))+
  geom_hline(aes(yintercept=median(pe1b$Response)), colour="#990000", linetype="dashed")+
  geom_line()+ggtitle('Finding anomalous in Display 1 Trail B','(Red dashed line shows median)')+
  scale_x_continuous(breaks = seq(0,92,by=2))

p2 = ggplot(pe1c, aes(x=Subject, y= Response, fill= Response))+
  geom_hline(aes(yintercept=median(pe1c$Response)), colour="#990000", linetype="dashed")+
  geom_line()+ ggtitle('Finding anomalous in Display 1 Trail C','(Red dashed line shows median)')+
  scale_x_continuous(breaks = seq(0,92,by=2))

p3 = ggplot(pe1b, aes(x=Subject, y= Response, fill= Response))+
  geom_hline(aes(yintercept=median(pe1d$Response)), colour="#990000", linetype="dashed")+
  geom_line() + ggtitle('Finding anomalous in Display 1 Trail D','(Red dashed line shows median)')+
  scale_x_continuous(breaks = seq(0,92,by=2))


# Put all together
multiplot(p1,p2,p3, cols=1)
log10(MessierData$Distance..LY.)
