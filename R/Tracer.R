Tracer <- R6::R6Class(
  classname = "Tracer",
  public = list(
    initialize = function(
      sampler,
      resource,
      span_processor,
      id_generator,
      span_limits,
      instrumentation_info,
      instrumentation_scope
    ) {
      self[["sampler"]] <- sampler
      self[["resource"]] <- resource
      self[["span_processor"]] <- span_processor
      self[["id_generator"]] <- id_generator
      self[["span_limits"]] <- span_limits
      self[["instrumentation_info"]] <- instrumentation_info
      self[["instrumentation_scope"]] <- instrumentation_scope
    },
    sampler = NULL,
    resource = NULL,
    span_processor = NULL,
    id_generator = NULL,
    span_limits = NULL,
    instrumentation_info = NULL,
    instrumentation_scope = NULL,
    start_as_current_span = function() {
      stop("Not Implemented.")
    },
    start_span = function() {
      stop("Not Implemented.")
    }
  )
)
