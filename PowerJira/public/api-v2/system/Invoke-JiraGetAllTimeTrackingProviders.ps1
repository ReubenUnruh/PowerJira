#https://developer.atlassian.com/cloud/jira/platform/rest/v2/#api-rest-api-2-configuration-timetracking-list-get
function Invoke-JiraGetAllTimeTrackingProviders {
    [CmdletBinding()]
    param (
        # The JiraContext object to use for the request
        [Parameter()]
        [JiraContext]
        $JiraContext
    )
    process {
        $functionPath = "/rest/api/2/configuration/timetracking/list"
        $verb = "GET"

        $method = New-Object RestMethod @($functionPath,$verb)
        $method.Invoke($JiraContext)
    }
}