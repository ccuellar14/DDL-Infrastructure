# Initializers

resource "random_string" "init" {
  length = 6
  special = false
}


# Locals

locals {
  AppID                         =   "${var.AppID}"
  AppRole                       =   "${var.AppRole}"
  Environment                   =   "${var.Environment}"
  Service                       =   "${var.Service}"
  Version                       =   "${var.Version}"
  Cluster                       =   "${var.Cluster}"
  StartingDate                  =   "${var.StartingDate}"
  Owner                         =   "${var.Owner}"
  Tenant                        =   "${var.Tenant}"
  CostCenter                    =   "${var.CostCenter}"
  Costumer                      =   "${var.Costumer}"
  Confidentiality               =   "${var.Confidentiality}"
  ProjectName                   =   "${var.ProjectName}"
  Compliance                    =   "${var.Compliance}"
  Requestor                     =   "${var.Requestor}"
  BusinessOwner                 =   "${var.BusinessOwner}"
  ProjectSponsor                =   "${var.ProjectSponsor}"
  FinanceApprover               =   "${var.FinanceApprover}"
  Critically                    =   "${var.Critically}"
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
  Pre-ApprovedBudget            =   "${var.Pre-ApprovedBudget}"
  SupportLevel                  =   "${var.SupportLevel}"
  DANNetworkAccessRequired      =   "${var.DANNetworkAccessRequired}"
  DANDataSource                 =   "${var.DANDataSource}"
  AccessNeeded                  =   "${var.AccessNeeded}"
  AccessPattern                 =   "${var.AccessPattern}"
  ReasonforCloudSelection       =   "${var.ReasonforCloudSelection}"

  default_tags = "${map(
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
      "Costumer" , "local.Costumer",
      "Confidentiality" , "local.Confidentiality",
      "ProjectName" , "${local.ProjectName}",
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
      "ReasonforCloudSelection" , "${local.ReasonforCloudSelection}",
  )}"
}

# Resources
resource "aws_s3_bucket" "main" {
  count = "${length(var.sufix)}"

  bucket = "${local.Owner}-${local.Tenant}-${local.Service}-${local.Environment}-${var.sufix[count.index]}"
  acl    = "${var.bucket_acl}"
  region = "${var.region}"

  lifecycle_rule {
    id      = "permanent_retention"
    enabled = true
    
    transition {
      days            = 5
      storage_class   = "GLACIER"
    }
  }

  tags = "${merge(local.default_tags, map("Name", "${local.Owner}-${local.Tenant}-${local.Service}-${local.Environment}-${var.sufix[count.index]}"))}"
}

resource "aws_s3_bucket_policy" "main" {
  count = "${length(data.aws_iam_policy_document.main)}"

  bucket = "${aws_s3_bucket.main[count.index].id}"
  policy = "${data.aws_iam_policy_document.main[count.index].json}"
}
