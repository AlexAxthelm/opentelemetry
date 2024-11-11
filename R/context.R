Context <- R6::R6Class(
  classname = "Context",
  public = list(
    initialize = function(values = list()) {
      private[["xValues"]] <- values
    },
    get = function(key) {
      return(private$xValues[[key]])
    }
  ),
  private = list(
    xValues = list()
  ),
  active = list(
    values = function(value) {
      if (missing(value)) {
        return(private$xValues)
      } else {
        stop("Context$values is read-only.")
      }
    }
  )
)

#' Create Key
#'
#' To allow cross-cutting concern to control access to their local state, the
#' RuntimeContext API provides a function which takes a keyname as input, and
#' returns a unique key.
#'
#' @param keyname The key name is for debugging purposes and is not required to
#' be unique.
#' @return A unique string representing the newly created key.
create_key <- function(keyname) {
  paste0(keyname, "-", uuid::UUIDgenerate())
}

#' Get Value
#'
#' To access the local state of a concern, the RuntimeContext API provides a
#' function which takes a context and a key as input. and returns a value.
#'
#' @param keyname The key name is for debugging purposes and is not required to
#' be unique.
#' @return A unique string representing the newly created key.
get_value <- function(
  key,
  context = NULL
) {
  if (is.null(context)) {
    return(get_current()[["get"]](key))
  } else {
    return(context[["get"]](key))
  }
  return(NULL)
}

#' Set Value
#'
#' To record the local state of a cross-cutting concern, the RuntimeContext API
#' provides a function which takes a context, a key, and a value as input, and
#' returns an updated context which contains the new value.'
#' @param key The key name is for debugging purposes and is not required to be
#' unique.
#' @param value The value to set.
#' @param context The context in which to set the value. If not provided, the
#' current context is used.
#' @return A unique string representing the newly created key.
set_value <- function(
  key,
  value,
  context = NULL
  ) {
  if (is.null(context)) {
    context <- get_current()
  }
  new_values <- context[["values"]]
  new_values[[key]] <- value
  return(
    Context[["new"]](
      values = new_values
    )
  )
}

#' Get Current Context
#'
#' To access the context associated with program execution, the Context API
#' provides a function which takes no arguments and returns a Context.#'
#'
#' @return The current `Context` object.
get_current <- function() {
  return(.RUNTIME_CONTEXT[["get_current"]]())
}
