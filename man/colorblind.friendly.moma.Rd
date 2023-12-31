% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Functions.R
\name{colorblind.friendly.moma}
\alias{colorblind.friendly.moma}
\title{Colorblind-Friendly Palette Check}
\usage{
colorblind.friendly.moma(palette_name)
}
\arguments{
\item{palette_name}{Name of Palette. Choices are:
\code{Abbott}, \code{Alkalay1}, \code{Alkalay2}, \code{Althoff}, \code{Andri}, \code{Avedon},
\code{Budnitz}, \code{Clay}, \code{Connors}, \code{Dali}, \code{Doughton}, \code{Ernst},
\code{Exter}, \code{Flash}, \code{Fritsch}, \code{Kippenberger}, \code{Klein}, \code{Koons},
\code{Levine1}, \code{Levine2}, \code{Liu}, \code{Lupi}, \code{Ohchi}, \code{OKeeffe}, \code{Palermo},
\code{Panton}, \code{Picabia}, \code{Picasso}, \code{Rattner}, \code{Sidhu}, \code{Smith}, \code{ustwo},
\code{VanGogh}, \code{vonHeyl}, and \code{Warhol}}
}
\value{
TRUE/FALSE value whether palette is colorblind-friendly
}
\description{
Checks whether a palette is colorblind-friendly. Colorblind-friendliness tested using the 'colorblindcheck' package.
To be colorblind-friendly, all colors in the palettes must be distinguishable with deuteranopia, protanopia, and tritanopia.
}
\examples{
colorblind.friendly.moma("Koons")
}
