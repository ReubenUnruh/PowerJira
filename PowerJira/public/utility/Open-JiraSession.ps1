function Open-JiraSession {
    [CmdletBinding(DefaultParameterSetName="PlainText")]
    param (
        # The Jira username of the user performing actions
        [Parameter(Mandatory=$true,ParameterSetName="PlainText")]
        [string]
        $UserName,

        # The Jira password (or API Token) of the user performing actions
        [Parameter(Mandatory=$true,ParameterSetName="PlainText")]
        [string]
        $Password,

        # The hostname of the Jira instance to interact with (e.g. https://yourjirasite.atlassian.net/)
        [Parameter(Mandatory=$true)]
        [string]
        $HostName
    )
    process {
        $Global:PowerJira.Session = New-JiraConnection -UserName $UserName -Password $Password -HostName $HostName
    }
}