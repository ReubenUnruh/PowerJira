#https://developer.atlassian.com/cloud/jira/platform/rest/v2/#api-rest-api-2-project-projectIdOrKey-avatars-get
function Invoke-JiraGetAllProjectAvatars {
    [CmdletBinding()]
    param (
        # The project Id or Key
        [Parameter(Mandatory,Position=0)]
        [string]
        $ProjectIdOrKey,

        # The JiraContext object to use for the request
        [Parameter()]
        [JiraContext]
        $JiraContext
    )
    process {
        $functionPath = "/rest/api/2/project/$ProjectIdOrKey/avatars"
        $verb = "GET"

        $method = New-Object RestMethod @($functionPath,$verb)
        $method.Invoke($JiraContext)
    }
}