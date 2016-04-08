# VerUp
Notify users when a new version of your iOS app is available. In Swift 

#About

#Screenshots
![alt tag](https://raw.githubusercontent.com/garygng/VerUp/master/VerUp/Simulator%20Screen%20Shot%20Apr%209%2C%202016%2C%2006.15.34.png)

#Setup
![alt tag](https://raw.githubusercontent.com/garygng/VerUp/master/VerUp/Screen%20Shot%202016-04-09%20at%2005.52.21.png)

//*********************************************
// Reaplce With Your hosted json file <EXAMPLE>
//*********************************************
Json File
{
  "AppInfo": {
        "AppName": "mypublicip",
        "Version": "1.51"
    }
}

//*********************************************
// Reaplce With Your hosted json file url
//*********************************************
let url = NSURL(string: "**<PLACE-YOUR-HOSTED-JSON-FILE-HERE>**")

EXAMPLE:
let url = NSURL(string: "https://gist.githubusercontent.com/garygng/428effb96349e6b661eb2440dcb71e1c/raw/f35c8bf1c2329de1f6bd5e99104190faff3fb17f/AppVerKeeper.json")


//*********************************************
// Reaplce With Your Apple Store URL and App)ID
//*********************************************
Link = "itms-apps://itunes.apple.com/hk/app/**<PLACE-YOUR-APP_ID-HERE>**"

EXAMPLE: 
Link = "itms-apps://itunes.apple.com/hk/app/my-public-ip/id1093560803"
