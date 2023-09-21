# Function for generating palettes

#' MoMA Palette Generator
#' 
#' Color palettes inspired by works at The Museum of Modern Art in New York City. Complete list of palette colors
#' and the works that inspired them can be found \href{https://github.com/BlakeRMills/MoMAColors}{on Github}.
#' Use \code{\link{colorblind.friendly}} to check whether palettes are colorblind-friendly.
#' 
#' @param palette_name Name of Palette. Choices are: 
#' \code{Abbott}, \code{Alkalay}, \code{Althoff}, \code{Andri}, \code{Avedon}, \code{Budnitz}, 
#' \code{Connors}, \code{Doughton}, \code{Ernest}, \code{Exter}, \code{Flash}, \code{Fritsch}, 
#' \code{Klein}, \code{Koons}, \code{Levine1}, \code{Levine2}, \code{Liu}, \code{Lupi}, 
#' \code{Ohchi}, \code{OKeeffe}, \code{Palermo}, \code{Panton}, \code{Picabia}, \code{Picasso}, 
#' \code{Rattner}, \code{Sidhu}, \code{Smith}, \code{ustwo}, \code{VanGogh}, \code{vonHeyl}, 
#' and \code{Warhol}
#' @param n Number of desired colors. If number of requested colors is beyond the scope of the palette,
#' colors are automatically interpolated. If n is not provided, the length of the palette is used.
#' @param type Either "continuous" or "discrete". Use continuous if you want to automatically
#' interpolate between colors.
#' @param direction Sets order of colors. Default palette is 1. If direction is -1, palette color order is reversed
#' @param override.order Colors are picked from palette to maximize readability and aesthetics. This means
#' that colors are not always selected in sequential order from the full palette. If override.order is set to TRUE,
#' colors are selected in sequential order from the full palette instead. Default is FALSE.
#' @return A vector of colors.
#' @keywords colors
#' @export
moma.colors <- function(palette_name, n, type = c("discrete", "continuous"), direction = c(1, -1), override.order=FALSE) {
  
  `%notin%` <- Negate(`%in%`)
  
  palette <- MoMAPalettes[[palette_name]]
  
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


# Function for printing palette

#' @export
#' @importFrom grDevices rgb
#' @importFrom graphics rect par image text
print.palette <- function(x, ...) {
  n <- length(x)
  lab <- attr(x, "name")
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))
  
  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")
  
  rect(0, 0.92, n + 1, 1.08, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 2.5, family = "serif")
  
  
  #' Names of colorblind-friendly palettes
  #'
  #' Lists all palettes that are colorblind-friendly in the package.
  #' To be colorblind-friendly, all colors in the palettes must be distinguishable with deuteranopia, protanopia, and tritanopia.
  #' Use \code{\link{moma.colors}}  to construct palettes or \code{\link{colorblind.friendly}} to test for colorblind-friendliness.
  #'
  #'
  #' @export
  colorblind_moma_palettes <- c("Alkalay", "Althoff", "Andri", "Connors", "Doughton", "Ernest", "Exter", "Flash",
                                "Fritsch", "Koons", "Levine2", "Ohchi", "OKeeffe", "Palermo", "Picabia", "Picasso",
                                "Rattner", "Sidhu", "Smith", "ustwo", "VanGogh", "vonHeyl")
}


# Names whether a palette is colorblind-friendly

#' Colorblind-Friendly Palette Check
#'
#' Checks whether a palette is colorblind-friendly. Colorblind-friendliness tested using the 'colorblindcheck' package.
#' To be colorblind-friendly, all colors in the palettes must be distinguishable with deuteranopia, protanopia, and tritanopia.
#'
#' @param palette_name Name of Palette. Choices are: 
#' \code{Abbott}, \code{Alkalay}, \code{Althoff}, \code{Andri}, \code{Avedon}, \code{Budnitz}, 
#' \code{Connors}, \code{Doughton}, \code{Ernest}, \code{Exter}, \code{Flash}, \code{Fritsch}, 
#' \code{Klein}, \code{Koons}, \code{Levine1}, \code{Levine2}, \code{Liu}, \code{Lupi}, 
#' \code{Ohchi}, \code{OKeeffe}, \code{Palermo}, \code{Panton}, \code{Picabia}, \code{Picasso}, 
#' \code{Rattner}, \code{Sidhu}, \code{Smith}, \code{ustwo}, \code{VanGogh}, \code{vonHeyl}, 
#' and \code{Warhol}
#' @examples
#' colorblind.friendly("Koons")
#' @return TRUE/FALSE value whether palette is colorblind-friendly
#' @export
colorblind.friendly.moma <- function(palette_name){
  
  `%notin%` <- Negate(`%in%`)
  
  if (palette_name %notin% names(MoMAPalettes)) {
    stop("Palette does not exist.")
  }
  
  friendly <- palette_name %in% colorblind_moma_palettes
  
  return(friendly)
}