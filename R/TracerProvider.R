TracerProvider <- R6::R6Class(
  classname = "TracerProvider",
  public = list(
    initialize = function(
      sampler = NULL,
      resource = NULL,
      shutdown_on_exit = TRUE,
      active_span_processor = NULL,
      if_generator = NULL,
      span_limits = NULL
    ) {

    },
    resource = NULL,
    get_tracer = function() {
      stop("Not Implemented.")
    },
    add_span_processor = function(processor) {
      private[["span_processors"]] <- append(
        private[["span_processors"]],
        processor
      )
    },
    shutdown = function() {
      stop("Not Implemented.")
    },
    force_flush = function() {
      stop("Not Implemented.")
    }
  ),
  private = list(
    shutdown_on_exit = TRUE,
    finalizer = function() {
      if (private[["shutdown_on_exit"]]) {
        self$shutdown()
      }
    },
    span_processors = list()
  )
)
