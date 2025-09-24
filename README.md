## **terraform-aws-webserver: Professional Portfolio Deployment** 🚀

This project demonstrates a complete, end-to-end DevOps workflow. It uses **Terraform** to provision a professional portfolio website on AWS and showcases advanced skills in configuration, debugging, and secure remote management.

### **Project Highlights** ✨

This project goes beyond a basic deployment, demonstrating the following key skills:

| Skill Area | Details Demonstrated |
| :--- | :--- |
| **Infrastructure as Code (IaC)** | Deployed a custom **VPC**, **Subnet**, **Internet Gateway**, **Route Table**, **Security Group**, and **EC2 instance** using Terraform. |
| **Debugging & Problem-Solving** | Successfully resolved a common **"No default VPC"** error and a region-specific **Invalid AMI ID** error by updating the configuration to be self-sufficient and region-aware. |
| **Secure Configuration** | Used `user_data` to automatically install the **Nginx** web server and set up a basic welcome page on instance launch. |
| **Full Lifecycle Management** | Used **SSH** to connect to the live server, manually updated the website content to a **professional portfolio page**, and then used **SCP** to transfer the final `index.html` file back to the local repository. |
| **Version Control Workflow** | Synchronized the entire project, including the updated HTML, to GitHub, demonstrating a clean and complete change management process. |

***

### **Prerequisites**

* AWS Account and configured AWS CLI credentials.
* Terraform and Git installed locally.

***

### **Deployment Instructions** 🛠️

1.  **Clone the repository**:
    ```bash
    git clone [https://github.com/wilson7777777/terraform-aws-webserver.git](https://github.com/wilson7777777/terraform-aws-webserver.git)
    cd terraform-aws-webserver
    ```
2.  **Initialize & Apply**: Run the core Terraform commands.
    ```bash
    terraform init
    terraform apply --auto-approve
    ```
3.  **Verify**: The public IP will be provided in the output. Access it in a browser to see the final website.

***

### **Updating and Syncing Content (Advanced Workflow)** 🌐

This section details how the final professional content was added to the server and synchronized back into the source code.

1.  **Access Server and Update Content**:
    ```bash
    ssh -i ~/.ssh/web-server-key ubuntu@YOUR_PUBLIC_IP
    sudo nano /var/www/html/index.html
    # ... edited the HTML file content ...
    exit
    ```
2.  **Securely Transfer Final File**: Used SCP to copy the professional `index.html` back to the local project folder.
    ```bash
    scp -i ~/.ssh/web-server-key ubuntu@YOUR_PUBLIC_IP:/var/www/html/index.html .
    ```
3.  **Update GitHub Repository**:
    ```bash
    git add index.html
    git commit -m "Final content sync: Added professional portfolio HTML"
    git push origin master
    ```

***

### **Cleanup** 🧹

To avoid ongoing charges, destroy the infrastructure when you are finished.

```bash
terraform destroy --auto-approve
