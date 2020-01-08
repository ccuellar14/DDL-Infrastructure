# Default Variables

variable "AppID" {
    description = "Identifier of Application"
    default = "N/A"
}

variable "AppRole" {
    description = "ID Role for Running Application"
    default = "N/A"
}

variable "Cluster" {
  description = "Name of Cluster"
  default = "N/A"
}

variable "Environment" {
    description = "Environment to Hosting Apps and Resources"
    default = "production"
}

variable "Version" {
    description = "Version of Application"
    default = "N/A"
}

variable "StartingDate" {
    description = "Day of Deploy"
    default = "Today"
}

variable "Owner" {
    description = "Name or Identifier of Owner Infrastructure"
    default = "DDL"
}

variable "Tenant" {
  description = "Name of tenant only if apply"
  default = "N/A"
}

variable "CostCenter" {
    description = "Identifier of Cost Center for segment and group resources payments"
    default = "General"
}

variable "Costumer" {
    description = "The name client using these resources"
    default = "Various"
}

variable "Confidentiality" {
  description = "Level of Confidentiality for apply to this resources"
  default = "N/A"
}

variable "Compliance" {
  description = "Level of Compliance"
  default = "N/A"
}

variable "Peering" {
  description = "Define the type of peer connection for this VPC"
  default = "master"
}

# Dentsu Variables for Tags

variable "Requestor" {
  description = "Name of Requestor resources"
  default = "Carlos Hernandez"
}

variable "BusinessOwner" {
  description = "Name of Business Owner"
  default = "Andres Gutierrez"
}

variable "BPCCostCode" {
  description = "Cost Code"
  default = "MX001"
}

variable "ProjectName" {
  description = "Complete Name of Project"
  default = "Frida"
}

variable "ProjectSponsor" {
  description = "Sponsore Name of Resource Deployment"
  default = "N/A"
}

variable "FinanceApprover" {
  description = "Name of Approver Financer Costs"
  default = "Roberto Serva"
}

variable "Critically" {
  description = "Define Level of Criticity Resource"
  default = "High"
}

variable "DataClassification" {
  description = "Data Classification"
  default = "intern"
}

variable "PII" {
  description = "PII"
  default = "NO"
}

variable "HoursofOperation" {
  description = "Time Zone of Operation Resource"
  default = "UTC-6"
}

variable "WorkingDays" {
  description = "Define the days of Operation Resource"
  default = "all"
}

variable "Workinghours" {
  description = "Working Hours of Operation"
  default = "24hrs"
}

variable "ExpiringAction" {
  description = "Define if this resource expire"
  default = "NO"
}

variable "ProductionEnvironments" {
  description = "Name of Environment"
  default = "production"
}

variable "CloudProvider" {
  description = "Name of Cloud Provider"
  default = "AWS"
}

variable "DescribetheBusinessProblem" {
  description = "Description and Explain to Solve Problem with this Resource"
  default = "Comunications for all resources on Environment"
}

variable "BillingAddress" {
  description = "Fisical Address"
  default = "Santa Fe 440 Piso 11 Col. Santa Fe CP 05348 Mexico City, Mexico"
}

variable "Pre-ApprovedBudget" {
  description = "Name of Budget Pre-Approved"
  default = "10K USD"
}

variable "SupportLevel"{
  description = "Level Support of Cloud Provider"
  default = "Basic"
} 

variable "DANNetworkAccessRequired" {
  description = "Define if needed bidirectional acces for Dentsu Network"
  default = "true"
}

variable "DANDataSource" {
  description = "Name of Resource Need Acces to this resource"
  default = "Advertmind"
}

variable "AccessNeeded" {
  description = "Describe if needed public access"
  default = "false"
}

variable "AccessPattern" {
  description = "Type access for this resource"
  default = "Async"
}

variable "ReasonforCloudSelection" {
  description = "Reason for decide usage this Cloud Provider"
  default = "AWS has in its Marketplace other tools and apis that will improve performance and cost on the overall solution."
}

# Source Variables

variable "cidr" {
  description = "Value of cidr for used on VPC and other network resources"
  default = "10.0.0.0/16"
}

variable "public_rt_id" {
  description = "The AWS Route Table ID used to access public Internet"
  default     = ""
}


variable "public_subnet_id" {
  description = "The public subnet ID where to locate the NAT gateway"
  default     = ""
}

variable "SubnetName" {
  description = "The Name of Subnet"
  default     = ""
}

variable "region" {
  description = "Default Region to Deploymen Resources"
  default = "us-west-2"
}
