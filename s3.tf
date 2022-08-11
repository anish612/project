resource "aws_s3_bucket" "mybucket" {
  bucket = "heybucket0002"
  acl = "public-read"
  versioning {
    enabled = true
  }
  
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
  
  tags = {
    "name" = "mybucket"
  }
}