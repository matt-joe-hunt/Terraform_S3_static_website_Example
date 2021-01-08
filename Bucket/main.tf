resource "aws_s3_bucket" "website_bucket" {
  bucket   = var.bucket_name
  acl      = "public-read"
  policy   = data.aws_iam_policy_document.bucket_policy.json

  website {
    index_document = "index.html"
  }
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid = "AllowReadFromAll"
    actions = [
      "s3:GetObject",
    ]
    resources = [
      "arn:aws:s3:::${var.bucket_name}/*",
    ]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket       = aws_s3_bucket.website_bucket.bucket
  key          = "index.html"
  source       = "./index.html"
  content_type = "text/html"
}