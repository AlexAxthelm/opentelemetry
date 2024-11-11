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
    start_as_current_span = function(
      name,
      kind,
      context = NULL,
      attributes = list(),
      links = list(),
      start_time = NULL,
      record_exception = TRUE,
      set_status_on_exception = TRUE,
      end_on_exit = TRUE
    ) {
      span <- self[["start_span"]](
        name = name,
        kind = kind,
        context = context,
        attributes = attributes,
        links = links,
        start_time = start_time,
        record_exception = record_exception,
        set_status_on_exception = set_status_on_exception
      )
      use_span(
        span,
        end_on_exit = end_on_exit,
        record_exception = record_exception,
        set_status_on_exception = set_status_on_exception
      )
      return(span)
    },
    start_span = function(
      name,
      kind,
      context = NULL,
      attributes = list(),
      links = list(),
      start_time = NULL,
      record_exception = TRUE,
      set_status_on_exception = TRUE
    ) {

      parent_span_context <- get_current_span()[["span_context"]]
      if (is.null(parent_span_context) || !parent_span_context[["is_valid"]]) {
        parent_span_context <- NULL
        #generate a new trace ID
        trace_id = self[["id_generator"]][["generate_trace_id"]]()
      } else {
        trace_id = parent_span_context[["trace_id"]]
      }

      # TODO: Sampling
      # TODO: Trace Flags
      span_context <- SpanContext[["new"]](
        trace_id = trace_id,
        span_id = self[["id_generator"]][["generate_span_id"]](),
        is_remote = FALSE,
      )

      span <- Span[["new"]](
        name = name,
        context = context,
        parent = parent_span_context,
        sampler = self[["sampler"]],
        resource = self[["resource"]],
        attributes = self[["attributes"]],
        span_processor = self[["span_processor"]],
        kind = kind,
        links = links,
        instrumentation_info = self[["instrumentation_info"]],
        record_exception = record_exception,
        set_status_on_exception = set_status_on_exception,
        limits = self[["span_limits"]],
        instrumentation_scope = self[["instrumentation_scope"]]
      )
      span[["start"]](start_time = start_time, parent_context = context)
      return(span)
    }
  )
)
