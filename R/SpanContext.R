INVALID_SPAN_ID <- 0x0000000000000000
INVALID_TRACE_ID <- 0x00000000000000000000000000000000
TRACE_ID_MAX_VALUE <- 2**128 - 1
SPAN_ID_MAX_VALUE <- 2**64 - 1

SpanContext <- R6::R6Class(
  classname = "SpanContext",
  public = list(
    initialize = function(
      trace_id,
      span_id,
      is_remote
    ) {
      private[["xTrace_id"]] <- trace_id
      private[["xSpan_id"]] <- span_id
      private[["xIs_remote"]] <- is_remote
    }
  ),
  private = list(
    xTrace_id = NULL,
    xSpan_id = NULL,
    xIs_remote = NULL
  ),
  active = list(
    is_valid = function(value) {
      if (missing(value)) {
        valid_trace_id <- INVALID_TRACE_ID < trace_id &&
          trace_id < TRACE_ID_MAX_VALUE
        valid_span_id <- INVALID_SPAN_ID < span_id &&
          span_id < SPAN_ID_MAX_VALUE
        return(valid_trace_id && valid_span_id)
      } else {
        stop("SpanContext$is_valid is read-only.")
      }
    },
    trace_id = function(value) {
      if (missing(value)) {
        return(private[["xTrace_id"]])
      } else {
        stop("SpanContext$trace_id is read-only.")
      }
    },
    span_id = function(value) {
      if (missing(value)) {
        return(private[["xSpan_id"]])
      } else {
        stop("SpanContext$span_id is read-only.")
      }
    },
    is_remote = function(value) {
      if (missing(value)) {
        return(private[["xIs_remote"]])
      } else {
        stop("SpanContext$is_remote is read-only.")
      }
    }
  )
)
