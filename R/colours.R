#' Landscape 2 theme
#'
#' @param ... arguments passed to [ggplot2::theme_bw()] which this custom theme is derived from.
#' @returns a ggplot2 theme to add to your plots
#'
#' @export
#' @examples
#' library(ggplot2)
#' ggplot(iris, aes(x=Petal.Width, y = Petal.Length)) +
#'   geom_point() +
#'   theme_landscape2()
#' @importFrom ggplot2 %+replace%
theme_landscape2 <- function(...) {
  ggplot2::theme_bw(...) %+replace% ggplot2::theme(
    axis.title = ggplot2::element_text(size = 14), # Axis titles
    axis.text = ggplot2::element_text(size = 12, color = "black"), # Axis text
    axis.line = ggplot2::element_line(color = "black"), # Axis lines
    legend.background = ggplot2::element_blank(), # Legend background
    legend.key = ggplot2::element_rect(fill = "white", color = NA), # Legend key background
    plot.title = ggplot2::element_text(size = 16, face = "bold", hjust = 0.5), # Title
    plot.subtitle = ggplot2::element_text(size = 14, hjust = 0.5), # Subtitle
    plot.caption = ggplot2::element_text(size = 10, hjust = 1) # Caption
  )
}

#' Default colours of events
#'
#' @returns a character vector mapping events to colours. Plug into manual scales like `scale_fill_manual(values = palette_event())`
#'
#' @export
#'
#' @examples
#' palette_event()
palette_event <- function() {
  c(
    Diagnosis = "#87CEFF",
    Refractory = "#AB82FF",
    Relapse = "#EEAEEE",
    Secondary = "#9AFF9A"
  )
}

#' Default colours of events
#'
#' @returns a character vector describing colours of dx categories. Plug into manual scales like `scale_fill_manual(values = palette_event())`
#'
#' @export
#'
#' @examples
#' palette_cancer_category()
palette_cancer_category <- function() {
  c(
    BT = "#E64B35",
    HM = "#4DBBD5",
    NBL = "#00A087",
    Sarcoma = "#3C5488",
    `Solid Tumour` = "#F39B7F"
  )
}


#' Preview colour palette
#'
#' @param cols character vector where values are colours and names are group
#'
#' @returns a plot displaying both groups and their colour
#'
#' @export
#' @examples
#' preview_palette(palette_cancer_category())
#'
preview_palette <- function(cols) {
  df <- data.frame(
    group = names(cols),
    colour = unname(cols)
  )

  ggplot2::ggplot(
    df,
    ggplot2::aes(x = 1, y = .data[["group"]], fill = .data[["group"]])
  ) +
    ggplot2::geom_tile(width = 1, height = 0.8) +
    ggplot2::geom_text(
      ggplot2::aes(label = paste0(.data[["group"]], "  ", .data[["colour"]])),
      x = 1.6,
      hjust = 0
    ) +
    ggplot2::scale_fill_manual(values = cols) +
    ggplot2::xlim(0.5, 5) +
    ggplot2::theme_void() +
    ggplot2::theme(legend.position = "none")
}
