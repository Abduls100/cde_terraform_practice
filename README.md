# CDE Terraform Practice

A practice repository for learning Infrastructure as Code (IaC) with Terraform on AWS, using separate staging and production configurations.

## Architecture

The worklow demostrate resource created at the staging and production layer. 

![Architecture diagram](images/AWS_proctice_workflow.png)


| Environment | Ingestion bucket | State key |
| --- | --- | --- |
| Staging | `cde-data-ingestion-staging` | `staging/data_team.tfstate` |
| Production | `cde-data-ingestion-prod` | `production/data_team.tfstate` |

## What it covers

- S3 buckets for data ingestion, tagged for the data engineering team and Airflow.
- PostgreSQL RDS instances for an Airbyte database.
- Generated database passwords stored in AWS Systems Manager Parameter Store.
- Remote Terraform state in S3, with separate environment keys and S3 lockfiles.
- AWS resources configured in the `eu-north-1` region.

Airflow and Airbyte applications are not deployed by these configurations.

## Repository structure

Both `staging/` and `production/` contain:

| File | Purpose |
| --- | --- |
| `backend.tf` | S3 remote state and locking |
| `providers.tf` | AWS provider configuration (`~> 6.0`) |
| `data_lake.tf` | S3 ingestion bucket |
| `rds.tf` | PostgreSQL instance, password generation, and SSM parameter |

## Getting started

Install Terraform and the AWS CLI, then configure AWS credentials with permissions to manage the resources and access the backend.

The backend bucket, `cde-data-engineering-practice`, must already exist. When adapting this practice for your own account, update the backend and ingestion bucket names. Ensure access to the state objects and their `.tflock` files.



## Practice notes

- Both environments currently use the RDS identifier `cde-new-db`; give them distinct identifiers before deploying both in the same AWS account and region.
- Password parameters currently use SSM `String`; use `SecureString` for sensitive values and protect Terraform state.
- RDS uses `skip_final_snapshot = true`, so destroying an instance skips its final snapshot. AWS charges may apply to provisioned resources.
- The project limitation is to add CI/CD workflows or Atlantis as part of the deployment. There is a plan to add CI/CD wokflow on the system in future practice exercise

