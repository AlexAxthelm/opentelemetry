SimpleSpanProcessor <- R6::R6Class(
  classname = "SimpleSpanProcessor",
  inherit = SpanProcessor,
  public = list(
    initialize = function(exporter) {
      self[["span_exporter"]] <- exporter
    },
    on_start = function(span) {
      stop("Not Implemented.")
    },
    on_end = function(span) {
      stop("Not Implemented.")
    },
    shutdown = function() {
      self[["span_exporter"]][["shutdown"]]()
    },
    force_flush = function() {
      return(TRUE)
    }
  ),
  private = list(
    finalizer = function() {
      self$shutdown()
    }
  )
)
