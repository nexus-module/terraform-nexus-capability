################################################################################
# Capability
################################################################################
variable "type" {
  description = "The type of capability, e.g. OutreachManagementCapability or firewall.audit."
  type        = string
}

variable "enabled" {
  description = "Whether the capability is enabled."
  type        = bool
  default     = null
}

variable "notes" {
  description = "Free-form notes about the capability."
  type        = string
  default     = null
}

variable "properties" {
  description = "Type-specific configuration properties."
  type        = map(string)
  default     = null
}
