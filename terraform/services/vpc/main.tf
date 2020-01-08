# Initializers

resource "random_string" "init" {
  length = 6
  special = false
}


# Locals

locals {
  Name                          =   "${var.Owner}-${var.Tenant}-${var.Service}-${var.Environment}-${random_string.init.result}"
  AppID                          =   "${var.AppID}"
  AppRole                       =   "${var.AppRole}"
  Environment                   =   "${var.Environment}"
  Service                       =   "${var.Service}"
  Version                       =   "${var.Version}"
  Cluster                       =   "${var.Cluster}"
  StartingDate                  =   "${var.StartingDate}"
  Owner                         =   "${var.Owner}"
  Tenant                        =   "${var.Tenant}"
  CostCenter                    =   "${var.CostCenter}"
  ProjectName                   =   "${var.ProjectName}"
  Confidentiality                =   "${var.Confidentiality}"
  Compliance                    =   "${var.Compliance}"
  Requestor                     =   "${var.Requestor}"
  BusinessOwner                  =   "${var.BusinessOwner}"
  ProjectSponsor                =   "${var.ProjectSponsor}"
  FinanceApprover               =   "${var.FinanceApprover}"
  Critically                   =   "${var.Critically}"
  DataClassification            =   "${var.DataClassification}"
  PII                           =   "${var.PII}"
  HoursofOperation              =   "${var.HoursofOperation}"
  WorkingDays                   =   "${var.WorkingDays}"
  Workinghours                  =   "${var.Workinghours}"
  ExpiringAction                =   "${var.ExpiringAction}"
  ProductionEnvironments        =   "${var.ProductionEnvironments}"
  CloudProvider                 =   "${var.CloudProvider}"
  DescribetheBusinessProblem    =   "${var.DescribetheBusinessProblem}"
  BillingAddress                =   "${var.BillingAddress}"
  Pre-ApprovedBudget          =   "${var.Pre-ApprovedBudget}"
  SupportLevel                   =   "${var.SupportLevel}"
  DANNetworkAccessRequired    =   "${var.DANNetworkAccessRequired}"
  DANDataSource                =   "${var.DANDataSource}"
  AccessNeeded                  =   "${var.AccessNeeded}"
  AccessPattern                 =   "${var.AccessPattern}"
  ReasonforCloudSelection       =   "${var.ReasonforCloudSelection}"
  cidr                          =   "${var.cidr}"

  default_tags = "${map(
      "Name" , "${local.Owner}-${local.Tenant}-${local.Service}-${local.Environment}-${random_string.init.result}",
      "AppID" , "${local.AppID}",
      "AppRole" , "${local.AppRole}",
      "Environment" , "${local.Environment}",
      "Service" , "${local.Service}",
      "Version" , "${local.Version}",
      "Cluster" , "${local.Cluster}",
      "StartingDate" , "${local.StartingDate}",
      "Owner" , "${local.Owner}",
      "Tenant" , "${local.Tenant}",
      "CostCenter" , "${local.CostCenter}",
      "ProjectName" , "${local.ProjectName}",
      "Confidentiality" , "${local.Confidentiality}",
      "Compliance" , "${local.Compliance}",
      "Requestor" , "${local.Requestor}",
      "BusinessOwner" , "${local.BusinessOwner}",
      "ProjectSponsor" , "${local.ProjectSponsor}",
      "FinanceApprover" , "${local.FinanceApprover}",
      "Critically" , "${local.Critically}",
      "DataClassification" , "${local.DataClassification}",
      "PII" , "${local.PII}",
      "HoursofOperation" , "${local.HoursofOperation}",
      "WorkingDays" , "${local.WorkingDays}",
      "Workinghours" , "${local.Workinghours}",
      "ExpiringAction" , "${local.ExpiringAction}",
      "ProductionEnvironments" , "${local.ProductionEnvironments}",
      "CloudProvider" , "${local.CloudProvider}",
      "DescribetheBusinessProblem" , "${local.DescribetheBusinessProblem}",
      "BillingAddress" , "${local.BillingAddress}",
      "Pre-ApprovedBudget" , "${local.Pre-ApprovedBudget}",
      "SupportLevel" , "${local.SupportLevel}",
      "DANNetworkAccessRequired" , "${local.DANNetworkAccessRequired}",
      "DANDataSource" , "${local.DANDataSource}",
      "AccessNeeded" , "${local.AccessNeeded}",
      "AccessPattern" , "${local.AccessPattern}",
      "ReasonforCloudSelection" , "${local.ReasonforCloudSelection}"
  )}"
}

# Resources

resource "aws_vpc" "main" {
  cidr_block = "${local.cidr}"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags = "${local.default_tags}"
}
