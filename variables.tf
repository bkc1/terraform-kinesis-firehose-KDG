variable "aws_region" {
  description = "AWS region to launch servers"
  default     = "us-west-2"
}

variable "prefix" {
  description = "Unique identifier"
  default     = "KDG"
}


variable "bucket_name" {
  description = "Name of bucket used by Kinesis Firehose"
  default     = "my_firehose"
}

variable "kdg_password" {
  description = "Password for Kinesis Data Generator"
  default     = "kdg_123"
}

variable "kdg_username" {
  description = "Username for Kinesis Data Generator"
  default     = "kdguser"
}
