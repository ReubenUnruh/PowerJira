#import PowerJira
Import-Module (Join-Path -Path $PSScriptRoot -ChildPath \..\PowerJira\PowerJira.psm1) -Force

#import the variable $JiraCredentials
Import-Module (Join-Path -Path $PSScriptRoot -ChildPath \credentials\Credentials.psm1) -Force

#open a new Jira session
Open-JiraSession -UserName $JiraCredentials.UserName -Password $JiraCredentials.ApiToken -HostName $JiraCredentials.HostName

#do tests here

#GET ALL SCREENS
#(Invoke-JiraGetAllScreens).values[0]

#ADD FIELD TO DEFAULT SCREEN
#Invoke-JiraAddDefaultScreenField customfield_10004

#GET AVAILABLE SCREEN FIELDS
#Invoke-JiraGetAvailableScreenFields 2

#GET ALL SCREEN TABS
#Invoke-JiraGetAllScreenTabs 2

#CREATE SCREEN TAB
#Invoke-JiraCreateScreenTab 1 "tabName2"

#UPDATE SCREEN TAB
#Invoke-JiraUpdateScreenTab 1 10110 "newTabName2"

#DELETE SCREEN TAB
#Invoke-JiraDeleteScreenTab 1 10110

#GET ALL SCREEN TAB FIELDS
#Invoke-JiraGetAllScreenTabFields 1 10000

#ADD SCREEN TAB FIELD
#Invoke-JiraAddScreenTabField 2 10001 duedate

#REMOVE SCREEN TAB FIELD
#Invoke-JiraRemoveScreenTabField 2 10001 versions

#REORDER SCREEN TAB
#Invoke-JiraReorderScreenTab 1 10107 1

#REORDER SCREEN TAB FIELD
#Invoke-JiraReorderScreenTabField 2 10001 duedate Last

#end tests

#close the Jira session
Close-JiraSession