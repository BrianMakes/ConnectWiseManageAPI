﻿function Remove-CWMAgreementSite {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "")]
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [Parameter(Mandatory=$true)]
        [int]$AgreementID,
        [Parameter(Mandatory=$true)]
        [int]$SiteID
    )
    $URI = "https://$($script:CWMServerConnection.Server)/v4_6_release/apis/3.0/finance/agreements/$($AgreementID)/sites/$($SiteID)"
    return Invoke-CWMDeleteMaster -Arguments $PsBoundParameters -URI $URI
}
