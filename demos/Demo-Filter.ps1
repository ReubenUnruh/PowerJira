#import PowerJira
Import-Module (Join-Path -Path $PSScriptRoot -ChildPath \..\PowerJira\PowerJira.psm1) -Force

#import the variable $JiraCredentials
Import-Module (Join-Path -Path $PSScriptRoot -ChildPath \credentials\Credentials.psm1) -Force

#open a new Jira session
Open-JiraSession -UserName $JiraCredentials.UserName -Password $JiraCredentials.ApiToken -HostName $JiraCredentials.HostName

#do tests here

#CREATE FILTER
#Invoke-JiraCreateFilter "test filter 5" "project = JPT ORDER BY Summary" -Favourite -Expand @("sharedUsers")

#GET DEFAULT SHARE SCOPE
#Invoke-JiraGetDefaultShareScope

#SET DEFAULT SHARE SCOPE
#Invoke-JiraSetDefaultShareScope "PRIVATE"

#end tests

#close the Jira session
Close-JiraSession