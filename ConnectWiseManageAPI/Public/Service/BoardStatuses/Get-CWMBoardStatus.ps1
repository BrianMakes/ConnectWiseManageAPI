﻿function Get-CWMBoardStatus {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [int]$ServiceBoardID,
        [string]$Condition,
        [ValidatePattern('\S* (desc|asc)')]
        [string]$orderBy,
        [string]$childConditions,
        [string]$customFieldConditions,
        [int]$page,
        [int]$pageSize,
        [switch]$all
    )

    $URI = "https://$($script:CWMServerConnection.Server)/v4_6_release/apis/3.0/service/boards/$ServiceBoardID/statuses"

    return Invoke-CWMGetMaster -Arguments $PsBoundParameters -URI $URI
}