# Data

# Other Data
data "aws_iam_policy_document" "main" {
  count = "${length(aws_s3_bucket.main)}"
  statement {
    actions = ["s3:GetObject"]

    resources = ["${aws_s3_bucket.main[count.index].arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}
