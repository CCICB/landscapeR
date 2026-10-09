#' Save a ggplot as a PDF
#'
#' @param plot A ggplot object.
#' @param outdir Output directory.
#' @param prefix Filename prefix, without extension.
#' @param width,height Plot dimensions.
#' @param units Units for width and height.
#'
#' @return Invisibly returns the saved file path.
#' @export
save_ggplot_as_pdf <- function(
  plot,
  outdir,
  prefix,
  width = NA,
  height = NA,
  units = c("in", "cm", "mm", "px")
) {
  units <- rlang::arg_match(units)
  filename <- paste0(outdir, "/", prefix, ".pdf")

  ggplot2::ggsave(
    filename = filename,
    plot = plot,
    width = width,
    height = height,
    units = units,
    dpi = 300,
    limitsize = TRUE,
    bg = NULL,
    create.dir = TRUE
  )
}
