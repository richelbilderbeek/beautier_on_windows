# beautier self-testing script

print("=====================")
print("Self-testing beautier")
print("=====================")

library(beautier)

print("------------")
print("Session info")
print("------------")

print(sessionInfo())

print("--------------------------")
print("beautier's package version")
print("--------------------------")

print(packageVersion("beautier"))

print("---------------")
print("Start self-test")
print("---------------")

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

# Use the default BEAUti settings to create a BEAST2 input
beautier::create_beast2_input_from_model(
  input_filename,
  output_filename,
  inference_model = create_inference_model()
)

print("Self-test passed")
