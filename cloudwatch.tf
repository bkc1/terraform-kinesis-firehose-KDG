resource "aws_cloudwatch_log_group" "kdg" {
  name = "kdg"
}

resource "aws_cloudwatch_log_stream" "kdg1" {
  name           = "stream1"
  log_group_name = "${aws_cloudwatch_log_group.kdg.name}"
}
