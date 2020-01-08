# Initializers

resource "random_string" "init" {
  length = 6
  special = false
}

# Locals

locals{
  AppID                          =   "${var.AppID}"
  AppRole                       =   "${var.AppRole}"
  Environment                   =   "${var.Environment}"
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
}

# Modules

module "s3" {
  source = "../../services/s3"

  # Variables
    AppID                         =   "${var.AppID}"
    AppRole                       =   "${var.AppRole}"
    Environment                   =   "${var.Environment}"
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
}
