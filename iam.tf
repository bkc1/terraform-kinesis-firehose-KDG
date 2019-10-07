resource "aws_iam_role" "firehose_role" {
  name = "firehose_${var.prefix}_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_policy" "firehose-s3-policy" {
  name        = "${var.prefix}-firehose-S3"
  description = "Policy that allows KDG firehose to write to defined S3 bucket"
  policy      = <<EOF
{
    "Version": "2012-10-17",  
    "Statement":
    [    
        {      
            "Effect": "Allow",      
            "Action": [        
                "s3:AbortMultipartUpload",        
                "s3:GetBucketLocation",        
                "s3:GetObject",        
                "s3:ListBucket",        
                "s3:ListBucketMultipartUploads",        
                "s3:PutObject"
            ],      
            "Resource": [        
                "arn:aws:s3:::${aws_s3_bucket.KDG.id}",
                "arn:aws:s3:::${aws_s3_bucket.KDG.id}/*"            
            ]    
        },        
        {
           "Effect": "Allow",
           "Action": [
               "logs:PutLogEvents"
           ],
           "Resource": [
               "arn:aws:logs:region:account-id:log-group:log-group-name:log-stream:log-stream-name"
           ]
        },
        {
           "Effect": "Allow", 
           "Action": [
               "lambda:InvokeFunction", 
               "lambda:GetFunctionConfiguration" 
           ],
           "Resource": [
               "arn:aws:lambda:region:account-id:function:function-name:function-version"
           ]
        }
    ]
}
EOF

}

resource "aws_iam_role_policy_attachment" "attach-fh-s3-policy" {
  role       = aws_iam_role.firehose_role.name
  policy_arn = aws_iam_policy.firehose-s3-policy.arn
}

