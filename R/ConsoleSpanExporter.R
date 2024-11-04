ConsoleSpanExporter <- R6::R6Class(
  classname = "ConsoleSpanExporter",
  inherit = SpanExporter,
  public = list(
    export = function(spans) {
      for (span in spans) {
        cat(span$to_string(), "\n")
      }
    },
    shutdown = function() {
      stop("Not Implemented.")
    },
    force_flush = function() {
      stop("Not Implemented.")
    }
  )
)

