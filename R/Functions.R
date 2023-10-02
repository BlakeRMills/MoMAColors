# Function for generating palettes

#' MoMA Palette Generator
#' 
#' Color palettes inspired by works at The Museum of Modern Art in New York City. Complete list of palette colors
#' and the works that inspired them can be found \href{https://github.com/BlakeRMills/MoMAColors}{on Github}.
#' Use \code{\link{colorblind.friendly.moma}} to check whether palettes are colorblind-friendly.
#' 
#' @param palette_name Name of Palette. Choices are: 
#' \code{Abbott}, \code{Alkalay1}, \code{Alkalay2}, \code{Althoff}, \code{Andri}, \code{Avedon}, 
#' \code{Budnitz}, \code{Clay}, \code{Connors}, \code{Dali}, \code{Doughton}, \code{Ernst}, 
#' \code{Exter}, \code{Flash}, \code{Fritsch}, \code{Kippenberger}, \code{Klein}, \code{Koons}, 
#' \code{Levine1}, \code{Levine2}, \code{Liu}, \code{Lupi}, \code{Ohchi}, \code{OKeeffe}, \code{Palermo}, 
#' \code{Panton}, \code{Picabia}, \code{Picasso}, \code{Rattner}, \code{Sidhu}, \code{Smith}, \code{ustwo}, 
#' \code{VanGogh}, \code{vonHeyl}, and \code{Warhol}
#' @param n Number of desired colors. If number of requested colors is beyond the scope of the palette,
#' colors are automatically interpolated. If n is not provided, the length of the palette is used.
#' @param type Either "continuous" or "discrete". Use continuous if you want to automatically
#' interpolate between colors.
#' @param direction Sets order of colors. Default palette is 1. If direction is -1, palette color order is reversed
#' @param override_order Colors are picked from palette to maximize readability and aesthetics. This means
#' that colors are not always selected in sequential order from the full palette. If override_order is set to TRUE,
#' colors are selected in sequential order from the full palette instead. Default is FALSE.
#' @param return_hex Default is FALSE. If TRUE, hex codes of colors will be returned in addition to the palette.
#' @return A vector of colors.
#' @keywords colors
#' @export
moma.colors <- function(palette_name, n, type = c("discrete", "continuous"), direction = c(1, -1), override_order=FALSE, return_hex = FALSE) {
  
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
  
  discrete <- if(direction==1 & override_order==FALSE){
    palette[[1]][which(palette[[2]] %in% c(1:n)==TRUE)]
  }else if(direction==-1 & override_order==FALSE){
    rev(palette[[1]][which(palette[[2]] %in% c(1:n)==TRUE)])
  } else if(direction==1 & override_order==TRUE){
    palette[[1]][1:n]
  } else{
    rev(palette[[1]])[1:n]
  }
  
  out <- switch(type,
                continuous = continuous,
                discrete = discrete
  )
  if(return_hex==T){print(out)}
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
}

  
#' Names of colorblind-friendly palettes
#'
#' Lists all palettes that are colorblind-friendly in the package.
#' To be colorblind-friendly, all colors in the palettes must be distinguishable with deuteranopia, protanopia, and tritanopia.
#' Use \code{\link{moma.colors}}  to construct palettes or \code{\link{colorblind.friendly.moma}} to test for colorblind-friendliness.
#'
#'
#' @export
colorblind_moma_palettes <- c("Alkalay1", "Alkalay2", "Althoff", "Andri", "Connors", "Doughton", "Ernst", "Exter", 
                              "Flash", "Fritsch", "Kippenberger", "Koons", "Levine2", "Ohchi", "OKeeffe", "Palermo", 
                              "Picabia", "Picasso", "Rattner", "Sidhu", "Smith", "ustwo", "VanGogh", "vonHeyl")

# Names whether a palette is colorblind-friendly

#' Colorblind-Friendly Palette Check
#'
#' Checks whether a palette is colorblind-friendly. Colorblind-friendliness tested using the 'colorblindcheck' package.
#' To be colorblind-friendly, all colors in the palettes must be distinguishable with deuteranopia, protanopia, and tritanopia.
#'
#' @param palette_name Name of Palette. Choices are: 
#' \code{Abbott}, \code{Alkalay1}, \code{Alkalay2}, \code{Althoff}, \code{Andri}, \code{Avedon}, 
#' \code{Budnitz}, \code{Clay}, \code{Connors}, \code{Dali}, \code{Doughton}, \code{Ernst}, 
#' \code{Exter}, \code{Flash}, \code{Fritsch}, \code{Kippenberger}, \code{Klein}, \code{Koons}, 
#' \code{Levine1}, \code{Levine2}, \code{Liu}, \code{Lupi}, \code{Ohchi}, \code{OKeeffe}, \code{Palermo}, 
#' \code{Panton}, \code{Picabia}, \code{Picasso}, \code{Rattner}, \code{Sidhu}, \code{Smith}, \code{ustwo}, 
#' \code{VanGogh}, \code{vonHeyl}, and \code{Warhol}
#' @examples
#' colorblind.friendly.moma("Koons")
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



# MoMAColors palettes for plotting with ggplot2

#' MoMAColors palettes for plotting with ggplot2
#'
#' Function for using \code{MoMAColors} colors schemes in \code{ggplot2}. Use \code{\link{scale_color_moma_d}} and \code{\link{scale_fill_moma_d}}
#' for discrete scales and \code{\link{scale_color_moma_c}} and \code{\link{scale_fill_moma_c}} for continuous scales.
#'
#' @param palette_name Name of Palette. Choices are:
#' \code{Abbott}, \code{Alkalay1}, \code{Alkalay2}, \code{Althoff}, \code{Andri}, \code{Avedon}, 
#' \code{Budnitz}, \code{Clay}, \code{Connors}, \code{Dali}, \code{Doughton}, \code{Ernst}, 
#' \code{Exter}, \code{Flash}, \code{Fritsch}, \code{Kippenberger}, \code{Klein}, \code{Koons}, 
#' \code{Levine1}, \code{Levine2}, \code{Liu}, \code{Lupi}, \code{Ohchi}, \code{OKeeffe}, \code{Palermo}, 
#' \code{Panton}, \code{Picabia}, \code{Picasso}, \code{Rattner}, \code{Sidhu}, \code{Smith}, \code{ustwo}, 
#' \code{VanGogh}, \code{vonHeyl}, and \code{Warhol}
#' @param direction Sets order of colors. Default palette is 1. If direction is -1, palette color order is reversed
#' @param override_order Colors are picked from palette to maximize readability and aesthetics. This means
#' that colors are not always selected in sequential order from the full palette. If override_order is set to TRUE,
#' colors are selected in sequential order from the full palette instead. Default is FALSE.
#' @param ... Other arguments passed on to \code{\link[ggplot2]{discrete_scale}}
#' @import ggplot2
#' @examples
#' library(ggplot2)
#' ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) +
#' geom_point() +
#' scale_color_moma_d("Warhol")
#' @export
scale_color_moma_d <- function(palette_name, direction = 1, override_order = FALSE, ...){
  discrete_scale(aesthetics = "colour",
                 scale_name="moma_d",
                 palette= function(n) moma.colors(palette_name=palette_name, n = n, direction = direction, override_order = override_order),
                 ...)
}

#' MoMAColors palettes for plotting with ggplot2
#'
#' Function for using \code{MoMAColors} colors schemes in \code{ggplot2}. Use \code{\link{scale_color_moma_d}} and \code{\link{scale_fill_moma_d}}
#' for discrete scales and \code{\link{scale_color_moma_c}} and \code{\link{scale_fill_moma_c}} for continuous scales.
#'
#' @param palette_name Name of Palette. Choices are:
#' \code{Abbott}, \code{Alkalay1}, \code{Alkalay2}, \code{Althoff}, \code{Andri}, \code{Avedon}, 
#' \code{Budnitz}, \code{Clay}, \code{Connors}, \code{Dali}, \code{Doughton}, \code{Ernst}, 
#' \code{Exter}, \code{Flash}, \code{Fritsch}, \code{Kippenberger}, \code{Klein}, \code{Koons}, 
#' \code{Levine1}, \code{Levine2}, \code{Liu}, \code{Lupi}, \code{Ohchi}, \code{OKeeffe}, \code{Palermo}, 
#' \code{Panton}, \code{Picabia}, \code{Picasso}, \code{Rattner}, \code{Sidhu}, \code{Smith}, \code{ustwo}, 
#' \code{VanGogh}, \code{vonHeyl}, and \code{Warhol}
#' @param direction Sets order of colors. Default palette is 1. If direction is -1, palette color order is reversed
#' @param override_order Colors are picked from palette to maximize readability and aesthetics. This means
#' that colors are not always selected in sequential order from the full palette. If override_order is set to TRUE,
#' colors are selected in sequential order from the full palette instead. Default is FALSE.
#' @param ... Other arguments passed on to \code{\link[ggplot2]{discrete_scale}}
#' @import ggplot2
#' @examples
#' library(ggplot2)
#' ggplot(data=iris, aes(x=Species, y=Sepal.Length, fill=Species)) +
#' geom_violin() +
#' scale_fill_moma_d("vonHeyl")
#' @export
scale_fill_moma_d <- function(palette_name, direction = 1, override_order = FALSE, ...){
  discrete_scale(aesthetics = "fill",
                 scale_name="moma_d",
                 palette= function(n) moma.colors(palette_name=palette_name, n = n, direction = direction, override_order = override_order),
                 ...)
}

#' MoMAColors palettes for plotting with ggplot2
#'
#' Function for using \code{MoMAColors} colors schemes in \code{ggplot2}. Use \code{\link{scale_color_moma_d}} and \code{\link{scale_fill_moma_d}}
#' for discrete scales and \code{\link{scale_color_moma_c}} and \code{\link{scale_fill_moma_c}} for continuous scales.
#'
#' @param palette_name Name of Palette. Choices are:
#' \code{Abbott}, \code{Alkalay1}, \code{Alkalay2}, \code{Althoff}, \code{Andri}, \code{Avedon}, 
#' \code{Budnitz}, \code{Clay}, \code{Connors}, \code{Dali}, \code{Doughton}, \code{Ernst}, 
#' \code{Exter}, \code{Flash}, \code{Fritsch}, \code{Kippenberger}, \code{Klein}, \code{Koons}, 
#' \code{Levine1}, \code{Levine2}, \code{Liu}, \code{Lupi}, \code{Ohchi}, \code{OKeeffe}, \code{Palermo}, 
#' \code{Panton}, \code{Picabia}, \code{Picasso}, \code{Rattner}, \code{Sidhu}, \code{Smith}, \code{ustwo}, 
#' \code{VanGogh}, \code{vonHeyl}, and \code{Warhol}
#' @param direction Sets order of colors. Default palette is 1. If direction is -1, palette color order is reversed
#' @param ... Other arguments passed on to \code{\link[ggplot2]{scale_color_gradientn}}
#' @import ggplot2
#' @examples
#' library(ggplot2)
#' ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Sepal.Length)) +
#' geom_point() +
#' scale_color_moma_c("Avedon", direction=-1)
#' @export
scale_color_moma_c <- function(palette_name, direction=1, ...){
  
  `%notin%` <- Negate(`%in%`)
  
  if (direction %notin% c(1, -1)){
    stop("Direction not valid. Please use 1 for standard palette or -1 for reversed palette.")
  }
  
  scale_color_gradientn(colors=moma.colors(palette_name=palette_name, direction=direction, override_order = F),
                        ...)
}


#' MoMAColors palettes for plotting with ggplot2
#'
#' Function for using \code{MoMAColors} colors schemes in \code{ggplot2}. Use \code{\link{scale_color_moma_d}} and \code{\link{scale_fill_moma_d}}
#' for discrete scales and \code{\link{scale_color_moma_c}} and \code{\link{scale_fill_moma_c}} for continuous scales.
#'
#' @param palette_name Name of Palette. Choices are:
#' \code{Abbott}, \code{Alkalay1}, \code{Alkalay2}, \code{Althoff}, \code{Andri}, \code{Avedon}, 
#' \code{Budnitz}, \code{Clay}, \code{Connors}, \code{Dali}, \code{Doughton}, \code{Ernst}, 
#' \code{Exter}, \code{Flash}, \code{Fritsch}, \code{Kippenberger}, \code{Klein}, \code{Koons}, 
#' \code{Levine1}, \code{Levine2}, \code{Liu}, \code{Lupi}, \code{Ohchi}, \code{OKeeffe}, \code{Palermo}, 
#' \code{Panton}, \code{Picabia}, \code{Picasso}, \code{Rattner}, \code{Sidhu}, \code{Smith}, \code{ustwo}, 
#' \code{VanGogh}, \code{vonHeyl}, and \code{Warhol}
#' @param direction Sets order of colors. Default palette is 1. If direction is -1, palette color order is reversed
#' @param ... Other arguments passed on to \code{\link[ggplot2]{scale_color_gradientn}}
#' @import ggplot2
#' @export
scale_fill_moma_c <- function(palette_name, direction=1, ...){
  
  `%notin%` <- Negate(`%in%`)
  
  if (direction %notin% c(1, -1)){
    stop("Direction not valid. Please use 1 for standard palette or -1 for reversed palette.")
  }
  
  scale_fill_gradientn(colors=moma.colors(palette_name=palette_name, direction=direction, override_order = F),
                       ...)
}


#' MoMAColors palettes for plotting with ggplot2
#'
#' Function for using \code{MoMAColors} colors schemes in \code{ggplot2}. Use \code{\link{scale_color_moma_d}} and \code{\link{scale_fill_moma_d}}
#' for discrete scales and \code{\link{scale_color_moma_c}} and \code{\link{scale_fill_moma_c}} for continuous scales.
#'
#' @param palette_name Name of Palette. Choices are:
#' \code{Abbott}, \code{Alkalay1}, \code{Alkalay2}, \code{Althoff}, \code{Andri}, \code{Avedon}, 
#' \code{Budnitz}, \code{Clay}, \code{Connors}, \code{Dali}, \code{Doughton}, \code{Ernst}, 
#' \code{Exter}, \code{Flash}, \code{Fritsch}, \code{Kippenberger}, \code{Klein}, \code{Koons}, 
#' \code{Levine1}, \code{Levine2}, \code{Liu}, \code{Lupi}, \code{Ohchi}, \code{OKeeffe}, \code{Palermo}, 
#' \code{Panton}, \code{Picabia}, \code{Picasso}, \code{Rattner}, \code{Sidhu}, \code{Smith}, \code{ustwo}, 
#' \code{VanGogh}, \code{vonHeyl}, and \code{Warhol}
#' @param direction Sets order of colors. Default palette is 1. If direction is -1, palette color order is reversed
#' @param override_order Colors are picked from palette to maximize readability and aesthetics. This means
#' that colors are not always selected in sequential order from the full palette. If override_order is set to TRUE,
#' colors are selected in sequential order from the full palette instead. Default is FALSE.
#' @param ... Other arguments passed on to \code{\link[ggplot2]{discrete_scale}}
#' @import ggplot2
#' @examples
#' library(ggplot2)
#' ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) +
#' geom_point() +
#' scale_colour_moma_d("Warhol")
#' @export

scale_colour_moma_d <- scale_color_moma_d

#' MoMAColors palettes for plotting with ggplot2
#'
#' Function for using \code{MoMAColors} colors schemes in \code{ggplot2}. Use \code{\link{scale_color_moma_d}} and \code{\link{scale_fill_moma_d}}
#' for discrete scales and \code{\link{scale_color_moma_c}} and \code{\link{scale_fill_moma_c}} for continuous scales.
#'
#' @param palette_name Name of Palette. Choices are:
#' \code{Abbott}, \code{Alkalay1}, \code{Alkalay2}, \code{Althoff}, \code{Andri}, \code{Avedon}, 
#' \code{Budnitz}, \code{Clay}, \code{Connors}, \code{Dali}, \code{Doughton}, \code{Ernst}, 
#' \code{Exter}, \code{Flash}, \code{Fritsch}, \code{Kippenberger}, \code{Klein}, \code{Koons}, 
#' \code{Levine1}, \code{Levine2}, \code{Liu}, \code{Lupi}, \code{Ohchi}, \code{OKeeffe}, \code{Palermo}, 
#' \code{Panton}, \code{Picabia}, \code{Picasso}, \code{Rattner}, \code{Sidhu}, \code{Smith}, \code{ustwo}, 
#' \code{VanGogh}, \code{vonHeyl}, and \code{Warhol}
#' @param direction Sets order of colors. Default palette is 1. If direction is -1, palette color order is reversed
#' @param ... Other arguments passed on to \code{\link[ggplot2]{scale_color_gradientn}}
#' @import ggplot2
#' @examples
#' library(ggplot2)
#' ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Sepal.Length)) +
#' geom_point() +
#' scale_colour_moma_c("Avedon", direction=-1)
#' @export

scale_colour_moma_c <- scale_color_moma_c



#' View all Available Palettes
#'
#' Function for viewing all palettes available in MoMAColors
#'
#' @param n Number of requested colors. If n is left blank, default palette is returned.
#' @param colorblind_only Should only colorblind friendly palettes be returned? Default is set to FALSE.
#' @param sequential Should palettes displayed all at once, or one at a time. Default is all at once (FALSE).
#' @param direction Sets order of colors. Default palette is 1. If direction is -1, palette color order is reversed
#' @param override_order Colors are picked from palette to maximize readability and aesthetics. This means
#' that colors are not always selected in sequential order from the full palette. If override_order is set to TRUE,
#' colors are selected in sequential order from the full palette instead. Default is FALSE.
#' @examples
#' # All Palettes
#' display.all.moma(sequential = FALSE, colorblind_only = FALSE)
#'
#' # All Colorblind Palettes
#' display.all.moma(sequential = FALSE, colorblind_only = TRUE)
#'
#' # 5 Colors of all Palettes
#' display.all.moma(5, sequential = FALSE, colorblind_only = FALSE)
#' @export
#' @importFrom graphics rect par layout polygon plot.new


display.all.moma <- function(n, sequential = FALSE, colorblind_only = FALSE, direction = 1, override_order=FALSE){
  if(colorblind_only){
    N <- length(colorblind_moma_palettes)
    pal_names <- colorblind_moma_palettes
  }else{
    N <- length(MoMAPalettes)
    pal_names <- names(MoMAPalettes)
  }
  
  orig_pars <- par()
  
  plot_palette = function(name,n){
    par(mar = c(0.1,0.1,1,0.1))
    nn <- ifelse(missing(n), length(moma.colors(name)), n)
    plot(0,type='n',bty='n',xaxt='n',yaxt='n',xlab='',ylab='',
         ylim = c(0,1),xlim=c(0,nn), main = name)
    for(j in 1:nn){
      polygon(x = c(j-1,j-1,j,j),
              y = c(0,1,1,0),
              border = NA,
              col = moma.colors(name, nn, direction= direction,override_order=override_order)[j])
    }
  }
  
  
  if(sequential){
    for(i in 1:N){
      
      if(missing(n)){
        
        plot_palette(pal_names[i])
        if(i < N) cat("Hit 'Enter' for next palette");readline()
        
      }else{
        
        plot_palette(pal_names[i],n)
        if(i < N) cat("Hit 'Enter' for next palette");readline()
      }
    }
  }else{
    
    if(missing(n)){
      
      if(colorblind_only){
        
        par(mfrow = c(5, 5))
        for(i in 1:25){
          if(i <= length(pal_names)){plot_palette(pal_names[i])}else{plot.new()}
        }
        
        
      }else{
        par(mfrow = c(6, 6))
        for(i in 1:36){
          if(i <= length(pal_names)){plot_palette(pal_names[i])}else{plot.new()}
        }
      
        
      }
      
    } else{
      
      if(colorblind_only){
        
        par(mfrow = c(5, 5))
        for(i in 1:25){
          if(i <= length(pal_names)){plot_palette(pal_names[i], n)}else{plot.new()}
        }
        
      }else{
        
        par(mfrow = c(6, 6))
        for(i in 1:36){
          if(i <= length(pal_names)){plot_palette(pal_names[i], n)}else{plot.new()}
        }
        
      }
      
    }
    
    layout(matrix(1,1,1))
    par(mar = orig_pars$mar)
    
  }
}

#' View Sample Visualization for Palettes
#'
#' Creates four sample visualizations for testing how a palette looks.
#'
#' @param palette_name Name of Palette. Choices are:
#' \code{Abbott}, \code{Alkalay1}, \code{Alkalay2}, \code{Althoff}, \code{Andri}, \code{Avedon}, 
#' \code{Budnitz}, \code{Clay}, \code{Connors}, \code{Dali}, \code{Doughton}, \code{Ernst}, 
#' \code{Exter}, \code{Flash}, \code{Fritsch}, \code{Kippenberger}, \code{Klein}, \code{Koons}, 
#' \code{Levine1}, \code{Levine2}, \code{Liu}, \code{Lupi}, \code{Ohchi}, \code{OKeeffe}, \code{Palermo}, 
#' \code{Panton}, \code{Picabia}, \code{Picasso}, \code{Rattner}, \code{Sidhu}, \code{Smith}, \code{ustwo}, 
#' \code{VanGogh}, \code{vonHeyl}, and \code{Warhol}
#' @param n Number of desired colors. If number of requested colors is beyond the scope of the palette,
#' colors are automatically interpolated. If n is not provided, the length of the palette is used.
#' @param direction Sets order of colors. Default palette is 1. If direction is -1, palette color order is reversed
#' @param override_order Colors are picked from palette to maximize readability and aesthetics. This means
#' that colors are not always selected in sequential order from the full palette. If override_order is set to TRUE,
#' colors are selected in sequential order from the full palette instead. Default is FALSE.
#' @export
#' @importFrom ggstream geom_stream
#' @importFrom cowplot ggdraw plot_grid draw_label
#' @importFrom stats rnorm runif

test.plots.moma <- function(palette_name, n, direction=1, override_order=FALSE){
  
  if(missing(n)){
    n <- length(moma.colors(palette_name))
  }
  
  if(n > 26){
    stop("Cannot create visualation when requesting more than 26 colors.")
  }
  
  type <- if(n > length(moma.colors(palette_name))){"continuous"}else{"discrete"}
  
  test_pal <- moma.colors(palette_name, n, type, direction, override_order, return_hex = FALSE)
  
  pie_plot <- ggplot() +
    geom_bar(aes(x=1:n, y=runif(n, 2, 3), fill=letters[1:n]), stat="identity") +
    coord_polar() +
    scale_x_continuous(expand = c(0, 0.04)) +
    scale_fill_manual(values=test_pal) +
    theme_void() +
    theme(legend.position = "none",
          plot.background = element_rect(color="white", fill="white"))
  
  stream <- data.frame(col=sort(rep(letters[1:n], 10)))
  
  stream_plot <- ggplot(data = stream) +
    geom_stream(aes(x=rep(1:10, n), y=runif(10*n, 0, 3), fill=col), extra_span = 0.15) +
    scale_x_continuous(expand = c(0, 0.04)) +
    scale_fill_manual(values=test_pal) +
    theme_void() +
    theme(legend.position = "none",
          plot.background = element_rect(color="white", fill="white"))
  
  violin_plot <- ggplot() +
    geom_violin(aes(x=sort(rep(1:n, 15)), y=rnorm(15*n, 0, 0.75), fill=sort(rep(letters[1:n], 15))), color="transparent") +
    scale_x_continuous(expand = c(0, 0.04)) +
    scale_fill_manual(values=test_pal) +
    theme_void() +
    theme(legend.position = "none",
          plot.background = element_rect(color="white", fill="white"))
  
  bars_plot <- ggplot() +
    geom_bar(aes(x=rep(1:5, n), y=runif(5*n, 0, 5), fill=sort(rep(letters[1:n], 5))), stat="identity", position = "stack") +
    scale_x_continuous(expand = c(0, 0.04)) +
    scale_fill_manual(values=test_pal) +
    theme_void() +
    theme(legend.position = "none",
          plot.background = element_rect(color="white", fill="white"))
  
  
  title <- ggdraw() + draw_label(palette_name, fontface = "bold", x = 0.5, hjust = 0.5, size=rel(20))
  grid <- plot_grid(pie_plot, stream_plot, violin_plot, bars_plot,  nrow=2)
  test_grid <- plot_grid(title, grid, ncol=1, rel_heights = c(0.1, 1)) + 
    theme(plot.background = element_rect(color="white", fill="white"))
  
  print(test_grid)
}



