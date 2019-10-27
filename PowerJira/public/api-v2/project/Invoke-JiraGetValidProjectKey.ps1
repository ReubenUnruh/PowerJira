#https://developer.atlassian.com/cloud/jira/platform/rest/v2/#api-rest-api-2-projectvalidate-validProjectKey-get
function Invoke-JiraGetValidProjectKey {
    [CmdletBinding()]
    param (
        # The key to validate
        [Parameter(Mandatory,Position=0)]
        [string]
        $Key,

        # The JiraContext object to use for the request
        [Parameter()]
        [JiraContext]
        $JiraContext
    )
    process {
        $functionPath = "/rest/api/2/projectvalidate/validProjectKey"
        $verb = "GET"

        $query = [RestMethodQueryParams]::new(@{
            key = $Key
        })

        $method = [RestMethod]::new($functionPath,$verb,$query)
        $method.Invoke($JiraContext)
    }
}