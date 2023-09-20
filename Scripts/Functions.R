print.palette <- function(x, ...) {
  n <- length(x)
  lab <- attr(x, "name")
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))
  
  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")
  
  rect(0, 0.92, n + 1, 1.08, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = lab, cex = 4)
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
