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
    get_tracer = function(
      instrumenting_module_name,
      instrumenting_library_version,
      schema_url = NULL,
      attributes = list()
    ) {
      if (private[["disabled"]]) {
        log_warn("OpenTelemetry SDK is disabled.")
        return(NoOpTracer[["new"]]())
      }
      tracer <- Tracer[["new"]](
        sampler = self[["sampler"]],
        resource = self[["resource"]],
        span_processor = self[["active_span_processor"]],
        id_generator = self[["id_generator"]],
        span_limits = self[["span_limits"]],
        instrumentation_info = InstrumentationInfo[["new"]](
          name = instrumenting_module_name,
          version = instrumenting_library_version,
          schema_url = schema_url
        ),
        instrumentation_scope = InstrumentationScope[["new"]](
          name = instrumenting_module_name,
          version = instrumenting_library_version,
          schema_url = schema_url,
          attributes = attributes
        )
      )
      return(tracer)
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
    span_processors = list(),
    active_span_processor = NULL,
    disabled = FALSE
  )
)
