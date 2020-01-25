﻿function Get-CWMProductSubCategory {
    [CmdletBinding()]
    param(
        [string]$Condition,
        [ValidatePattern('\S* (desc|asc)')]
        [string]$orderBy,
        [string]$childConditions,
        [string]$customFieldConditions,
        [int]$page,
        [int]$pageSize,
        [switch]$all
    )

    $URI = "https://$($script:CWMServerConnection.Server)/v4_6_release/apis/3.0/procurement/subcategories"
    return Invoke-CWMGetMaster -Arguments $PsBoundParameters -URI $URI
}
