﻿function Update-CWMProjectPhase {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "")]
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [Parameter(Mandatory=$true)]
        $ProjectID,
        [Parameter(Mandatory=$true)]
        $PhaseID,
        [Parameter(Mandatory=$true)]
        [validateset('add','replace','remove')]
        [string]$Operation,
        [Parameter(Mandatory=$true)]
        [string]$Path,
        [Parameter(Mandatory=$true)]
        $Value
    )

    $URI = "https://$($script:CWMServerConnection.Server)/v4_6_release/apis/3.0/project/projects/$ProjectID/phases/$PhaseID"
    return Invoke-CWMPatchMaster -Arguments $PsBoundParameters -URI $URI
}
