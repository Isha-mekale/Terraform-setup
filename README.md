# Multilogistics Terraform Infrastructure

## 📌 Overview

This project contains Terraform code to provision AWS infrastructure for the Multilogistics application.

## 🏗️ Architecture

* VPC with public subnet
* Internet Gateway & Route Table
* EC2 Instance
* Security Groups (SSH + HTTP)
* S3 Bucket (with versioning enabled)
* Remote Backend using S3 + DynamoDB (state locking)

## 📁 Project Structure

```
bootstrap/              # S3 + DynamoDB for backend
environments/prod/      # Production environment
modules/
  ├── vpc/
  ├── ec2/
  ├── s3/
  └── security-groups/
```

## ⚙️ Technologies Used

* Terraform
* AWS (Mumbai region - ap-south-1)

## 🚀 Notes

* Backend configured using S3 and DynamoDB for state locking
* Infrastructure is modular and reusable
* Environment-based structure followed (prod)

## 👩‍💻 Author

Isha Mekale
