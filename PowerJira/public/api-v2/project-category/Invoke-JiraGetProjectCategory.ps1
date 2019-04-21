#https://developer.atlassian.com/cloud/jira/platform/rest/v2/#api-rest-api-2-projectCategory-id-get
function Invoke-JiraGetProjectCategory {
    [CmdletBinding()]
    param (
        # The id of the category to retrieve
        [Parameter(Mandatory,Position=0)]
        [int64]
        $CategoryId,

        # The JiraConnection object to use for the request
        [Parameter(Position=1)]
        [hashtable]
        $JiraConnection
    )
    process {
        $functionPath = "/rest/api/2/projectCategory/$CategoryId"
        $verb = "GET"

        Invoke-JiraRestMethod $JiraConnection $functionPath $verb
    }
}