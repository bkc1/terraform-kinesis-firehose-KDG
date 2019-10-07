resource "random_id" "mybucket1" {
  byte_length = 4
}

resource "aws_s3_bucket" "KDG" {
  bucket = "${var.bucket_name}-${var.prefix}-${random_id.mybucket1.hex}"
  acl    = "private"
}

resource "aws_kinesis_firehose_delivery_stream" "kdg-stream" {
  name        = "terraform-kinesis-firehose-kdg-stream"
  destination = "s3"

  s3_configuration {
    role_arn        = aws_iam_role.firehose_role.arn
    bucket_arn      = aws_s3_bucket.KDG.arn
    prefix          = "${var.prefix}-stream1/"
    buffer_interval = "60"
    cloudwatch_logging_options {
      enabled = true
      log_group_name  = "${aws_cloudwatch_log_group.kdg.name}"
      log_stream_name = "${aws_cloudwatch_log_stream.kdg1.name}"
    }
  }
}

