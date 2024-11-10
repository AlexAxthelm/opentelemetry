InstrumentationInfo <- R6::R6Class(
  classname = "InstrumentationInfo",
  public = list(
    initialize = function(
      name,
      version,
      schema_url = NULL
    ) {
      private[["private_name"]] <- name
      private[["private_version"]] <- version
      private[["private_schema_url"]] <- schema_url
    }
  ),
  private = list(
    private_name = NULL,
    private_version = NULL,
    private_schema_url = NULL
  ),
  active = list(
    name = function(value) {
      if (missing(value)) {
        return(private[["private_name"]])
      } else {
        stop("InstrumationInfo$name is read-only.")
      }
    },
    version = function(value) {
      if (missing(value)) {
        return(private[["private_version"]])
      } else {
        stop("InstrumationInfo$version is read-only.")
      }
    },
    schema_url = function(value) {
      if (missing(value)) {
        return(private[["private_schema_url"]])
      } else {
        stop("InstrumationInfo$schema_url is read-only.")
      }
    }
  )
)

InstrumentationScope <- R6::R6Class(
  classname = "InstrumentationScope",
  public = list(
    initialize = function(
      name,
      version,
      schema_url = NULL,
      attributes = list()
    ) {
      private[["private_name"]] <- name
      private[["private_version"]] <- version
      private[["private_schema_url"]] <- schema_url
      private[["private_attributes"]] <- attributes
    }
  ),
  private = list(
    private_name = NULL,
    private_version = NULL,
    private_schema_url = NULL,
    private_attributes = list()
  ),
  active = list(
    name = function(value) {
      if (missing(value)) {
        return(private[["private_name"]])
      } else {
        stop("InstrumentationScope$name is read-only.")
      }
    },
    version = function(value) {
      if (missing(value)) {
        return(private[["private_version"]])
      } else {
        stop("InstrumentationScope$version is read-only.")
      }
    },
    schema_url = function(value) {
      if (missing(value)) {
        return(private[["private_schema_url"]])
      } else {
        stop("InstrumentationScope$schema_url is read-only.")
      }
    },
    attributes = function(value) {
      if (missing(value)) {
        return(private[["private_attributes"]])
      } else {
        stop("InstrumentationScope$attributes is read-only.")
      }
    }
  )
)
