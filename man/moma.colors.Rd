% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Functions.R
\name{moma.colors}
\alias{moma.colors}
\title{MoMA Palette Generator}
\usage{
moma.colors(
  palette_name,
  n,
  type = c("discrete", "continuous"),
  direction = c(1, -1),
  override_order = FALSE,
  return_hex = FALSE
)
}
\arguments{
\item{palette_name}{Name of Palette. Choices are:
\code{Abbott}, \code{Alkalay1}, \code{Alkalay2}, \code{Althoff}, \code{Andri}, \code{Avedon},
\code{Budnitz}, \code{Clay}, \code{Connors}, \code{Dali}, \code{Doughton}, \code{Ernst},
\code{Exter}, \code{Flash}, \code{Fritsch}, \code{Kippenberger}, \code{Klein}, \code{Koons},
\code{Levine1}, \code{Levine2}, \code{Liu}, \code{Lupi}, \code{Ohchi}, \code{OKeeffe}, \code{Palermo},
\code{Panton}, \code{Picabia}, \code{Picasso}, \code{Rattner}, \code{Sidhu}, \code{Smith}, \code{ustwo},
\code{VanGogh}, \code{vonHeyl}, and \code{Warhol}}

\item{n}{Number of desired colors. If number of requested colors is beyond the scope of the palette,
colors are automatically interpolated. If n is not provided, the length of the palette is used.}

\item{type}{Either "continuous" or "discrete". Use continuous if you want to automatically
interpolate between colors.}

\item{direction}{Sets order of colors. Default palette is 1. If direction is -1, palette color order is reversed}

\item{override_order}{Colors are picked from palette to maximize readability and aesthetics. This means
that colors are not always selected in sequential order from the full palette. If override_order is set to TRUE,
colors are selected in sequential order from the full palette instead. Default is FALSE.}

\item{return_hex}{Default is FALSE. If TRUE, hex codes of colors will be returned in addition to the palette.}
}
\value{
A vector of colors.
}
\description{
Color palettes inspired by works at The Museum of Modern Art in New York City. Complete list of palette colors
and the works that inspired them can be found \href{https://github.com/BlakeRMills/MoMAColors}{on Github}.
Use \code{\link{colorblind.friendly.moma}} to check whether palettes are colorblind-friendly.
}
\keyword{colors}
