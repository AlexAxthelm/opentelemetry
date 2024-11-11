Span <- R6::R6Class(
  classname = "Span",
  public = list(
    initialize = function() {
      stop("Not implemented")
    },
    end = function(end_time) {
      stop("Not implemented")
    },
    get_span_context = function() {
      return(private[["context"]])
    },
    set_attributes = function(attributes) {
      stop("Not implemented")
    },
    set_attribute = function(key, value) {
      stop("Not implemented")
    },
    add_event = function(
      name,
      attributes,
      timestamp
    ) {
      stop("Not implemented")
    },
    add_link = function(
      context,
      attributes
    ) {
      stop("Not implemented")
    },
    update_name = function(
      name
    ) {
      stop("Not implemented")
    },
    is_recording = function() {
      stop("Not implemented")
    },
    set_status = function(
      status,
      description
    ) {
      stop("Not implemented")
    },
    record_exception = function(
      exception,
      attributes,
      timestamp,
      excaped
    ) {
      stop("Not implemented")
    }
  ),
  private = list(
    finalizer = function() {
      self[["end"]]
    },
    context = NULL
  )
)

NonRecordingSpan <- R6::R6Class(
  classname = "NonRecordingSpan",
  inherit = Span,
  public = list(
    initialize = function(context) {
      private[["context"]] <- context
    },
    end = function() {},
    get_span_context = function() {
      return(private[["context"]])
    },
    set_attributes = function(attributes) {},
    set_attribute = function(key, value) {},
    add_event = function(name, attributes, timestamp) {},
    add_link = function(context, attributes) {},
    update_name = function(name) {},
    is_recording = function() {
      return(FALSE)
    },
    set_status = function(status, description) {},
    record_exception = function(
      exception,
      attributes,
      timestamp,
      excaped
    ) {}
  ),
  private = list(
    finalizer = function() {
      stop("Not implemented")
    }
  )

)
