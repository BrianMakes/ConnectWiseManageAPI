﻿function Get-CWMAgreementSite {
    [CmdletBinding()]
    param(
        [string]$Condition,
        [ValidatePattern('\S* (desc|asc)')]
        [string]$orderBy,
        [string]$childConditions,
        [string]$customFieldConditions,
        [int]$page,
        [int]$pageSize,
        [switch]$all,
        [Parameter(Mandatory=$true)]
        [int]$AgreementID
    )
    $URI = "https://$($script:CWMServerConnection.Server)/v4_6_release/apis/3.0/finance/agreements/$($AgreementID)/sites"
    return Invoke-CWMGetMaster -Arguments $PsBoundParameters -URI $URI
}
