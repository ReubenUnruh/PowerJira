#https://developer.atlassian.com/cloud/jira/platform/rest/v2/#api-rest-api-2-version-id-relatedIssueCounts-get
function Invoke-JiraGetVersionRelatedIssueCounts {
    [CmdletBinding()]
    param (
        # The ID of the version
        [Parameter(Mandatory=$true)]
        [int32]
        $VersionId,

        # The JiraConnection object to use for the request
        [Parameter(Mandatory=$false)]
        [hashtable]
        $JiraConnection
    )
    process {
        $functionPath = "/rest/api/2/version/$VersionId/relatedIssueCounts"
    
        Invoke-JiraRestRequest -JiraConnection $JiraConnection -FunctionPath $functionPath -HttpMethod "GET"
    }
}