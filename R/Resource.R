#' R6 Class Representing a Resource
#'
#' @description
#' A Resource is an immutable representation of the entity producing telemetry
#' as Attributes.
Resource <- R6::R6Class(
  classname = "Resource",
  public = list(
    #' @description
    #' Create a new resource object.
    #' @param attributes Resource Attributes.
    #' @param schema_url URL for schema describing Resource attributes.
    #' @return A new `Resource` object.
    initialize = function(
      attributes = list(),
      schema_url = NULL
      ) {
      private[["private_attributes"]] <- attributes
      private[["private_schema_url"]] <- schema_url
    },
    #' @description
    #' Create a new resource object (alias for `Resource$new()`.
    #' @param attributes Resource Attributes.
    #' @param schema_url URL for schema describing Resource attributes.
    #' @return A new `Resource` object.
    create = function(
      attributes = list(),
      schema_url = NULL
    ) {
      self[["new"]](
        attributes = attributes,
        schema_url = schema_url
      )
    },
    #' @description
    #' TODO: Document
    get_empty = function() {
      stop("Not Implemented.")
    },
    #' @description
    #' TODO: Document
    merge = function() {
      stop("Not Implemented.")
    },
    #' @description
    #' TODO: Document
    to_json = function() {
      stop("Not Implemented.")
    }
  ),
  private = list(
    private_attributes = list(),
    private_schema_url = NULL
  ),
  active = list(
    attributes = function(value) {
      if (missing(value)) {
        return(private[["private_attributes"]])
      } else {
        stop("Resource$attributes is read-only.")
      }
    },
    schema_url = function(value) {
      if (missing(value)) {
        return(private[["private_schema_url"]])
      } else {
        stop("Resource$schema_url is read-only.")
      }
    }
  )
)
