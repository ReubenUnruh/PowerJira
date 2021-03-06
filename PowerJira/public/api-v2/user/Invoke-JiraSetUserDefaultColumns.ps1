#https://developer.atlassian.com/cloud/jira/platform/rest/v2/#api-rest-api-2-user-columns-put
function Invoke-JiraSetUserDefaultColumns {
    [CmdletBinding()]
    param (
        # An array of field names to display as columns
        [Parameter(Mandatory,Position=0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $Columns,

        # The accountID of the user to set default columns for
        [Parameter(Position=1)]
        [string]
        $User,

        # The JiraContext object to use for the request
        [Parameter()]
        [JiraContext]
        $JiraContext
    )
    process {
        $functionPath = "/rest/api/2/user/columns"
        $verb = "PUT"

        $query = New-Object RestMethodQueryParams
        if($PSBoundParameters.ContainsKey("User")){$query.Add("accountId",$User)}

        $body = New-Object RestMethodJsonBody @{
            columns = $Columns
        }

        $method = New-Object BodyRestMethod @($functionPath,$verb,$query,$body)
        $method.Invoke($JiraContext)
    }
}