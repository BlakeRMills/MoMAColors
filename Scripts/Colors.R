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
  Levine2  = list(c("#e3d0d6", "#AD6775", "#C9A1AC", "#3f6083", "#3d4651", "#568F8C", "#d0d6bc"), c(1:7), colorblind = TRUE),
  Liu = list(c("#9FD7BD", "#9B5C1C", "#97C124", "#3B5F13", "#DDB25D", "#5C4A32"), c(1:6), colorblind = FALSE),
  Lupi = list(c("#61bea4", "#b6e7e0", "#aa3f5d", "#daa5ac", "#98a54f", "#2e92a2", "#ffb651", "#d85a44"), c(1:8), colorblind=FALSE),
  Ohchi = list(c("#582851", "#40606d", "#69a257", "#e3d19c", "#c4024d"), c(1:5), colorblind = TRUE),
  OKeeffe = list(c("#f3d567", "#ee9b43", "#e74b47", "#b80422", "#172767", "#19798b"), c(1:6), colorblind=TRUE),
  Palermo = list(c("#1b80ad", "#ea5b57", "#9c5555", "#0c3c5f"), c(1:4), colorblind=TRUE),
  Panton = list(c("#e84a00","#bb1d2c","#9b0c43","#661f66","#2c1f62","#006289","#004759"), c(1:8), colorblind=FALSE),
  Picabia = list(c("#53362e", "#744940", "#9f7064", "#c99582", "#e6bcac", "#a5a6ae","#808190", "#666879", "#565661", "#3d3d47"), c(1:10), colorblind = TRUE),
  Picasso = list(c("#d5968c", "#c2676d", "#5c363a", "#995041", "#45939c", "#0f6a81"), c(1:6), colorblind=TRUE),
  Rattner = list(c("#de8e69", "#f1be99", "#c1bd38", "#7a9132", "#4C849A", "#184363", "#5D5686", "#A39FC9"), c(1:8), colorblind = TRUE),
  Sidhu = list(c("#af4646", "#762b35", "#005187", "#251C4A", "#78ADB7", "#4C9A77", "#1b7975"), c(1:7), colorblind = TRUE),
  Smith = list(c("#ef7923", "#75bca9", "#7b89bb", "#e9de97", "#2a2e38"), c(1:5), colorblind=TRUE),
  ustwo = list(c("#d7433b", "#f06a63", "#ff8e5e", "#ffcc3d", "#95caa6", "#008d98"), c(1:6), colorblind=TRUE),
  VanGogh = list(c("#c3a016", "#c3d878", "#58A787", "#8ebacd", "#246893", "#163274", "#0C1F4B"), c(1:7), colorblind=TRUE),
  vonHeyl = list(c("#f96149", "#ffa479", "#e7d800", "#94aec2", "#0d0c0b"), c(1:5), colorblind=TRUE),
  Warhol = list(c("#ff0066", "#328c97", "#a5506d", "#d1aac2", "#b3e0bf", "#edf181", "#db7003", "#fba600", "#f8c1a6", "#ff3200", "#011a51", "#916c37", "#97d1d9"), c(1:13), colorblind=FALSE)
)

ChoppingBlock <- list(
  Abbott = list(c("#950404", "#e04b28", "#c38961", "#9f5630", "#388f30", "#0f542f", "#007d82", "#004042"), c(1:8), colorblind=FALSE),
  Levine1  = list(c("#e0ddca", "#818061", "#6b4350", "#8b4d5b", "#d5c184", "#45424b", "#525566", "#a58d81"), c(1:8), colorblind = FALSE),
  Lupi = list(c("#61bea4", "#b6e7e0", "#aa3f5d", "#daa5ac", "#98a54f", "#2e92a2", "#ffb651", "#d85a44"), c(1:8), colorblind=FALSE),
  Ohchi = list(c("#582851", "#40606d", "#69a257", "#e3d19c", "#c4024d"), c(1:5), colorblind = TRUE))

CancelledColors <- list(
  Ackermann = list(c("#DD8C7B", "#88344A", "#4B3549", "#8A0B28", "#BC6B41", "#D3A265"), c(1:6), colorblind = NA),
  Agam = list(c("#cadd9f", "#5bb7a4", "#4987d3", "#1d369a", "#685db7", "#d46ca6", "#922d2a", "#b2372c", "#c7552b", "#d87a2a", "#dfa830", "#dfc539"),c(1:12), colorblind=NA),
  Alkalay1 = list(c("#241d1d", "#5b2125", "#8d3431", "#bf542e", "#e9a800"), c(1:5), colorblind=NA),
  Althoff2 = list(c("#e7d43f", "#92a742", "#467f3a", "#256249", "#003869", "#541a58"), c(1:6), colorblind=NA),
  Arman = list(c("#d54c4d", "#f7aa49", "#ffc950", "#90d162", "#9de8df", "#333f7a"), c(1:6), colorblind=NA),
  Axell = list(c("#d96860", "#bd2b1c", "#d76000", "#e5a400", "#f2d734", "#b6c448", "#7ab150", "#19763a"), c(1:8), colorblind=NA),
  Baker = list(c("#af1f2d", "#e5502e", "#f7cb3a", "#4fa07a", "#3462cb", "#654b94"), c(1:6), colorblind=NA),
  Bavington = list(c("#fac2e0", "#f593af", "#ed6378", "#e74554", "#bd3409", "#eb6838", "#ec862e", "#eeb632", "#c4b511", "#9ca000"), c(1:10), colorblind=NA),
  Budnitz2 = list(c("#f21887", "#e567a6", "#e5a1c3", "#f0f2f1", "#a1e5e5", "#55cccc", "#13c1c1"), c(1:7), colorblind = FALSE),
  Caland = list(c("#cf4e5e", "#7b2b35", "#c62e23", "#de5635", "#f0932e", "#f7d900"), c(1:6), colorblind=NA),
  Clay = list(c("#c48329", "#8b3b36", "#a2b4b7", "#514a2e", "#8E4115", "#cf9860"), c(1:6), colorblind = FALSE),
  doAmaral = list(c("#f3bc40", "#387f78", "#1a423e", "#4e8abb", "#152939"), c(1:5), colorblind=NA),
  Doughton2 = list(c("#87e9ab", "#3beb7c", "#28b25b", "#065523", "#82cbed", "#309bd9","#284cc3", "#192a63", "#ee6995", "#e63974", "#b32756", "#902347"), c(1:12), colorblind = FALSE),
  Exter3 = list(c("#f9e1dc", "#c7959e", "#a45e71", "#8b2734", "#df7c72", "#e5836a", "#db5039", "#f4c687", "#f7eaa1", "#4a77c9", "#2f4cad"), c(1:11), colorblind=NA),
  Exter5 = list(c("#a9281a", "#cc5b15", "#e2a224", "#00618b", "#1b234f", "#06071d"), c(1:6), colorblind=NA),
  Gilliam = list(c("#dfb322", "#e37c2a", "#e04a5a", "#7d87d6", "#5c307e", "#1b4260"), c(1:6), colorblind=NA),
  Gillick = list(c("#831515", "#e38209", "#e6ce00", "#a8a600", "#6b812a", "#255225", "#115162", "#8bbad2", "#053066", "#573236"), c(1:10), colorblind=NA),
  Gross = list(c("#507b81", "#727546", "#bb116c", "#5d6aa4", "#70473e", "#58a2cd","#b6273b", "#d4c991", "#c2643f"), c(1:9), colorblind = FALSE),
  Jeyifous1 = list(c("#ff7947", "#f1aa31", "#ffd000", "#b4ae37", "#424c0d", "#292521"), c(1:6), colorblind=NA),
  Jeyifous3 = list(c("#d65038", "#db7425", "#fbeb32", "#575824", "#26a7f4", "#2c6b70"), c(1:6), colorblind=NA),
  Johns = list(c("#dd8075", "#ca2f2b", "#fe9307", "#f4b322", "#005fa2", "#9c8fc6"), c(1:6), colorblind=NA),
  Kaphar = list(c("#9681ae", "#da1c15", "#ecb200", "#db5966", "#138948", "#117e7e"), c(1:6), colorblind=NA),
  Katz = list(c("#e77c78", "#64272f", "#d7263e", "#e9452f", "#313a55"), c(1:5), colorblind=NA),
  Kupka = list(c("#d1be5d", "#e5ba28", "#a28323", "#7a7c12", "#3f6215", "#204115", "#0e2625", "#0e1731", "#681c43"), c(1:9), colorblind=NA),
  Leger = list(c("#080a09", "#c44814", "#cb671e", "#ddc14c", "#032b1b"), c(1:5), colorblind=NA),
  Lichtenstein3 = list(c("#dba193", "#921c29", "#d6af00", "#ebd300", '#292524'), c(1:5), colorblind=NA),
  Lichtenstein4 = list(c("#e99b91", "#e3302d", "#f0cf00", "#26308f", "#181941"), c(1:5), colorblind=NA),
  Mendini = list(c("#cf766d", "#d99a42", "#f7c228","#d3bd41", "#2a7e4f", "#91c0b0", "#2b7585", "#6779ae"), c(1:8), colorblind=NA),
  Monet = list(c("#c18381", "#dbc9ab", "#b1b197","#57776d", "#43767b", "#5e89aa", "#477790", "#586497", "#6c607e"), c(1:9), colorblind=NA),
  Ofili = list(c("#264139", "#608142", "#eac500", "#bf5126", "#69383f", "#452b43"), c(1:6), colorblind=NA),
  OKeeffe2 = list(c("#96c7dc", "#4a99c0", "#4f7eb0", "#134980", "#001038", "#5dc0a9", "#a4ccbe", "#bbe0c4", "#ccb9ce"), c(1:9), colorblind=NA),
  Pintori = list(c("#557c75", "#2b2623", "#e7dfac", "#29365a", "#95b17c", "#a54233", "#8c8fb5"), c(1:7), colorblind = TRUE),
  Prekop = list(c("#f9a0b2", "#fd0800", "#00906f", "#7caef0", "#0066ca", "#201f24"), c(1:6), colorblind=NA),
  Pollock4 = list(c("#c34f95", "#aa532e", "#eaa244", "#889d56", "#717fac"), c(1:5), colorblind=NA),
  Popova = list(c("#9c2b1b", "#cb8990", "#1e1918", "#5e605a"), c(1:4), colorblind=NA),
  Rousseau = list(c("#173717", "#5d8d87", "#5b6f3d", "#2c5136", "#674f25", "#1e5057"), c(1:6), colorblind=NA),
  Rothko = list(c("#2e8651", "#e6be77", "#9e4470", "#ce3e10", "#372f32"), c(1:5), colorblind=NA),
  Shaw = list(c("#e6fc73", "#9af283", "#4db984", "#62b2e0", "#30367b", "#9b41bb", "#fd7ab0", "#bd373e", "#fd8f58"), c(1:9), colorblind = NA),
  Shonibare = list(c("#600043", "#a20b21", "#d87902", "#cc9a00", "#217a2b", "#008c80", "#002d4e"), c(1:7), colorblind=NA),
  Terrill = list(c("#7c2812", "#aa502a", "#d59700", "#286844", "#30738f", "#3fa4d8", "#2c2e48", "#5a528a"), c(1:8), colorblind=NA),
  Villon3 = list(c("#c7513c", "#d89046", "#529a96", "#2c447d", "#22211e"), c(1:5), colorblind=NA),
  Villon4 = list(c("#92c0a7", "#6fb275", "#617e4c", "#468374", "#829ad9", "#535ea6", "#3b21b4", "#7f7094"), c(1:8), colorblind=NA),
  Wright = list(c("#9f5e48", "#d4a559", "#dabb87", "#a2ac89", "#89b6bd"), c(1:5), colorblind=NA)
)
