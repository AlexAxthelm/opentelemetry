SpanExporter <- R6::R6Class(
  classname = "SpanExporter",
  public = list(
    export = function(spans) {
      stop("Method 'export' must be implemented in subclass")
    },
    shutdown = function() {
      stop("Method 'shutdown' must be implemented in subclass")
    },
    force_flush = function() {
      stop("Method 'force_flush' must be implemented in subclass")
    }
  )
)
