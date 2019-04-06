#https://developer.atlassian.com/cloud/jira/platform/rest/v2/#api-rest-api-2-project-projectIdOrKey-roledetails-get
function Invoke-JiraGetProjectRoleDetails {
    [CmdletBinding()]
    param (
        # THe project id or key to retrieve roles for
        [Parameter(Mandatory,Position=0)]
        [string]
        $ProjectIdOrKey,

        # Set this flag to include only the roles to which the current user belongs
        [Parameter(Position=1)]
        [switch]
        $MyRoles,

        # The JiraConnection object to use for the request
        [Parameter(Position=2)]
        [hashtable]
        $JiraConnection
    )
    process {
        $functionPath = "/rest/api/2/project/$ProjectIdOrKey/roledetails"
        $verb = "GET"

        $body = @{}
        if($PSBoundParameters.ContainsKey("MyRoles")){$body.Add("currentMember",$true)}

        Invoke-JiraRestRequest -JiraConnection $JiraConnection -FunctionPath $functionPath -HttpMethod $verb -Body $body
    }
}