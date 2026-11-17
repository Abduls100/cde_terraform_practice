resource "aws_s3_bucket" "data_ingestion_prod" {
  bucket = "cde-data-ingestion-prod"

  tags = {
    Name        = "Data Engineering Team"
    Environment = "Production"
    Service     = "Airflow"
  }
}
