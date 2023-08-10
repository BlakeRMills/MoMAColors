library(ggplot2)
library(showtext)
font <- "Advent Pro"
font_add_google("Advent Pro")
showtext_auto()

# Discrete

dis <- function(name){
  pal <- Colors[[name]]
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
        plot.title = element_text(hjust=0.5, size=50, face=2, family=font, vjust=-1))
}


dis("Connors")

