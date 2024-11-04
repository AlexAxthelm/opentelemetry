SpanProcessor <- R6::R6Class(
  classname = "SpanProcessor",
  public = list(
    on_start = function(span) {
      stop("Method 'on_start' must be implemented in subclass")
    },
    on_end = function(span) {
      stop("Method 'on_end' must be implemented in subclass")
    },
    shutdown = function() {
      stop("Method 'shutdown' must be implemented in subclass")
    },
    force_flush = function() {
      stop("Method 'force_flush' must be implemented in subclass")
    }
  ),
  private = list(
    exporter = NULL
  )
)

SimpleSpanProcessor <- R6::R6Class(
  classname = "SimpleSpanProcessor",
  inherit = SpanProcessor,
  public = list(
    initialize = function(exporter) {
      private$exporter <- exporter
    },
    on_start = function(span) {
      log_trace("SimpleSpanProcessor: on_start")
    },
    on_end = function(span) {
      log_trace("SimpleSpanProcessor: on_end")
    },
    shutdown = function() {
      self$exporter$shutdown()
    },
    force_flush = function() {
      log_debug("SimpleSpanProcessor: force_flush")
      return(TRUE)
    }
  )
)

