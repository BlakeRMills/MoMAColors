library(ggplot2)
library(showtext)
library(ggstream)
font <- "Advent Pro"
font_add_google("Advent Pro")
showtext_auto()

# Discrete

dis <- function(name){
  pal <- Colors[[name]][[1]]
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
  pal <- Colors[[name]][[1]]
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
  pal <- Colors[[name]][[1]]
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
  pal <- Colors[[name]][[1]]
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



for(i in names(Colors)){
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


print.palette <- function(x, ...) {
  n <- length(x)
  lab <- attr(x, "name")
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))
  
  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")
  
  rect(0, 0.92, n + 1, 1.08, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = substitute(bold(lab)), cex = 4, family = "Advent Pro")
}

moma.colors <- function(palette_name, n, type = c("discrete", "continuous"), direction = c(1, -1), override.order=FALSE) {
  
  `%notin%` <- Negate(`%in%`)
  
  palette <- Colors[[palette_name]]
  
  if (is.null(palette)|is.numeric(palette_name)){
    stop("Palette does not exist.")
  }
  
  if (missing(n)) {
    n <- length(palette[[1]])
  }
  
  if (missing(direction)) {
    direction <- 1
  }
  
  if (direction %notin% c(1, -1)){
    stop("Direction not valid. Please use 1 for standard palette or -1 for reversed palette.")
  }
  
  if (missing(type)) {
    if(n > length(palette[[1]])){type <- "continuous"}
    else{type <- "discrete"}
  }
  
  type <- match.arg(type)
  
  
  if (type == "discrete" && n > length(palette[[1]])) {
    stop("Number of requested colors greater than what discrete palette can offer, \n use continuous instead.")
  }
  
  continuous <-  if(direction==1){grDevices::colorRampPalette(palette[[1]])(n)
  }else{
    grDevices::colorRampPalette(rev(palette[[1]]))(n)}
  
  discrete <- if(direction==1 & override.order==FALSE){
    palette[[1]][which(palette[[2]] %in% c(1:n)==TRUE)]
  }else if(direction==-1 & override.order==FALSE){
    rev(palette[[1]][which(palette[[2]] %in% c(1:n)==TRUE)])
  } else if(direction==1 & override.order==TRUE){
    palette[[1]][1:n]
  } else{
    rev(palette[[1]])[1:n]
  }
  
  out <- switch(type,
                continuous = continuous,
                discrete = discrete
  )
  structure(out, class = "palette", name = palette_name)
  
}
  
  

for(i in names(Colors)){
  png(paste("~/Desktop/MoMA Pals/", i, ".png"))
  print(moma.colors(i))
  dev.off()
}


Current <- function(name){
  png(paste("~/Desktop/Current/", name, ".png", sep=""))
  print(moma.colors(name))
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


for(i in names(Colors)){
  png(paste("~/Desktop/Pals/", i, ".png", sep=""))
  print(moma.colors(i))
  dev.off()
}


for(i in names(Colors)){
  Mosaic(i)
  ggsave(paste("~/Desktop/Mosaics/", i, ".png", sep=""))
}


for(i in names(Colors)){
  two <- image_read(paste("~/Desktop/Pals/", i, ".png", sep=""))
  three <- image_read(paste("~/Desktop/Mosaics/", i, ".png", sep=""))
  one <- image_read(paste("~/Desktop/Art/", i, ".png", sep=""))
  xxx <- image_montage(c(one, two, three), "1000x1000", bg="white", tile=3)
  image_write(xxx, path=paste("~/Desktop/Complete/", i, ".png", sep=""), format="png")
}



xxx <- image_montage(c(one, two, three), "1000x1000", bg="white", tile=3)
image_write(xxx, path="~/Desktop/Montah.png", format="png")


