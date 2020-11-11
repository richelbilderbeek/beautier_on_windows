# beautier self-testing script

message("=====================")
message("Self-testing beautier")
message("=====================")

library(beautier)

message("------------")
message("Session info")
message("------------")

message(sessionInfo())

message("--------------------------")
message("beautier's package version")
message("--------------------------")

message(packageVersion("beautier"))

message("--------------------------")
message("Show functions in package ")
message("--------------------------")

message(lsf.str("package:beautier"))

message("---------------")
message("Start self-test")
message("---------------")

# Get an example FASTA file
input_filename <- get_fasta_filename()

# The file created by beautier, a BEAST2 input file
output_filename <- tempfile()

# Use the default BEAUti settings to create a BEAST2 input file

beautier::create_beast2_input_file_from_model(
  input_filename,
  output_filename,
  inference_model = create_inference_model()
)

library(testthat)
expect_true(file.exists(output_filename))

message("============================")
message("Self-test of beautier passed")
message("============================")
