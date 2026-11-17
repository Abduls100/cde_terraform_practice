resource "aws_s3_bucket" "data_ingestion_staging" {
  bucket = "cde-data-ingestion-staging"

  tags = {
    Name        = "Data Engineering Team"
    Environment = "Staging"
    Service     = "Airflow"
  }
}
