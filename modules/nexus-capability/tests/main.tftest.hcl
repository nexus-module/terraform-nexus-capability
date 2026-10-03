mock_provider "nexus" {}

run "maps_all_inputs_to_resource" {
  command = plan

  variables {
    enabled    = true
    notes      = "test-notes"
    properties = { key = "test-value" }
    type       = "test-type"
  }

  assert {
    condition     = nexus_capability.main.type == var.type
    error_message = "type does not match var.type"
  }

  assert {
    condition     = nexus_capability.main.enabled == var.enabled
    error_message = "enabled does not match var.enabled"
  }

  assert {
    condition     = nexus_capability.main.notes == var.notes
    error_message = "notes does not match var.notes"
  }

  assert {
    condition     = nexus_capability.main.properties == var.properties
    error_message = "properties does not match var.properties"
  }

}

run "omits_optional_blocks" {
  command = plan

  variables {
    type = "test-type"
  }

  assert {
    condition     = nexus_capability.main.type == var.type
    error_message = "type does not match var.type"
  }

}
