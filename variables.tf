variable "domain_name" {
  type        = string
  description = "The domain name to use for the Route53 zone"
}

variable "zone_name" {
  type        = string
  description = "The name of the Route53 zone (if different from domain_name"
  default     = ""
}

variable "bucket_name" {
  type        = string
  description = "Bucket name"
}

variable "logging_bucket_name" {
  type        = string
  description = "Bucket name for logging"
}
