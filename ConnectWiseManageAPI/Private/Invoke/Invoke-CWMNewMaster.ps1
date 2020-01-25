﻿function Invoke-CWMNewMaster {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        $Arguments,
        [string]$URI,
        [string[]]$Skip
    )
    # Skip common parameters
    $Skip += 'Debug','ErrorAction','ErrorVariable','InformationAction','InformationVariable','OutVariable','OutBuffer','PipelineVariable','Verbose','WarningAction','WarningVariable','WhatIf','Confirm'

    $Body = @{}
    foreach($i in $Arguments.GetEnumerator()){
        if($Skip -notcontains $i.Key){
            $Body.Add($i.Key, $i.value)
        }
    }
    $Body = ConvertTo-Json $Body -Depth 100
    Write-Verbose $Body

    $WebRequestArguments = @{
        Uri = $URI
        Method = 'Post'
        ContentType = 'application/json'
        Body = $Body
    }

    if ($PSCmdlet.ShouldProcess($WebRequestArguments.URI, "Invoke-CWMNewMaster, with body:`r`n$Body`r`n")) {
        $Result = Invoke-CWMWebRequest -Arguments $WebRequestArguments
        if($Result.content){
            $Result = $Result.content | ConvertFrom-Json
        }
    }
    return $Result
}
