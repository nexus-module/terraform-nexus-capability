mock_provider "nexus" {}

run "creates_one_module_per_item" {
  command = plan

  variables {
    nexus_capability = [
      {
        key        = "test-key-a"
        type       = "test-type-a"
        enabled    = true
        notes      = "test-notes-a"
        properties = { key = "test-value-a" }
      },
      {
        key        = "test-key-b"
        type       = "test-type-b"
        enabled    = true
        notes      = "test-notes-b"
        properties = { key = "test-value-b" }
      }
    ]
  }

  assert {
    condition     = length(module.nexus_capability) == 2
    error_message = "nexus_capability must create one nexus-capability per item"
  }

  assert {
    condition     = alltrue([for k in ["test-key-a", "test-key-b"] : contains(keys(module.nexus_capability), k)])
    error_message = "nexus_capability must be keyed by key"
  }

}

run "creates_nothing_by_default" {
  command = plan

  assert {
    condition     = length(module.nexus_capability) == 0
    error_message = "nexus_capability must be empty by default"
  }

}

run "keys_by_type_when_key_is_unset" {
  command = plan

  variables {
    nexus_capability = [
      {
        type    = "OutreachManagementCapability"
        enabled = true
      },
      {
        key  = "firewall-audit-maven-central"
        type = "firewall.audit"
        properties = {
          repository = "maven-central"
          quarantine = "false"
        }
      }
    ]
  }

  assert {
    condition     = toset(keys(module.nexus_capability)) == toset(["OutreachManagementCapability", "firewall-audit-maven-central"])
    error_message = "nexus_capability must be keyed by key, falling back to type"
  }

  assert {
    condition     = output.type["firewall-audit-maven-central"] == "firewall.audit"
    error_message = "type output must expose the capability type per key"
  }
}
