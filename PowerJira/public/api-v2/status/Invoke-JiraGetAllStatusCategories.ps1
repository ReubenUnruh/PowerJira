#https://developer.atlassian.com/cloud/jira/platform/rest/v2/#api-rest-api-2-statuscategory-get
function Invoke-JiraGetAllStatusCategories {
    [CmdletBinding()]
    param (
        # The JiraContext object to use for the request
        [Parameter()]
        [JiraContext]
        $JiraContext
    )
    process {
        $functionPath = "/rest/api/2/statuscategory"
        $verb = "GET"

        $method = New-Object RestMethod @($functionPath,$verb)
        $method.Invoke($JiraContext)
    }
}