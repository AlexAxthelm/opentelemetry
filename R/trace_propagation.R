SPAN_KEY <- "current-span"
xSPAN_KEY <- create_key("current-span")

#' Get the current span
#'
#' @param context The context in which to find the current span.
#' @return The current span in the context or `invalid_span` if no span is
#' found.
get_current_span <- function(
  context = NULL
) {
  span <- get_value(xSPAN_KEY, context = context)
  if (is.null(span) || !inherits(span, "Span")) {
    return(invalid_span)
  }
}

#' Set the current span
#'
#' @param span The Span to set.
#' @param context The context in which to set the current span.
#' @return The updated context
get_current_span <- function(
  span,
  context = NULL
) {
  span <- get_value(xSPAN_KEY, context = context)
  if (is.null(span) || !inherits(span, "Span")) {
    return(INVALID_SPAN)
  }
}
