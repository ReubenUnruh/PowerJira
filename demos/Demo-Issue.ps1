#import PowerJira
Import-Module (Join-Path -Path $PSScriptRoot -ChildPath \..\PowerJira\PowerJira.psm1) -Force

#import the variable $JiraCredentials
Import-Module (Join-Path -Path $PSScriptRoot -ChildPath \credentials\Credentials.psm1) -Force

#open a new Jira session
$context = Open-JiraSession -UserName $JiraCredentials.UserName -Password $JiraCredentials.ApiToken -HostName $JiraCredentials.HostName

#do tests here

#GET CREATE ISSUE METADATA
# $meta = Invoke-JiraGetIssueCreateMetadata -Key "JPT" -TypeIds @(10001,10002) -Expand "projects.issuetypes.fields"
# $meta.projects[0].issuetypes[1].fields
# $meta = (Invoke-JiraGetProjects).values | Invoke-JiraGetIssueCreateMetadata -TypeIds @(10001,10002)
# $meta

#GET ISSUE
# @(
#   [pscustomobject]@{id=10000},
#   [pscustomobject]@{id=10002},
#   [pscustomobject]@{id=10003;key="JPT-4"}
#   ) | Invoke-JiraGetIssue

#CREATE ISSUE
# $createFields = @{
#   issuetype = @{id=10001} #task
#   summary = "Issue that will be deleted"
#   project = @{id=10000}
# }
# Invoke-JiraCreateIssue -Fields $createFields
# @(
#   @{
#     issuetype = @{id=10001} #story
#     summary = "Issue that will be deleted 1"
#     project = @{id=10000}
#   },
#   @{
#     issuetype = @{id=10001} #story
#     summary = "Issue that will be deleted 2"
#     project = @{id=10000}
#   },
#   @{
#     issuetype = @{id=10002} #task
#     summary = "Issue that will be deleted 3"
#     project = @{id=10000}
#   }
# ) | Invoke-JiraCreateIssue

#EDIT ISSUE
# $updateFields = @{
#   issuetype = @{id=10001} #task
#   summary = "PJ Test Issue 1"
#   project = @{id=13324}
#   #reporter = @{id=(Invoke-JiraGetCurrentUser).accountId}
# }
# Invoke-JiraEditIssue JPT-12 $updateFields
# @(
#   [pscustomobject]@{id=10000},
#   [pscustomobject]@{id=10002},
#   [pscustomobject]@{id=10003;key="JPT-4"}
#   ) | Invoke-JiraEditIssue -Fields @{summary="overwritten summary!"}

#DELETE ISSUE
#Invoke-JiraDeleteIssue JPT-12
# @(
#   [pscustomobject]@{id=10006},
#   [pscustomobject]@{id=10007;deleteSubtasks=$true}
#   ) | Invoke-JiraDeleteIssue

#GET EDIT ISSUE METADATA
#(Invoke-JiraGetIssueEditMetadata JPT-1).fields
# @(
#   [pscustomobject]@{id=10000},
#   [pscustomobject]@{id=10002},
#   [pscustomobject]@{id=10003;key="JPT-4"}
#   ) | Invoke-JiraGetIssueEditMetadata

#TRANSITION ISSUE
#Invoke-JiraTransitionIssue JPT-1 71

#ASSIGN ISSUE
#Invoke-JiraAssignIssue JPT-1 (Invoke-JiraGetCurrentUser).accountId
#Invoke-JiraAssignIssue JPT-1 
#Invoke-JiraAssignIssue JPT-1 -ProjectDefault
#  @(
#   [pscustomobject]@{id=10000},
#   [pscustomobject]@{id=10002},
#   [pscustomobject]@{id=10003;key="JPT-4"}
#   ) | Invoke-JiraAssignIssue

#GET ISSUE WATCHERS
#(Invoke-JiraGetIssueWatchers JPT-1).watchers

#GET ISSUE TRANSITIONS
#(Invoke-JiraGetIssueTransitions JPT-1).TRANSITIONS

#BULK ISSUE CREATE
# $issues = @()
# for ($i=1;$i -lt 4;$i++) {
#     $issues += @{
#         fields = @{
#             issuetype = @{id=10001} #task
#             summary = "PJ Test Issue Bulk Create $i"
#             project = @{id=10000}
#             #reporter = @{id=(Invoke-JiraGetCurrentUser).accountId}
#         }
#     }
# }
# Invoke-JiraCreateIssueBulk $issues
# @(
#  @{fields=@{
#     issuetype = @{id=10001} #story
#     summary = "Issue that will be deleted 5"
#     project = @{id=10000}
#   }},
#   @{fields=@{
#     issuetype = @{id=10001} #story
#     summary = "Issue that will be deleted 6"
#     project = @{id=10000}
#   }},
#   @{fields=@{
#     issuetype = @{id=10002} #task
#     summary = "Issue that will be deleted 7"
#     project = @{id=10000}
#   }}
# ) | Invoke-JiraCreateIssueBulk

#ADD WATCHER
#Invoke-JiraAddWatcher JPT-1 
#  @(
#   [pscustomobject]@{id=10000},
#   [pscustomobject]@{id=10002},
#   [pscustomobject]@{id=10003;key="JPT-4"}
#   ) | Invoke-JiraAddWatcher

#DELETE WATCHER
#Invoke-JiraDeleteWatcher JPT-1 
#  @(
#   [pscustomobject]@{id=10000},
#   [pscustomobject]@{id=10002},
#   [pscustomobject]@{id=10003;key="JPT-4"}
#   ) | Invoke-JiraDeleteWatcher -AccountId (Invoke-JiraGetCurrentUser).accountId

#GET VOTES
#Invoke-JiraGetVotes JPT-1

#ADD VOTE
#Invoke-JiraAddVote JPT-1
# @(
#   [pscustomobject]@{id=10004;key="JPT-5"}
#   ) | Invoke-JiraAddVote

#DELETE VOTE
# Invoke-JiraDeleteVote JPT-1
# @(
#   [pscustomobject]@{id=10004;key="JPT-5"}
#   ) | Invoke-JiraDeleteVote

#SEND ISSUE NOTIFICATION
# $message = "This is a test message, let me know if you get it -Justin"
# $me = Invoke-JiraGetCurrentUser
# Invoke-JiraSendIssueNotification JPT-1 $message -Subject "SYSTEMS CHANGE NOTICE"

#GET ISSUE PICKER SUGGESTIONS
#(Invoke-JiraGetIssuePickerSuggestions "test").sections | fl
# [PSCustomObject]@{
#     projectId = 10000
#     TextFilter = "test"
# } | Invoke-JiraGetIssuePickerSuggestions

#GET ISSUE CHANGELOGS
#(Invoke-JiraGetIssueChangelogs JPT-1).values | fl
# @(
#   [pscustomobject]@{id=10000},
#   [pscustomobject]@{id=10002},
#   [pscustomobject]@{id=10003;key="JPT-4"}
#   ) | Invoke-JiraGetIssueChangelogs

#GET ISSUE PROPERTY KEYS
#Invoke-JiraGetIssuePropertyKeys JPT-1
#@("JPT-1") | Invoke-JiraGetIssuePropertyKeys

#SET ISSUE PROPERTY
#Invoke-JiraSetIssueProperty JPT-1 "this.is.cool" @{someProperty="text";anArray=@("one","two","three")}

#GET ISSUE PROPERTY
#(Invoke-JiraGetIssueProperty JPT-1 "this.is.cool").value

#DELETE ISSUE PROPERTY
#Invoke-JiraDeleteIssueProperty JPT-1 "this.is.cool"
#$toDelete = @("JPT-1") | Invoke-JiraGetIssuePropertyKeys | Invoke-JiraDeleteIssueProperty

#end tests

#close the Jira session
Close-JiraSession