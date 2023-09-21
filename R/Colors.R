# List of Color Palettes and the order in which they are printed

#' Complete list of palettes.
#' 
#' Use names(MoMAPalettes) to return all possible palette names. Current choices are:
#' \code{Abbott}, \code{Alkalay}, \code{Althoff}, \code{Andri}, \code{Avedon}, \code{Budnitz}, 
#' \code{Connors}, \code{Doughton}, \code{Ernest}, \code{Exter}, \code{Flash}, \code{Fritsch}, 
#' \code{Klein}, \code{Koons}, \code{Levine1}, \code{Levine2}, \code{Liu}, \code{Lupi}, 
#' \code{Ohchi}, \code{OKeeffe}, \code{Palermo}, \code{Panton}, \code{Picabia}, \code{Picasso}, 
#' \code{Rattner}, \code{Sidhu}, \code{Smith}, \code{ustwo}, \code{VanGogh}, \code{vonHeyl}, 
#' and \code{Warhol}
#' Use \code{\link{moma.colors}} to construct palettes.
#' 
#' @export
MoMAPalettes <- list(
  Abbott = list(c("#950404", "#e04b28", "#c38961", "#9f5630", "#388f30", "#0f542f", "#007d82", "#004042"), c(1:8), colorblind=FALSE),
  Alkalay = list(c("#ebcf2e", "#b0c13f", "#87ab3a", "#5e9431", "#378030", "#225f2f", "#252916"), c(1:7), colorblind=TRUE),
  Althoff = list(c("#ff9898", "#d9636c", "#a91e45", "#691238", "#251714"), c(1:5), colorblind=TRUE),
  Andri = list(c("#f56455", "#15134b", "#87c785", "#572f30"), c(1:4), colorblind=TRUE),
  Avedon = list(c("#ff7200", "#ff8827", "#ff9c4c", "#ffb274", "#f1caa8", "#e3e1dc","#c2ceaa", "#a1ba77", "#8bac54", "#7ea13e", "#648c16"), c(1:11), colorblind = FALSE),
  Budnitz = list(c("#86dd45", "#d4e63a", "#fda900", "#fd5300", "#57348b"), c(1:5), colorblind = FALSE),
  Connors = list(c("#d92a05", "#f35d36", "#ef9073", "#ffba1b", "#51DBA2"), c(1:5), colorblind=TRUE),
  Doughton = list(c("#155b51", "#216f63", "#2d8277", "#3a9387", "#45a395", "#c468b2","#af509c", "#803777", "#5d2155", "#45113f"), c(1:10), colorblind = TRUE),
  Ernest = list(c("#e8e79a", "#c2d89a", "#8cbf9a", "#5fa2a4", "#477b95", "#315b88", "#233572", "#191f40"), c(1:8), colorblind=TRUE),
  Exter = list(c("#ffec9d", "#fac881", "#f4a464", "#e87444", "#d9402a", "#bf2729", "#912534", "#64243e", "#3d1b28", "#161212"), c(1:10), colorblind=TRUE),
  Flash = list(c("#e3c0db", "#db95cb", "#cd64b5", "#B83D9F", "#900c7e", "#680369", "#41045a", "#140e3a"), c(1:8), colorblind=TRUE),
  Fritsch = list(c("#0f8d7b", "#8942bd", "#1e1a1a", "#eadd17"), c(1:4), colorblind=TRUE),
  Klein = list(c("#ff4d6f", "#579ea4", "#86ad34", "#df7713", "#f9c000", "#5d7298","#81b28d", "#7e1a2f", "#2d2651", "#c8350d", "#bd777a"), c(1:11), colorblind = FALSE),
  Koons = list(c("#d8537d", "#6DC5B2", "#eeca76", "#5d2314", "#b5282a"), c(1:5), colorblind=TRUE),
  Levine1  = list(c("#e0ddca", "#818061", "#6b4350", "#8b4d5b", "#d5c184", "#45424b", "#525566", "#a58d81"), c(1:8), colorblind = FALSE),
  Levine2  = list(c("#e3d0d6", "#ad6775", "#c9a1ac", "#3f6083", "#3d4651", "#568f8c", "#d0d6bc"), c(1:7), colorblind = TRUE),
  Liu = list(c("#9fd7bd", "#9b5c1c", "#97c124", "#3b5f13", "#ddb25d", "#5c4a32"), c(1:6), colorblind = FALSE),
  Lupi = list(c("#61bea4", "#b6e7e0", "#aa3f5d", "#daa5ac", "#98a54f", "#2e92a2", "#ffb651", "#d85a44"), c(1:8), colorblind=FALSE),
  Ohchi = list(c("#582851", "#40606d", "#69a257", "#e3d19c", "#c4024d"), c(1:5), colorblind = TRUE),
  OKeeffe = list(c("#f3d567", "#ee9b43", "#e74b47", "#b80422", "#172767", "#19798b"), c(1:6), colorblind=TRUE),
  Palermo = list(c("#1b80ad", "#ea5b57", "#9c5555", "#0c3c5f"), c(1:4), colorblind=TRUE),
  Panton = list(c("#e84a00","#bb1d2c","#9b0c43","#661f66","#2c1f62","#006289","#004759"), c(1:8), colorblind=FALSE),
  Picabia = list(c("#53362e", "#744940", "#9f7064", "#c99582", "#e6bcac", "#a5a6ae","#808190", "#666879", "#565661", "#3d3d47"), c(1:10), colorblind = TRUE),
  Picasso = list(c("#d5968c", "#c2676d", "#5c363a", "#995041", "#45939c", "#0f6a81"), c(1:6), colorblind=TRUE),
  Rattner = list(c("#de8e69", "#f1be99", "#c1bd38", "#7a9132", "#4c849a", "#184363", "#5d5686", "#a39fc9"), c(1:8), colorblind = TRUE),
  Sidhu = list(c("#af4646", "#762b35", "#005187", "#251c4a", "#78adb7", "#4c9a77", "#1b7975"), c(1:7), colorblind = TRUE),
  Smith = list(c("#ef7923", "#75bca9", "#7b89bb", "#e9de97", "#2a2e38"), c(1:5), colorblind=TRUE),
  ustwo = list(c("#d7433b", "#f06a63", "#ff8e5e", "#ffcc3d", "#95caa6", "#008d98"), c(1:6), colorblind=TRUE),
  VanGogh = list(c("#c3a016", "#c3d878", "#58a787", "#8ebacd", "#246893", "#163274", "#0C1F4b"), c(1:7), colorblind=TRUE),
  vonHeyl = list(c("#f96149", "#ffa479", "#e7d800", "#94aec2", "#0d0c0b"), c(1:5), colorblind=TRUE),
  Warhol = list(c("#ff0066", "#328c97", "#a5506d", "#d1aac2", "#b3e0bf", "#edf181", "#db7003", "#fba600", "#f8c1a6", "#ff3200", "#011a51", "#916c37", "#97d1d9"), c(1:13), colorblind=FALSE)
)