# Azure Arc for SQL
This is a repository that hosts a bunch of easy scripts that i haven't found elsewhere to help look at arc sql things.
+ Primary use case here is to pull all arc sql instances, display extension status/version and current license type

# Tested On:
PowerShell 7.3.7 with PowerShell Az Module 10.4.1, PowerShell Az.ConnectedMachine 0.5.0

# Please note:
This information is being provided as-is with the terms of the MIT license, with no warranty/guarantee or support.  It is free to use - and for demonstration purposes only.  The process of hardening this into your needs is a task I leave to you.

# Additional note:
This shows a mechanism to use the Resource Manager API to accomplish this task.  This will likely be simpler when PowerShell updates to the official Az module and when the CLI updates the same.  Resource Manager APIs are available now.
