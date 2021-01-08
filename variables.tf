variable "region-master" {
  type    = string
  default = "eu-west-1"
}

variable "bucket_name" {
  type        = string
  description = "globally unique name for the S3 Bucket that will host my static website"
  default     = "my-static-website-974657826ruig23478g"
}