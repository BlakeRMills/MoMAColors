library(ggplot2)
library(sysfonts)
library(tidyverse)
library(magick)
library(cowplot)
library(ggstream)
library(showtext)
library(colorblindcheck)
library(ggstream)
font <- "Advent Pro"
font_add_google("Advent Pro")
showtext_auto()

# Discrete

dis <- function(name){
  pal <- MoMAPalettes[[name]][[1]]
  n <- length(pal)
d_data <- data.frame(x = 1:n,
                     y = runif(n, 2, 3),
                     col = letters[1:n])

ggplot(data=d_data) +
  geom_bar(aes(x=x, y=y, fill=col), stat="identity") +
  coord_polar() +
  scale_x_continuous(expand = c(0, 0.04)) +
  scale_fill_manual(values=pal) +
  theme_void() +
  ggtitle(name) +
  theme(legend.position = "none",
        plot.background = element_rect(color="white", fill="white"),
        plot.title = element_text(hjust=0.5, size=150, face=2, family=font, vjust=0))
}

stream <- function(name){
  pal <- MoMAPalettes[[name]][[1]]
  n <- length(pal)
  d_data <- data.frame(x = rep(1:10, n),
                       y = runif(10*n, 0, 3),
                       col = sort(rep(letters[1:n], 10)))
  
  ggplot(data=d_data) +
    geom_stream(aes(x=x, y=y, fill=col), extra_span = 0.15) +
    scale_x_continuous(expand = c(0, 0.04)) +
    scale_fill_manual(values=pal) +
    theme_void() +
    ggtitle(name) +
    theme(legend.position = "none",
          plot.background = element_rect(color="white", fill="white"),
          plot.title = element_text(hjust=0.5, size=150, face=2, family=font, vjust=0))
}


violin <- function(name){
  pal <- MoMAPalettes[[name]][[1]]
  n <- length(pal)
  d_data <- data.frame(x = sort(rep(1:n, 15)),
                       y = rnorm(15*n, 0, 0.75),
                       col = sort(rep(letters[1:n], 15)))
  
  ggplot(data=d_data) +
    geom_violin(aes(x=x, y=y, fill=col), color="transparent") +
    scale_x_continuous(expand = c(0, 0.04)) +
    scale_fill_manual(values=pal) +
    theme_void() +
    ggtitle(name) +
    theme(legend.position = "none",
          plot.background = element_rect(color="white", fill="white"),
          plot.title = element_text(hjust=0.5, size=150, face=2, family=font, vjust=0))
}

bars <- function(name){
  pal <- MoMAPalettes[[name]][[1]]
  n <- length(pal)
  d_data <- data.frame(x = rep(1:5, n),
                       y = runif(5*n, 0, 5),
                       col = sort(rep(letters[1:n], 5)))
  
  ggplot(data=d_data) +
    geom_bar(aes(x=x, y=y, fill=col), stat="identity", position = "stack") +
    scale_x_continuous(expand = c(0, 0.04)) +
    scale_fill_manual(values=pal) +
    theme_void() +
    ggtitle(name) +
    theme(legend.position = "none",
          plot.background = element_rect(color="white", fill="white"),
          plot.title = element_text(hjust=0.5, size=150, face=2, family=font, vjust=0))
}



for(i in names(MoMAPalettes)){
  stream(i)
  ggsave(paste("~/Desktop/Stream Tests/", i, ".png"), width = 6, height = 8)
  
  bars(i)
  ggsave(paste("~/Desktop/Bar Tests/", i, ".png"), width = 6, height = 8)
  
  dis(i)
  ggsave(paste("~/Desktop/Pie Tests/", i, ".png"), width = 6, height = 6)
  
  violin(i)
  ggsave(paste("~/Desktop/Violin Tests/", i, ".png"), width = 6, height = 8)
  
  print(i)
  
}
  

for(i in names(MoMAPalettes)){
  png(paste("~/Desktop/Pals/", i, ".png", sep=""))
  print(moma.MoMAPalettes(i))
  dev.off()
}


Current <- function(name){
  png(paste("~/Desktop/Current/", name, ".png", sep=""))
  print(moma.MoMAPalettes(name))
  dev.off()
  
  stream(name)
  ggsave(paste("~/Desktop/Current/", name, "S.png", sep=""), width = 6, height = 8)
  
  bars(name)
  ggsave(paste("~/Desktop/Current/", name, "B.png", sep=""), width = 6, height = 8)
  
  dis(name)
  ggsave(paste("~/Desktop/Current/", name, "P.png", sep=""), width = 6, height = 6)
  
  violin(name)
  ggsave(paste("~/Desktop/Current/", name, "V.png", sep=""), width = 6, height = 8)
  
}

Current("Rousseau")

Mosaic <- function(name){
  s <- stream(name)
  b <- bars(name)
  d <- dis(name)
  v <- violin(name)
  
  plot_grid(s, b, d, v) +
    theme(plot.background = element_rect(fill="white", color="white"))
  
  ggsave(paste("~/Desktop/Current/", name, "Mos.png", sep=""), width = 6, height = 8)
}


for(i in names(MoMAPalettes)){
  png(paste("~/Desktop/Pals/", i, ".png", sep=""))
  print(moma.MoMAPalettes(i))
  dev.off()
}


for(i in names(MoMAPalettes)){
  Mosaic(i)
}


for(i in names(MoMAPalettes)){
  two <- image_read(paste("~/Desktop/Pals/", i, ".png", sep=""))
  three <- image_read(paste("~/Desktop/Current/", i, "Mos.png", sep=""))
  xxx <- image_montage(c(two, three), "1000x1000", bg="white", tile=2)
  image_write(xxx, path=paste("~/Desktop/Complete/", i, ".png", sep=""), format="png")
}



xxx <- image_montage(c(one, two, three), "1000x1000", bg="white", tile=3)
image_write(xxx, path="~/Desktop/Montah.png", format="png")




palette_plot(moma.MoMAPalettes("Liu"))
palette_check(moma.MoMAPalettes("Liu"))
palette_dist(moma.MoMAPalettes("Liu"))
## Colorblind Checking 

CBTotal <- data.frame() 

for(pal_nam in names(MoMAPalettes)){
CBCheck <- palette_check(moma.MoMAPalettes(pal_nam)) %>%
  as.data.frame %>%
  select(name, min_dist) %>%
  pivot_wider(names_from=name,
              values_from = min_dist) %>%
  mutate(pal = pal_nam)

CBTotal <- rbind(CBTotal, CBCheck)

png(filename = paste("~/Desktop/CB Moma/", pal_nam ,".png", sep=""))
palette_plot(moma.MoMAPalettes(pal_nam))
dev.off()


}

CBTotal$MinName <-  names(CBTotal)[apply(CBTotal, MARGIN = 1, FUN = which.min)]
CBTotal$Min <- apply(CBTotal, MARGIN = 1, FUN = min)
