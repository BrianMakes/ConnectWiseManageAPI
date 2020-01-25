![LogIn](https://www.connectwise.com/-/media/logos/company/product/manage/manage-horiz-black.ashx?h=393&w=1494&la=en&hash=41DF6B6D3CB705E82EE2189EC9C101E5C77B900A "Logo Title Text 1")


# ConnectWise Manage REST API PowerShell Wrapper
This is a PowerShell wrapper for the [ConnectWise Manage REST API](https://developer.connectwise.com/Products/Manage/REST). This module makes it easy to leverage PowerShell to automate tasks in Manage.



# Getting Started
>**As of 8/14/2019 ConnectWise now requires the use of a Client ID to interact with the API.**

[You will need to request a Client ID to use this module.](https://developer.connectwise.com/ClientID)

You will also want to create API keys to use with any projects you make.

[Please refer to the documentation for recommended authentication methods.](https://developer.connectwise.com/Products/Manage/Developer_Guide#Authentication)

---

The simplest way to get started is to connect with your Manage username and password.



![LogIn](https://i.imgur.com/JNfkqP9.png "Logo Title Text 1")

The following example script will use the same information you use to log into Manage.


```PowerShell
# This is the URL to your manage server.
$Server = 'server.example.com'

# This is the company entered at login
$Company = 'My Company ID'

# Your ClientID found at https://developer.connectwise.com/ClientID
$ClientID = 'Go generate your own ClientID'

# Create a credential object
$Credentials = Get-Credential

# Load the module into memory
iwr 'https://raw.githubusercontent.com/christaylorcodes/ConnectWise-Manage-Powershell/master/CWManage.psm1' | iex

# Connect to your Manage server
Connect-CWM -Server $Server -Company $Company -Credentials $Credentials -ClientID $ClientID

# Now that you are connected you can issue any of the available commands
# In the following example we are using a condition to find all of the cool people in your contacts.
$Chrises = Get-CWMContact -condition 'firstName="chris"' -all

# To clear your connection information from memory you can terminate the session or issue the disconnect command.
Disconnect-CWM
```

See [ConnectWiseManageAPI_Functions](ConnectWiseManageAPI_Functions.md) for a list of available commands.

Checkout the Examples folder to see other ways to use the module.


# Contributing
If you use this project please give it a star and follow so you can get updated when new features are released. This also lets me know what projects are getting used and what ones I should dedicate more time to. If you want to get more involved please see the [contributing page](CONTRIBUTING.md). Projects need all kinds of help even if you don't know how to code.

Want to share something you created using the module? Submit it to be featured as a Community Package.
