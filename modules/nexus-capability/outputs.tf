################################################################################
# Capability
################################################################################
output "id" {
  description = "The ID of the capability."
  value       = nexus_capability.main.id
}

output "type" {
  description = "The type of the capability."
  value       = nexus_capability.main.type
}
