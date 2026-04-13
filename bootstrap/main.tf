# DynamoDB table for state locking
resource "aws_dynamodb_table" "lock" {
  name         = "multilogistics-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "multilogistics-lock"
  }
}

# S3 bucket for Terraform state
resource "aws_s3_bucket" "tf_state" {
  bucket = "multilogistics-tf-state-2026"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.tf_state.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}