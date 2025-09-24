# terraform-aws-webserver

This project demonstrates Infrastructure as Code (IaC) by provisioning a simple web server on AWS using Terraform.

## Project Overview

This Terraform configuration creates the following resources on AWS:

* A **Security Group** to allow inbound SSH (port 22) and HTTP (port 80) traffic.
* An **EC2 instance** to act as the web server.
* A **Key Pair** for secure SSH access to the instance.

The project uses `user_data` to automatically install and start the Nginx web server on the EC2 instance upon creation.

## Prerequisites

* **AWS Account**: You must have a valid AWS account.
* **AWS CLI**: Installed and configured on your machine with access to your AWS account.
* **Terraform**: Installed on your machine.
* **SSH Key Pair**: A local SSH key pair to securely connect to the EC2 instance.

## Deployment

1.  **Clone the repository**:
    ```bash
    git clone [https://github.com/your-username/terraform-aws-webserver.git](https://github.com/your-username/terraform-aws-webserver.git)
    cd terraform-aws-webserver
    ```
2.  **Initialize Terraform**:
    ```bash
    terraform init
    ```
3.  **Review the plan**:
    ```bash
    terraform plan
    ```
4.  **Apply the configuration**:
    ```bash
    terraform apply
    ```
    This will provision all the resources. The public IP of the web server will be displayed in the output.

## Cleanup

To avoid incurring charges, destroy the resources after you are finished.

```bash
terraform destroy

***

### Step 5: Deploy and Verify

Now that your files are ready, run the Terraform commands in Git Bash.

1.  **Initialize Terraform**:
    ```bash
    terraform init
    ```
2.  **Apply the configuration**:
    ```bash
    terraform apply --auto-approve
    ```
    After the command finishes, copy the public IP address from the output and paste it into your web browser to verify that the web server is running.

***

### Step 6: Clean Up Your Resources

When you are done, run this command to destroy all the AWS resources and avoid costs.

```bash
terraform destroy --auto-approve
