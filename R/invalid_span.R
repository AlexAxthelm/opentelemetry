#' @include SpanContext.R Span.R


# Defined in SpanContext.R
# INVALID_SPAN_ID <- 0x0000000000000000
# INVALID_TRACE_ID <- 0x00000000000000000000000000000000

INVALID_SPAN_CONTEXT <- SpanContext[["new"]](
    trace_id = INVALID_TRACE_ID,
    span_id = INVALID_SPAN_ID,
    is_remote = FALSE
)
INVALID_SPAN <- NonRecordingSpan[["new"]](INVALID_SPAN_CONTEXT)
