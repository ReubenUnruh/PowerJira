#https://developer.atlassian.com/cloud/jira/platform/rest/v2/#api-rest-api-2-attachment-meta-get
function Invoke-JiraGetAttachmentSettings {
    [CmdletBinding()]
    param (
        # The JiraConnection object to use for the request
        [Parameter(Position=0)]
        [hashtable]
        $JiraConnection
    )
    process {
        $functionPath = "/rest/api/2/attachment/meta"
        $verb = "GET"

        Invoke-JiraRestMethod $JiraConnection $functionPath $verb
    }
}