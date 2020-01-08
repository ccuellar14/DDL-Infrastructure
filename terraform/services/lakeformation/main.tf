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
      "cidr_block", "local.cidr_block"
  )}"
}

# Resources


resource "aws_cloudformation_stack" "network" {
  name = "networking-stack"

  parameters = {
    AdministratorName = "Carlos Cuellar"
    AdministratorEmail =  "carlos.hernandez@dentsuaegis.com"
    CognitoDomain = "${local.Owner}-${local.Tenant}-${local.Service}-${local.Environment}"
  }  

  template_body = <<STACK
{
    "Parameters": {
        "AdministratorName": {
            "Type": "String",
            "Description": "Name of the Data Lake administrator.",
            "AllowedPattern": ".+"
        },
        "AdministratorEmail": {
            "Type": "String",
            "Description": "Email address for Data Lake administrator.",
            "AllowedPattern": "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"
        },
        "CognitoDomain": {
            "Type": "String",
            "Description": "Prefixed domain names can only contain lower-case letters, numbers, and hyphens.",
            "AllowedPattern": "[a-z0-9-]+"
        }
    },
    "Metadata": {
        "AWS::CloudFormation::Interface": {
            "ParameterGroups": [
                {
                    "Label": {
                        "default": "Administator Configuration"
                    },
                    "Parameters": [
                        "AdministratorName",
                        "AdministratorEmail",
                        "CognitoDomain"
                    ]
                }
            ],
            "ParameterLabels": {
                "AdministratorName": {
                    "default": "Administrator name"
                },
                "AdministratorEmail": {
                    "default": "Administrator email address"
                },
                "CognitoDomain": {
                    "default": "Amazon Cognito Domain"
                }
            }
        }
    },
    "Mappings": {
        "SourceCode": {
            "General": {
                "S3Bucket": "solutions",
                "KeyPrefix": "data-lake-solution/v2.2",
                "S3TemplateBucket": "solutions-reference",
                "SolutionName": "data-lake-solution"
            }
        },
        "Solution": {
            "Data": {
                "SendAnonymousUsageData": "Yes"
            }
        }
    },
    "Resources": {
        "DataLakeStorageStack": {
            "Type": "AWS::CloudFormation::Stack",
            "Properties": {
                "TemplateURL": {
                    "Fn::Join": [
                        "/",
                        [
                            "https://s3.amazonaws.com",
                            {
                                "Fn::FindInMap": [
                                    "SourceCode",
                                    "General",
                                    "S3TemplateBucket"
                                ]
                            },
                            {
                                "Fn::FindInMap": [
                                    "SourceCode",
                                    "General",
                                    "KeyPrefix"
                                ]
                            },
                            "data-lake-storage.template"
                        ]
                    ]
                }
            }
        },
        "DataLakeUserPool": {
            "Type": "Custom::LoadLambda",
            "Properties": {
                "ServiceToken": {
                    "Fn::GetAtt": [
                        "DataLakeHelper",
                        "Arn"
                    ]
                },
                "Region": [
                    {
                        "Ref": "AWS::Region"
                    }
                ],
                "customAction": "createUserPool"
            }
        },
        "DataLakeServicesStack": {
            "DependsOn": "DataLakeUserPool",
            "Type": "AWS::CloudFormation::Stack",
            "Properties": {
                "TemplateURL": {
                    "Fn::Join": [
                        "/",
                        [
                            "https://s3.amazonaws.com",
                            {
                                "Fn::FindInMap": [
                                    "SourceCode",
                                    "General",
                                    "S3TemplateBucket"
                                ]
                            },
                            {
                                "Fn::FindInMap": [
                                    "SourceCode",
                                    "General",
                                    "KeyPrefix"
                                ]
                            },
                            "data-lake-services.template"
                        ]
                    ]
                },
                "Parameters": {
                    "UserPoolId": {
                        "Fn::GetAtt": [
                            "DataLakeUserPool",
                            "UserPoolId"
                        ]
                    },
                    "UserPoolClientId": {
                        "Fn::GetAtt": [
                            "DataLakeUserPool",
                            "UserPoolClientId"
                        ]
                    },
                    "SourceS3Bucket": {
                        "Fn::Join": [
                            "-",
                            [
                                {
                                    "Fn::FindInMap": [
                                        "SourceCode",
                                        "General",
                                        "S3Bucket"
                                    ]
                                },
                                {
                                    "Ref": "AWS::Region"
                                }
                            ]
                        ]
                    },
                    "SourceKeyPrefix": {
                        "Fn::FindInMap": [
                            "SourceCode",
                            "General",
                            "KeyPrefix"
                        ]
                    },
                    "FederatedLogin": false
                }
            }
        },
        "DataLakeApiStack": {
            "DependsOn": [
                "DataLakeServicesStack"
            ],
            "Type": "AWS::CloudFormation::Stack",
            "Properties": {
                "TemplateURL": {
                    "Fn::Join": [
                        "/",
                        [
                            "https://s3.amazonaws.com",
                            {
                                "Fn::FindInMap": [
                                    "SourceCode",
                                    "General",
                                    "S3TemplateBucket"
                                ]
                            },
                            {
                                "Fn::FindInMap": [
                                    "SourceCode",
                                    "General",
                                    "KeyPrefix"
                                ]
                            },
                            "data-lake-api.template"
                        ]
                    ]
                },
                "Parameters": {
                    "AuthorizerArn": {
                        "Fn::GetAtt": [
                            "DataLakeServicesStack",
                            "Outputs",
                            "AuthorizerArn"
                        ]
                    },
                    "AdminArn": {
                        "Fn::GetAtt": [
                            "DataLakeServicesStack",
                            "Outputs",
                            "AdminArn"
                        ]
                    },
                    "CartArn": {
                        "Fn::GetAtt": [
                            "DataLakeServicesStack",
                            "Outputs",
                            "CartArn"
                        ]
                    },
                    "ProfileArn": {
                        "Fn::GetAtt": [
                            "DataLakeServicesStack",
                            "Outputs",
                            "ProfileArn"
                        ]
                    },
                    "SearchArn": {
                        "Fn::GetAtt": [
                            "DataLakeServicesStack",
                            "Outputs",
                            "SearchArn"
                        ]
                    },
                    "PackageArn": {
                        "Fn::GetAtt": [
                            "DataLakeServicesStack",
                            "Outputs",
                            "PackageArn"
                        ]
                    }
                }
            }
        },
        "DataLakeAppConfig": {
            "DependsOn": [
                "ConsoleCFDistribution",
                "DataLakeUserPool",
                "DataLakeApiStack",
                "DataLakeStorageStack",
                "DataLakeUuid"
            ],
            "Type": "Custom::LoadLambda",
            "Properties": {
                "ServiceToken": {
                    "Fn::GetAtt": [
                        "DataLakeHelper",
                        "Arn"
                    ]
                },
                "Region": [
                    {
                        "Ref": "AWS::Region"
                    }
                ],
                "defaultS3Bucket": {
                    "Fn::Join": [
                        "",
                        [
                            "data-lake-",
                            {
                                "Ref": "AWS::Region"
                            },
                            "-",
                            {
                                "Ref": "AWS::AccountId"
                            }
                        ]
                    ]
                },
                "appUrl": {
                    "Fn::Join": [
                        "",
                        [
                            "https://",
                            {
                                "Fn::GetAtt": [
                                    "ConsoleCFDistribution",
                                    "DomainName"
                                ]
                            }
                        ]
                    ]
                },
                "idp": {
                    "Fn::GetAtt": [
                        "DataLakeUserPool",
                        "UserPoolId"
                    ]
                },
                "auditLogging": false,
                "cartAccessExpiration": 14400,
                "searchResultsLimit": 100,
                "apiEndpoint": {
                    "Fn::Join": [
                        "",
                        [
                            "https://",
                            {
                                "Fn::GetAtt": [
                                    "DataLakeApiStack",
                                    "Outputs",
                                    "ApiId"
                                ]
                            },
                            ".execute-api.",
                            {
                                "Ref": "AWS::Region"
                            },
                            ".amazonaws.com/prod"
                        ]
                    ]
                },
                "esindex": "data-lake",
                "esurl": {
                    "Fn::Join": [
                        "",
                        [
                            "https://",
                            {
                                "Fn::GetAtt": [
                                    "DataLakeStorageStack",
                                    "Outputs",
                                    "EsCluster"
                                ]
                            }
                        ]
                    ]
                },
                "kmsKeyId": {
                    "Fn::Join": [
                        "",
                        [
                            "alias/datalake-",
                            {
                                "Ref": "AWS::Region"
                            }
                        ]
                    ]
                },
                "anonymousData": {
                    "Fn::FindInMap": [
                        "Solution",
                        "Data",
                        "SendAnonymousUsageData"
                    ]
                },
                "UUID": {
                    "Fn::GetAtt": [
                        "DataLakeUuid",
                        "UUID"
                    ]
                },
                "customAction": "loadAppConfig"
            }
        },
        "DataLakeSearchIndex": {
            "DependsOn": [
                "DataLakeStorageStack"
            ],
            "Type": "Custom::LoadLambda",
            "Properties": {
                "ServiceToken": {
                    "Fn::GetAtt": [
                        "DataLakeHelper",
                        "Arn"
                    ]
                },
                "Region": [
                    {
                        "Ref": "AWS::Region"
                    }
                ],
                "clusterUrl": {
                    "Fn::Join": [
                        "",
                        [
                            "https://",
                            {
                                "Fn::GetAtt": [
                                    "DataLakeStorageStack",
                                    "Outputs",
                                    "EsCluster"
                                ]
                            }
                        ]
                    ]
                },
                "searchIndex": "data-lake",
                "customAction": "configureSearch"
            }
        },
        "DataLakeKibanaCognito": {
            "DependsOn": [
                "DataLakeUserPool",
                "DataLakeStorageStack"
            ],
            "Type": "Custom::LoadLambda",
            "Properties": {
                "ServiceToken": {
                    "Fn::GetAtt": [
                        "DataLakeHelper",
                        "Arn"
                    ]
                },
                "Region": [
                    {
                        "Ref": "AWS::Region"
                    }
                ],
                "cognitoDomain": {
                    "Ref": "CognitoDomain"
                },
                "userPoolId": {
                    "Fn::GetAtt": [
                        "DataLakeUserPool",
                        "UserPoolId"
                    ]
                },
                "identityPoolId": {
                    "Fn::GetAtt": [
                        "DataLakeStorageStack",
                        "Outputs",
                        "CognitoKibanaIdentityPool"
                    ]
                },
                "roleArn": {
                    "Fn::GetAtt": [
                        "DataLakeStorageStack",
                        "Outputs",
                        "ConfigureRoleArn"
                    ]
                },
                "logGroupArn": {
                    "Fn::GetAtt": [
                        "DataLakeStorageStack",
                        "Outputs",
                        "DataLakeESLogGroup"
                    ]
                },
                "logGroupPolicyName": {
                    "Fn::Join": [
                        "",
                        [
                            "data-lake-es-logs-",
                            {
                                "Ref": "AWS::Region"
                            },
                            "-",
                            {
                                "Ref": "AWS::AccountId"
                            }
                        ]
                    ]
                },
                "customAction": "updateElasticsearchDomainConfig"
            }
        },
        "DataLakeS3Resources": {
            "Type": "Custom::LoadLambda",
            "Properties": {
                "ServiceToken": {
                    "Fn::GetAtt": [
                        "DataLakeHelper",
                        "Arn"
                    ]
                },
                "Region": [
                    {
                        "Ref": "AWS::Region"
                    }
                ],
                "dataLakeDefaultBucket": {
                    "Fn::Join": [
                        "",
                        [
                            "data-lake-",
                            {
                                "Ref": "AWS::Region"
                            },
                            "-",
                            {
                                "Ref": "AWS::AccountId"
                            }
                        ]
                    ]
                },
                "dataLakeWebsiteBucket": {
                    "Fn::Join": [
                        "",
                        [
                            "datalakeweb-",
                            {
                                "Ref": "AWS::Region"
                            },
                            "-",
                            {
                                "Ref": "AWS::AccountId"
                            }
                        ]
                    ]
                },
                "customAction": "configureDatalakeBuckets"
            }
        },
        "DataLakeWebsite": {
            "DependsOn": [
                "DataLakeS3Resources"
            ],
            "Type": "Custom::LoadLambda",
            "Properties": {
                "ServiceToken": {
                    "Fn::GetAtt": [
                        "DataLakeHelper",
                        "Arn"
                    ]
                },
                "Region": [
                    {
                        "Ref": "AWS::Region"
                    }
                ],
                "sourceS3Bucket": {
                    "Fn::Join": [
                        "-",
                        [
                            {
                                "Fn::FindInMap": [
                                    "SourceCode",
                                    "General",
                                    "S3Bucket"
                                ]
                            },
                            {
                                "Ref": "AWS::Region"
                            }
                        ]
                    ]
                },
                "sourceS3key": {
                    "Fn::Join": [
                        "/",
                        [
                            {
                                "Fn::FindInMap": [
                                    "SourceCode",
                                    "General",
                                    "KeyPrefix"
                                ]
                            },
                            "site"
                        ]
                    ]
                },
                "sourceSiteManifestS3key": {
                    "Fn::Join": [
                        "/",
                        [
                            {
                                "Fn::FindInMap": [
                                    "SourceCode",
                                    "General",
                                    "KeyPrefix"
                                ]
                            },
                            "data-lake-site-manifest.json"
                        ]
                    ]
                },
                "destS3Bucket": {
                    "Fn::Join": [
                        "",
                        [
                            "datalakeweb-",
                            {
                                "Ref": "AWS::Region"
                            },
                            "-",
                            {
                                "Ref": "AWS::AccountId"
                            }
                        ]
                    ]
                },
                "customAction": "configureWebsite"
            }
        },
        "DataLakeWebsiteBucketPolicy": {
            "DependsOn": [
                "ConsoleCFOriginAccessIdentity"
            ],
            "Type": "Custom::LoadLambda",
            "Properties": {
                "ServiceToken": {
                    "Fn::GetAtt": [
                        "DataLakeHelper",
                        "Arn"
                    ]
                },
                "Region": [
                    {
                        "Ref": "AWS::Region"
                    }
                ],
                "dataLakeWebsiteBucket": {
                    "Fn::Join": [
                        "",
                        [
                            "datalakeweb-",
                            {
                                "Ref": "AWS::Region"
                            },
                            "-",
                            {
                                "Ref": "AWS::AccountId"
                            }
                        ]
                    ]
                },
                "consoleCanonicalUserId": {
                    "Fn::GetAtt": [
                        "ConsoleCFOriginAccessIdentity",
                        "S3CanonicalUserId"
                    ]
                },
                "customAction": "configureDatalakeBucketPolicy"
            }
        },
        "DataLakeUuid": {
            "Type": "Custom::LoadLambda",
            "Properties": {
                "ServiceToken": {
                    "Fn::GetAtt": [
                        "DataLakeHelper",
                        "Arn"
                    ]
                },
                "Region": [
                    {
                        "Ref": "AWS::Region"
                    }
                ],
                "customAction": "createUuid"
            }
        },
        "DataLakeGlueResources": {
            "Type": "Custom::LoadLambda",
            "Properties": {
                "ServiceToken": {
                    "Fn::GetAtt": [
                        "DataLakeHelper",
                        "Arn"
                    ]
                },
                "Region": [
                    {
                        "Ref": "AWS::Region"
                    }
                ],
                "customAction": "cleanDataLakeGlueResources"
            }
        },
        "DataLakeAnonymousMetric": {
            "Type": "Custom::LoadLambda",
            "Properties": {
                "ServiceToken": {
                    "Fn::GetAtt": [
                        "DataLakeHelper",
                        "Arn"
                    ]
                },
                "Region": [
                    {
                        "Ref": "AWS::Region"
                    }
                ],
                "solutionId": "SO0017",
                "UUID": {
                    "Fn::GetAtt": [
                        "DataLakeUuid",
                        "UUID"
                    ]
                },
                "version": "1",
                "anonymousData": {
                    "Fn::FindInMap": [
                        "Solution",
                        "Data",
                        "SendAnonymousUsageData"
                    ]
                },
                "customAction": "sendMetric"
            }
        },
        "DataLakeHelperRole": {
            "Type": "AWS::IAM::Role",
            "Metadata": {
                "cfn_nag": {
                    "rules_to_suppress": [
                        {
                            "id": "W28",
                            "reason": "Explicit role name to avoid cyclic dependency, easy referencing and better readeability of code"
                        },
                        {
                            "id": "W11",
                            "reason": "Resources for Cognito pool have not been created so far. Hence '*'"
                        }
                    ]
                }
            },
            "Properties": {
                "RoleName": {
                    "Fn::Join": [
                        "-",
                        [
                            "data-lake-helper-role",
                            {
                                "Ref": "AWS::Region"
                            }
                        ]
                    ]
                },
                "AssumeRolePolicyDocument": {
                    "Version": "2012-10-17",
                    "Statement": [
                        {
                            "Effect": "Allow",
                            "Principal": {
                                "Service": [
                                    "lambda.amazonaws.com"
                                ]
                            },
                            "Action": [
                                "sts:AssumeRole"
                            ]
                        }
                    ]
                },
                "Path": "/",
                "Policies": [
                    {
                        "PolicyName": "DataLakeHelperPolicy",
                        "PolicyDocument": {
                            "Version": "2012-10-17",
                            "Statement": [
                                {
                                    "Effect": "Allow",
                                    "Action": [
                                        "logs:CreateLogGroup",
                                        "logs:CreateLogStream",
                                        "logs:PutLogEvents"
                                    ],
                                    "Resource": [
                                        {
                                            "Fn::Join": [
                                                "",
                                                [
                                                    "arn:aws:logs:",
                                                    {
                                                        "Ref": "AWS::Region"
                                                    },
                                                    ":",
                                                    {
                                                        "Ref": "AWS::AccountId"
                                                    },
                                                    ":log-group:/aws/lambda/data-lake-helper:*"
                                                ]
                                            ]
                                        }
                                    ]
                                },
                                {
                                    "Effect": "Allow",
                                    "Action": [
                                        "dynamodb:PutItem"
                                    ],
                                    "Resource": [
                                        {
                                            "Fn::Join": [
                                                "",
                                                [
                                                    "arn:aws:dynamodb:",
                                                    {
                                                        "Ref": "AWS::Region"
                                                    },
                                                    ":",
                                                    {
                                                        "Ref": "AWS::AccountId"
                                                    },
                                                    ":table/data-lake-settings"
                                                ]
                                            ]
                                        }
                                    ]
                                },
                                {
                                    "Effect": "Allow",
                                    "Action": [
                                        "dynamodb:Scan"
                                    ],
                                    "Resource": [
                                        {
                                            "Fn::Join": [
                                                "",
                                                [
                                                    "arn:aws:dynamodb:",
                                                    {
                                                        "Ref": "AWS::Region"
                                                    },
                                                    ":",
                                                    {
                                                        "Ref": "AWS::AccountId"
                                                    },
                                                    ":table/data-lake-packages"
                                                ]
                                            ]
                                        }
                                    ]
                                },
                                {
                                    "Effect": "Allow",
                                    "Action": [
                                        "cognito-idp:CreateUserPool"
                                    ],
                                    "Resource": [
                                        "*"
                                    ]
                                },
                                {
                                    "Effect": "Allow",
                                    "Action": [
                                        "cognito-idp:UpdateUserPool",
                                        "cognito-idp:AddCustomAttributes",
                                        "cognito-idp:CreateUserPoolClient",
                                        "cognito-idp:AdminCreateUser",
                                        "cognito-idp:UpdateUserPoolClient",
                                        "cognito-idp:CreateUserPoolDomain",
                                        "cognito-idp:CreateIdentityProvider",
                                        "cognito-idp:DescribeUserPoolClient",
                                        "cognito-idp:ListUserPoolClients",
                                        "cognito-idp:UpdateUserPoolClient"
                                    ],
                                    "Resource": [
                                        {
                                            "Fn::Join": [
                                                "",
                                                [
                                                    "arn:aws:cognito-idp:",
                                                    {
                                                        "Ref": "AWS::Region"
                                                    },
                                                    ":",
                                                    {
                                                        "Ref": "AWS::AccountId"
                                                    },
                                                    ":userpool/*"
                                                ]
                                            ]
                                        }
                                    ]
                                },
                                {
                                    "Effect": "Allow",
                                    "Action": [
                                        "es:ESHttpPut"
                                    ],
                                    "Resource": {
                                        "Fn::Join": [
                                            "",
                                            [
                                                "arn:aws:es:",
                                                {
                                                    "Ref": "AWS::Region"
                                                },
                                                ":",
                                                {
                                                    "Ref": "AWS::AccountId"
                                                },
                                                ":domain/data-lake/*"
                                            ]
                                        ]
                                    }
                                },
                                {
                                    "Effect": "Allow",
                                    "Action": [
                                        "es:UpdateElasticsearchDomainConfig"
                                    ],
                                    "Resource": {
                                        "Fn::Join": [
                                            "",
                                            [
                                                "arn:aws:es:",
                                                {
                                                    "Ref": "AWS::Region"
                                                },
                                                ":",
                                                {
                                                    "Ref": "AWS::AccountId"
                                                },
                                                ":domain/data-lake"
                                            ]
                                        ]
                                    }
                                },
                                {
                                    "Effect": "Allow",
                                    "Action": [
                                        "s3:GetObject"
                                    ],
                                    "Resource": [
                                        "arn:aws:s3:::*"
                                    ]
                                },
                                {
                                    "Effect": "Allow",
                                    "Action": [
                                        "s3:PutObject",
                                        "s3:ListObjects",
                                        "s3:DeleteObject"
                                    ],
                                    "Resource": [
                                        {
                                            "Fn::Join": [
                                                "",
                                                [
                                                    "arn:aws:s3:::datalakeweb-",
                                                    {
                                                        "Ref": "AWS::Region"
                                                    },
                                                    "-",
                                                    {
                                                        "Ref": "AWS::AccountId"
                                                    },
                                                    "/*"
                                                ]
                                            ]
                                        }
                                    ]
                                },
                                {
                                    "Effect": "Allow",
                                    "Action": [
                                        "s3:CreateBucket",
                                        "s3:DeleteBucket",
                                        "s3:PutBucketPolicy",
                                        "s3:ListObjects",
                                        "s3:ListBucket",
                                        "s3:PutBucketWebsite"
                                    ],
                                    "Resource": [
                                        {
                                            "Fn::Join": [
                                                "",
                                                [
                                                    "arn:aws:s3:::datalakeweb-",
                                                    {
                                                        "Ref": "AWS::Region"
                                                    },
                                                    "-",
                                                    {
                                                        "Ref": "AWS::AccountId"
                                                    }
                                                ]
                                            ]
                                        }
                                    ]
                                },
                                {
                                    "Effect": "Allow",
                                    "Action": [
                                        "s3:CreateBucket",
                                        "s3:PutBucketCORS"
                                    ],
                                    "Resource": [
                                        {
                                            "Fn::Join": [
                                                "",
                                                [
                                                    "arn:aws:s3:::data-lake-",
                                                    {
                                                        "Ref": "AWS::Region"
                                                    },
                                                    "-",
                                                    {
                                                        "Ref": "AWS::AccountId"
                                                    }
                                                ]
                                            ]
                                        }
                                    ]
                                },
                                {
                                    "Effect": "Allow",
                                    "Action": [
                                        "glue:DeleteDatabase",
                                        "glue:DeleteCrawler"
                                    ],
                                    "Resource": "*"
                                },
                                {
                                    "Effect": "Allow",
                                    "Action": [
                                        "iam:GetRole",
                                        "iam:PassRole"
                                    ],
                                    "Resource": [
                                        {
                                            "Fn::GetAtt": [
                                                "DataLakeStorageStack",
                                                "Outputs",
                                                "ConfigureRoleArn"
                                            ]
                                        }
                                    ]
                                },
                                {
                                    "Effect": "Allow",
                                    "Action": [
                                        "logs:PutResourcePolicy",
                                        "logs:DeleteResourcePolicy"
                                    ],
                                    "Resource": [
                                        {
                                            "Fn::Join": [
                                                "",
                                                [
                                                    "arn:aws:logs:",
                                                    {
                                                        "Ref": "AWS::Region"
                                                    },
                                                    ":",
                                                    {
                                                        "Ref": "AWS::AccountId"
                                                    },
                                                    ":log-group::log-stream:*"
                                                ]
                                            ]
                                        }
                                    ]
                                }
                            ]
                        }
                    }
                ]
            }
        },
        "DataLakeHelper": {
            "Type": "AWS::Lambda::Function",
            "Properties": {
                "Code": {
                    "S3Bucket": {
                        "Fn::Join": [
                            "-",
                            [
                                {
                                    "Fn::FindInMap": [
                                        "SourceCode",
                                        "General",
                                        "S3Bucket"
                                    ]
                                },
                                {
                                    "Ref": "AWS::Region"
                                }
                            ]
                        ]
                    },
                    "S3Key": {
                        "Fn::Join": [
                            "/",
                            [
                                {
                                    "Fn::FindInMap": [
                                        "SourceCode",
                                        "General",
                                        "KeyPrefix"
                                    ]
                                },
                                "data-lake-helper.zip"
                            ]
                        ]
                    }
                },
                "Description": "A data lake helper function for solution deployment",
                "FunctionName": "data-lake-helper",
                "Handler": "index.handler",
                "MemorySize": "256",
                "Role": {
                    "Fn::GetAtt": [
                        "DataLakeHelperRole",
                        "Arn"
                    ]
                },
                "Runtime": "nodejs12.x",
                "Timeout": "300"
            }
        },
        "DataLakeDeployment": {
            "DependsOn": "DataLakeApiStack",
            "Type": "AWS::ApiGateway::Deployment",
            "Properties": {
                "StageDescription": {
                    "AccessLogSetting": {
                        "DestinationArn": {
                            "Fn::Join": [
                                ":",
                                [
                                    "arn:aws:logs",
                                    {
                                        "Ref": "AWS::Region"
                                    },
                                    {
                                        "Ref": "AWS::AccountId"
                                    },
                                    {
                                        "Fn::Join": [
                                            "/",
                                            [
                                                "log-group:API-Gateway-Execution-Logs-DataLakeApi",
                                                {
                                                    "Fn::GetAtt": [
                                                        "DataLakeApiStack",
                                                        "Outputs",
                                                        "ApiId"
                                                    ]
                                                }
                                            ]
                                        ]
                                    }
                                ]
                            ]
                        },
                        "Format": "$context.identity.sourceIp $context.identity.caller $context.identity.user [$context.requestTime] \"$context.httpMethod $context.resourcePath $context.protocol\" $context.status $context.responseLength $context.requestId"
                    }
                },
                "RestApiId": {
                    "Fn::GetAtt": [
                        "DataLakeApiStack",
                        "Outputs",
                        "ApiId"
                    ]
                },
                "Description": "Production",
                "StageName": "prod"
            }
        },
        "ApiLoggingRole": {
            "Type": "AWS::IAM::Role",
            "Metadata": {
                "cfn_nag": {
                    "rules_to_suppress": [
                        {
                            "id": "W11",
                            "reason": "API Gateway requires these permissions for CloudWatch Logging (https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-logging.html#set-up-access-logging-permissions)"
                        }
                    ]
                }
            },
            "Properties": {
                "AssumeRolePolicyDocument": {
                    "Version": "2012-10-17",
                    "Statement": [
                        {
                            "Effect": "Allow",
                            "Principal": {
                                "Service": [
                                    "apigateway.amazonaws.com"
                                ]
                            },
                            "Action": [
                                "sts:AssumeRole"
                            ]
                        }
                    ]
                },
                "Path": "/",
                "Policies": [
                    {
                        "PolicyName": "api-gateway-logging",
                        "PolicyDocument": {
                            "Version": "2012-10-17",
                            "Statement": [
                                {
                                    "Effect": "Allow",
                                    "Action": [
                                        "logs:CreateLogGroup",
                                        "logs:CreateLogStream",
                                        "logs:DescribeLogGroups",
                                        "logs:DescribeLogStreams",
                                        "logs:PutLogEvents",
                                        "logs:GetLogEvents",
                                        "logs:FilterLogEvents"
                                    ],
                                    "Resource": {
                                      "Fn::Sub": "arn:aws:logs:$${AWS::Region}:$${AWS::AccountId}:*"
                                    }
                                }
                            ]
                        }
                    }
                ]
            }
        },
        "ApiAccountConfig": {
            "Type": "AWS::ApiGateway::Account",
            "Properties": {
                "CloudWatchRoleArn": {
                    "Fn::GetAtt": [
                        "ApiLoggingRole",
                        "Arn"
                    ]
                }
            }
        },
        "ConsoleCFOriginAccessIdentity": {
            "Type": "AWS::CloudFront::CloudFrontOriginAccessIdentity",
            "Properties": {
                "CloudFrontOriginAccessIdentityConfig": {
                    "Comment": {
                        "Fn::GetAtt": [
                            "DataLakeUuid",
                            "UUID"
                        ]
                    }
                }
            }
        },
        "CFDataLakeAccessBucket": {
            "Type": "AWS::S3::Bucket",
            "Metadata": {
                "cfn_nag": {
                    "rules_to_suppress": [
                        {
                            "id": "W51",
                            "reason": "The bucket is not public. When using the CF template in PROD, create a bucket policy to allow only administrators/ auditors access to the bucket"
                        }
                    ]
                }
            },
            "DeletionPolicy": "Retain",
            "Properties": {
                "BucketEncryption": {
                    "ServerSideEncryptionConfiguration": [
                        {
                            "ServerSideEncryptionByDefault": {
                                "SSEAlgorithm": "AES256"
                            }
                        }
                    ]
                },
                "BucketName": {
                    "Fn::Join": [
                        "-",
                        [
                            {
                                "Fn::FindInMap": [
                                    "SourceCode",
                                    "General",
                                    "SolutionName"
                                ]
                            },
                            {
                                "Ref": "AWS::AccountId"
                            },
                            {
                                "Ref": "AWS::Region"
                            },
                            "cf-access-log"
                        ]
                    ]
                },
                "LoggingConfiguration": {
                    "DestinationBucketName": {
                        "Ref": "S3LoggingBucket"
                    },
                    "LogFilePrefix": "s3-access-logs-"
                },
                "PublicAccessBlockConfiguration": {
                    "BlockPublicAcls": true,
                    "BlockPublicPolicy": true,
                    "IgnorePublicAcls": true,
                    "RestrictPublicBuckets": true
                }
            }
        },
        "S3LoggingBucket": {
            "DeletionPolicy": "Retain",
            "Type": "AWS::S3::Bucket",
            "Metadata": {
                "cfn_nag": {
                    "rules_to_suppress": [
                        {
                            "id": "W35",
                            "reason": "This S3 bucket is used as the destination for storing access logs"
                        },
                        {
                            "id": "W51",
                            "reason": "The bucket is not public. When using the CF template in PROD, create a bucket policy to allow only administrators/ auditors access to the bucket"
                        }
                    ]
                }
            },
            "Properties": {
                "BucketName": {
                    "Fn::Join": [
                        "-",
                        [
                            {
                                "Fn::FindInMap": [
                                    "SourceCode",
                                    "General",
                                    "SolutionName"
                                ]
                            },
                            {
                                "Ref": "AWS::AccountId"
                            },
                            {
                                "Ref": "AWS::Region"
                            },
                            "s3-access-log"
                        ]
                    ]
                },
                "AccessControl": "LogDeliveryWrite",
                "BucketEncryption": {
                    "ServerSideEncryptionConfiguration": [
                        {
                            "ServerSideEncryptionByDefault": {
                                "SSEAlgorithm": "AES256"
                            }
                        }
                    ]
                },
                "PublicAccessBlockConfiguration": {
                    "BlockPublicAcls": true,
                    "BlockPublicPolicy": true,
                    "IgnorePublicAcls": true,
                    "RestrictPublicBuckets": true
                }
            }
        },
        "ConsoleCFDistribution": {
            "DependsOn": [
                "DataLakeWebsite",
                "ConsoleCFOriginAccessIdentity"
            ],
            "Type": "AWS::CloudFront::Distribution",
            "Properties": {
                "DistributionConfig": {
                    "Comment": "Distribution for AWS Data Lake console",
                    "DefaultCacheBehavior": {
                        "AllowedMethods": [
                            "HEAD",
                            "DELETE",
                            "POST",
                            "GET",
                            "OPTIONS",
                            "PUT",
                            "PATCH"
                        ],
                        "CachedMethods": [
                            "HEAD",
                            "GET"
                        ],
                        "Compress": true,
                        "DefaultTTL": 0,
                        "MaxTTL": 0,
                        "MinTTL": 0,
                        "ForwardedValues": {
                            "Cookies": {
                                "Forward": "all"
                            },
                            "QueryString": true
                        },
                        "TargetOriginId": "S3-datalakeweb",
                        "ViewerProtocolPolicy": "redirect-to-https"
                    },
                    "DefaultRootObject": "index.html",
                    "HttpVersion": "http2",
                    "IPV6Enabled": true,
                    "Logging": {
                        "Bucket": {
                            "Fn::Join": [
                                ".",
                                [
                                    {
                                        "Ref": "CFDataLakeAccessBucket"
                                    },
                                    "s3.amazonaws.com"
                                ]
                            ]
                        },
                        "IncludeCookies": true,
                        "Prefix": "cf-dl-"
                    },
                    "Origins": [
                        {
                            "DomainName": {
                                "Fn::Join": [
                                    "",
                                    [
                                        "datalakeweb-",
                                        {
                                            "Ref": "AWS::Region"
                                        },
                                        "-",
                                        {
                                            "Ref": "AWS::AccountId"
                                        },
                                        ".s3.",
                                        {
                                            "Ref": "AWS::Region"
                                        },
                                        ".amazonaws.com"
                                    ]
                                ]
                            },
                            "Id": "S3-datalakeweb",
                            "S3OriginConfig": {
                                "OriginAccessIdentity": {
                                    "Fn::Join": [
                                        "",
                                        [
                                            "origin-access-identity/cloudfront/",
                                            {
                                                "Ref": "ConsoleCFOriginAccessIdentity"
                                            }
                                        ]
                                    ]
                                }
                            }
                        }
                    ],
                    "ViewerCertificate": {
                        "CloudFrontDefaultCertificate": true
                    },
                    "Enabled": true
                }
            }
        },
        "AppVariables": {
            "DependsOn": [
                "DataLakeUserPool",
                "DataLakeApiStack",
                "ConsoleCFDistribution"
            ],
            "Type": "Custom::LoadLambda",
            "Properties": {
                "ServiceToken": {
                    "Fn::GetAtt": [
                        "DataLakeHelper",
                        "Arn"
                    ]
                },
                "Region": [
                    {
                        "Ref": "AWS::Region"
                    }
                ],
                "userPoolId": {
                    "Fn::GetAtt": [
                        "DataLakeUserPool",
                        "UserPoolId"
                    ]
                },
                "userPoolClientId": {
                    "Fn::GetAtt": [
                        "DataLakeUserPool",
                        "UserPoolClientId"
                    ]
                },
                "apigEndpoint": {
                    "Fn::Join": [
                        "",
                        [
                            "https://",
                            {
                                "Fn::GetAtt": [
                                    "DataLakeApiStack",
                                    "Outputs",
                                    "ApiId"
                                ]
                            },
                            ".execute-api.",
                            {
                                "Ref": "AWS::Region"
                            },
                            ".amazonaws.com/prod"
                        ]
                    ]
                },
                "appVersion": "v2.2",
                "destS3Bucket": {
                    "Fn::Join": [
                        "",
                        [
                            "datalakeweb-",
                            {
                                "Ref": "AWS::Region"
                            },
                            "-",
                            {
                                "Ref": "AWS::AccountId"
                            }
                        ]
                    ]
                },
                "federatedLogin": false,
                "loginUrl": {
                    "Fn::Join": [
                        "",
                        [
                            "https://",
                            {
                                "Fn::GetAtt": [
                                    "ConsoleCFDistribution",
                                    "DomainName"
                                ]
                            }
                        ]
                    ]
                },
                "logoutUrl": {
                    "Fn::Join": [
                        "",
                        [
                            "https://",
                            {
                                "Fn::GetAtt": [
                                    "ConsoleCFDistribution",
                                    "DomainName"
                                ]
                            }
                        ]
                    ]
                },
                "customAction": "createAppVariables"
            }
        },
        "DataLakeAdminUser": {
            "DependsOn": [
                "ConsoleCFDistribution",
                "AppVariables"
            ],
            "Type": "Custom::LoadLambda",
            "Properties": {
                "ServiceToken": {
                    "Fn::GetAtt": [
                        "DataLakeHelper",
                        "Arn"
                    ]
                },
                "Region": [
                    {
                        "Ref": "AWS::Region"
                    }
                ],
                "userPoolId": {
                    "Fn::GetAtt": [
                        "DataLakeUserPool",
                        "UserPoolId"
                    ]
                },
                "adminName": {
                    "Ref": "AdministratorName"
                },
                "adminEmail": {
                    "Ref": "AdministratorEmail"
                },
                "appUrl": {
                    "Fn::Join": [
                        "",
                        [
                            "https://",
                            {
                                "Fn::GetAtt": [
                                    "ConsoleCFDistribution",
                                    "DomainName"
                                ]
                            }
                        ]
                    ]
                },
                "customAction": "createAdminUser"
            }
        }
    },
    "Outputs": {
        "ConsoleUrl": {
            "Description": "URL for the data lake console",
            "Value": {
                "Fn::Join": [
                    "",
                    [
                        "https://",
                        {
                            "Fn::GetAtt": [
                                "ConsoleCFDistribution",
                                "DomainName"
                            ]
                        }
                    ]
                ]
            }
        },
        "UserPoolId": {
            "Description": "Id of data lake Amazon Cognito User Pool",
            "Value": {
                "Fn::GetAtt": [
                    "DataLakeUserPool",
                    "UserPoolId"
                ]
            }
        },
        "UserPoolClientId": {
            "Description": "Id of data lake UI client app",
            "Value": {
                "Fn::GetAtt": [
                    "DataLakeUserPool",
                    "UserPoolClientId"
                ]
            }
        },
        "UUID": {
            "Description": "UUID for data lake deployment",
            "Value": {
                "Fn::GetAtt": [
                    "DataLakeUuid",
                    "UUID"
                ]
            }
        }
    }
}
STACK
}
