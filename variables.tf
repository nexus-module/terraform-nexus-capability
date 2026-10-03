################################################################################
# Capability
################################################################################
variable "nexus_capability" {
  description = "List of capabilities to manage. Set key when the same type is used more than once."
  type = list(object({
    key        = optional(string)
    type       = string
    enabled    = optional(bool)
    notes      = optional(string)
    properties = optional(map(string))
  }))
  default = []
}
