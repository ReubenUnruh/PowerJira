#https://developer.atlassian.com/cloud/jira/platform/rest/v2/#api-rest-api-2-workflowscheme-id-workflow-put
function Invoke-JiraSetWorkflowIssueTypes {
    [CmdletBinding()]
    param (
        # The id of the scheme
        [Parameter(Mandatory,Position=0)]
        [int64]
        $SchemeId,

        # The workflow to set issue types for
        [Parameter(Mandatory,Position=1)]
        [string]
        $WorkflowName,

        # The issue types to assign to the workflow
        [Parameter(Mandatory,Position=2)]
        [int64[]]
        $IssueTypeIds,

        # Set this flag to indicate the workflow is the default for the scheme
        [Parameter()]
        [switch]
        $Default,

        # Set this flag to update a draft if the workflow is currently being used
        [Parameter()]
        [switch]
        $UpdateDraft,

        # The JiraConnection object to use for the request
        [Parameter(Position=3)]
        [hashtable]
        $JiraConnection
    )
    process {
        $functionPath = "/rest/api/2/workflowscheme/$SchemeId/workflow"
        $verb = "PUT"

        $query=@{
            workflowName = $WorkflowName
        }

        $body = @{
            issueTypes = $IssueTypeIds
            workflow = $WorkflowName
        }
        if($PSBoundParameters.ContainsKey("Default")){$body.Add("defaultMapping",$true)}
        if($PSBoundParameters.ContainsKey("UpdateDraft")){$body.Add("updateDraftIfNeeded",$true)}

        Invoke-JiraRestMethod $JiraConnection $functionPath $verb -Query $query -Body $body
    }
}