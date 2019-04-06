#https://developer.atlassian.com/cloud/jira/platform/rest/v2/#api-rest-api-2-projectvalidate-validProjectName-get
function Invoke-JiraGetValidProjectName {
    [CmdletBinding()]
    param (
        # The name to validate
        [Parameter(Mandatory,Position=0)]
        [string]
        $Name,

        # The JiraConnection object to use for the request
        [Parameter(Position=1)]
        [hashtable]
        $JiraConnection
    )
    process {
        $functionPath = "/rest/api/2/projectvalidate/validProjectName"

        $query=@{
            name = $Name
        }

        Invoke-JiraRestRequest -JiraConnection $JiraConnection -FunctionPath $functionPath -HttpMethod "GET" -QueryParams $query
    }
}