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
    default = "dentsu"
}

variable "Tenant" {
  description = "Name of tenant only if apply"
  default = "na"
}

variable "CostCenter" {
    description = "Identifier of Cost Center for segment and group resources payments"
    default = "General"
}

variable "Costumer" {
    description = "The name client using these resources"
    default = "mastercard"
}

variable "Confidentiality" {
  description = "Level of Confidentiality for apply to this resources"
  default = "na"
}

variable "Compliance" {
  description = "Level of Compliance"
  default = "na"
}

variable "Peering" {
  description = "Define the type of peer connection for this VPC"
  default = "master"
}

# Dentsu Variables for Tags

variable "Requestor" {
  description = "Name of Requestor resources"
  default = "Andres Gutierrez"
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
}

variable "ProjectSponsor" {
  description = "Sponsore Name of Resource Deployment"
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
}

variable "BillingAddress" {
  description = "Fisical Address"
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
}

variable "ReasonforCloudSelection" {
  description = "Reason for decide usage this Cloud Provider"
  default = "AWS has in its Marketplace other tools and apis that will improve performance and cost on the overall solution."
}

# Source Variables

variable "Service" {
  default = "bucket"
}

variable "sufix" {
  type    = list(string)
  default = [
    "facebook",
    "twitter",
    "dv360"
  ]
}

variable "region" {
  description = "Default Region to Deploymen Resources"
  default = "us-west-2"
}

variable "bucket_acl" {
  default = "private"
}
