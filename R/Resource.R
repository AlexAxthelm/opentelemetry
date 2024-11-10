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
      attributes = NULL,
      schema_url = NULL
      ) {
      stop("Not Implemented.")
    },
    #' @description
    #' TODO: Document
    create = function() {
      stop("Not Implemented.")
    },
    #' @description
    #' TODO: Document
    get_empty = function() {
      stop("Not Implemented.")
    },
    #' @field attributes Attributes of the Resource
    attributes = list(),
    #' @field schema_url (optional) URL for schema describing Resource
    #' attributes
    schema_url = NULL,
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
  )
)
