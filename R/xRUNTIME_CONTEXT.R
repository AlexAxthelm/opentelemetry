RuntimeContext <- R6::R6Class(
  classname = "RuntimeContext",
  public = list(
    initialize = function() {
      private[["current_context"]] <- Context$new()
    },
    attach = function(context) {
      stopifnot(inherits(context, "Context"))
      prior_context <- private[["current_context"]]
      private[["current_context"]] <- context
      return(prior_context)
    },
    get_current = function() {
      return(private[["current_context"]])
    },
    detach = function(prior_context) {
      stopifnot(inherits(prior_context, "Context"))
      private[["current_context"]] <- prior_context
    }
  ),
  private = list(
    current_context = NULL
  )
)

load_runtime_context <- function() {
  return(RuntimeContext$new())
}

.RUNTIME_CONTEXT <- load_runtime_context()

