
# WARNING: Generated module tests should be considered experimental and be reviewed by the module author.

run "output_validation" {
  assert {
    condition     = output.instance_id != null
    error_message = "Instance ID should not be null"
  }
}