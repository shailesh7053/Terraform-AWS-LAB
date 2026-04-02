🚀 Terraform AWS Lab – VPC + EC2 Deployment
📌 Overview

This project demonstrates a complete AWS infrastructure deployment using Terraform, including both network (VPC) and compute (EC2) layers.

It is structured into two modules:

AWS-VPC → Networking setup
AWS-EC2 → Compute resources
🏗️ Project Structure
Terraform-AWS-LAB/
│── AWS-VPC/        # VPC, Subnets, Route Tables, IGW
│── AWS-EC2/        # EC2, Security Groups, AMI, Subnet Data
│── .github/workflows/  # CI/CD (Terraform automation)
│── README.md

## 🌐 Architecture Diagram

```mermaid
flowchart TD

    Internet --> IGW[Internet Gateway]

    subgraph VPC
        PublicSubnet[Public Subnet]
        PrivateSubnet[Private Subnet]
    end

    IGW --> PublicRT[Public Route Table]
    PublicRT --> PublicSubnet

    PrivateSubnet --> PrivateRT[Private Route Table]

    PublicSubnet --> EC2Public[EC2 Instance Public]
    PrivateSubnet --> EC2Private[EC2 Instance Private]

    EC2Public --> SG[Security Group]
    EC2Private --> SG
----

---

## ⚙️ What You Implemented

### 🔹 AWS-VPC Module
- Created **custom VPC**
- Configured **public & private subnets**
- Attached **Internet Gateway**
- Implemented **route tables & associations**

### 🔹 AWS-EC2 Module
- Launched EC2 instances using **Terraform**
- Used **data sources (AMI, VPC, Subnet)**
- Configured **Security Groups**
- Enabled secure access to instances

---

## 🔐 Key Features

- Proper **network isolation (public vs private)**  
- Secure access using **Security Groups**  
- Modular Terraform code (easy to scale)  
- Real-world infrastructure design approach  

---

## 🔄 Flow (Simple Explanation)

1. VPC is created with public & private subnets  
2. Internet Gateway allows public subnet access  
3. EC2 instances are deployed inside subnets  
4. Security Groups control inbound/outbound traffic  

---

# Conclusion: AWS Infrastructure Deployment using Terraform

- Designed and deployed **AWS VPC with public and private subnets** using Terraform  
- Provisioned **EC2 instances with Security Groups** for controlled access  
- Implemented **Internet Gateway and Route Tables** for traffic routing  
- Used Terraform **data sources and modular structure** for scalability  
- Built a **production-like infrastructure setup** combining networking and compute  

