BatchSpanProcessor <- R6::R6Class(
  classname = "BatchSpanProcessor",
  inherit = SpanProcessor,
  public = list(
    initialize = function(exporter) {
      private[["exporter"]] <- exporter
    },
    on_start = function(span) {
      stop("Not Implemented.")
    },
    on_end = function(span) {
      stop("Not Implemented.")
    },
    shutdown = function() {
      self[["exporter"]][["shutdown"]]()
    },
    worker = function() {
      stop("Not Implemented.")
    },
    force_flush = function() {
      stop("Not Implemented.")
    }
  ),
  private = list(
    exporter = NULL,
    finalizer = function() {
      self$shutdown()
    }
  )
)

