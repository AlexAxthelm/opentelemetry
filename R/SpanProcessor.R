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
    },
    span_exporter = NULL
  )
)
