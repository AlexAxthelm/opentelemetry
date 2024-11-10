test_that("Basic demo runs cleanly", {
  # Initialize a TracerProvider
  provider <- TracerProvider[["new"]]()
  expect_s3_class(provider, "TracerProvider")

  # Define a SpanProcessor and Exporter
  processor <- SimpleSpanProcessor[["new"]](
    ConsoleSpanExporter[["new"]]()
  )
  expect_s3_class(processor, "SimpleSpanProcessor")
  expect_s3_class(processor[["span_exporter"]], "ConsoleSpanExporter")

  #attach the processor to the TracerProvider
  provider[["add_span_processor"]](processor)
  # expect_identical(provider[["processor"]], processor)

  tracer <- provider[["get_tracer"]](
    instrumenting_module_name = "example_tracer",
    instrumenting_library_version = "0.0.0.9000"
  )
  expect_s3_class(tracer, "Tracer")

  outer_fun <- function() {
    span <- tracer$start_as_current_span("outer-fun")
    print(span[["span_context"]])
    do_stuff()
    inner_fun()
    inner_fun()
    span[["finish"]]()
  }

  inner_fun <- function() {
    span <- tracer$start_as_current_span("inner-fun")
    print(span[["span_context"]])
    do_stuff()
    span[["finish"]]()
  }

  outer_fun()
  #TODO: Add assertions to check the output

})
