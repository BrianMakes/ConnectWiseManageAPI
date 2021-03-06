﻿function New-CWMContact {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "")]
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [int]$id,
        [Parameter(Mandatory=$true)]
        [ValidateLength(1,30)]
        [string]$firstName,
        [ValidateLength(1,30)]
        [string]$lastName,
        [hashtable]$type,
        [hashtable]$company,
        [hashtable]$site,
        [ValidateLength(1,50)]
        [string]$addressLine1,
        [ValidateLength(1,50)]
        [string]$addressLine2,
        [ValidateLength(1,50)]
        [string]$city,
        [ValidateLength(1,50)]
        [string]$state,
        [ValidateLength(1,12)]
        [string]$zip,
        [ValidateLength(1,50)]
        [string]$country,
        [hashtable]$relationship,
        [hashtable]$department,
        [bool]$inactiveFlag,
        [int]$defaultMergeContactId,
        [ValidateLength(1,184)]
        [string]$securityIdentifier,
        [int]$managerContactId,
        [int]$assistantContactId,
        [ValidateLength(1,100)]
        [string]$title,
        [ValidateLength(1,50)]
        [string]$school,
        [ValidateLength(1,30)]
        [string]$nickName,
        [bool]$marriedFlag,
        [bool]$childrenFlag,
        [ValidateLength(1,30)]
        [string]$significantOther,
        [ValidateLength(1,15)]
        [SecureString]$portalPassword,
        [int]$portalSecurityLevel,
        [bool]$disablePortalLoginFlag,
        [bool]$unsubscribeFlag,
        [validateset('Male','Female')]
        [string]$gender,
        [string]$birthDay,
        [string]$anniversary,
        [validateset('Online','DoNotDisturb','Away','Offline','NoAgent')]
        [string]$presence,
        [GUID]$mobileGuid,
        [string]$facebookUrl,
        [string]$twitterUrl,
        [string]$linkedInUrl,
        [bool]$defaultBillingFlag,
        [bool]$defaultFlag,
        [hashtable[]]$communicationItems,
        [hashtable]$_info,
        [hashtable[]]$customFields
    )

    $URI = "https://$($script:CWMServerConnection.Server)/v4_6_release/apis/3.0/company/contacts"
    return Invoke-CWMNewMaster -Arguments $PsBoundParameters -URI $URI
}
