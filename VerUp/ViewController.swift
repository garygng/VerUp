//
//  ViewController.swift
//  VerUp
//
//  Created by Gary.nG on 4/9/16.
//  Copyright © 2016 Gary.nG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(animated: Bool) {
        checkForAppVerupdate()
    }
    
    func checkForAppVerupdate(){
        // Get App Current Version form Web Hosting Server and compare app version for does app version out-dated
        var onlineAppVersion = "0.00"
        
        let url = NSURL(string: "http://minka.comlu.com/app/AppVerKeeper.json")
        let data = try? NSData(contentsOfURL: url!, options: NSDataReadingOptions.DataReadingUncached)
        print(data)
        if data != nil {
            let json : AnyObject! = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
            print(json)
            let AppInfo: AnyObject! = json.objectForKey("AppInfo")
            //let AppName: AnyObject! = AppInfo?.objectForKey("AppName")
            onlineAppVersion = (AppInfo?.objectForKey("Version"))! as! String
        }
        
        if onlineAppVersion != "0.00" {
            // let onlineAppVersion = "1.51" // Test data for app store new online verion release testing 
            
            // Current User App verion on there local iphone
            let userAppVersion = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as! String
            //print("Current Version: \(userAppVersion)-- onlineAppVersionVersion: \(onlineAppVersion)")
            
            //Compare App Versions
            let onlineAppVersionComponents : NSArray = onlineAppVersion.componentsSeparatedByString(".")
            let userAppVersionComponents : NSArray = userAppVersion.componentsSeparatedByString(".")
            
            var needToUpdate = false
            
            for i in 0..<min(onlineAppVersionComponents.count, userAppVersionComponents.count)
            {
                let onlineAppVersionComponents = onlineAppVersionComponents.objectAtIndex(i) as! String
                let userAppVersionComponent = userAppVersionComponents.objectAtIndex(i) as! String
                
                //Compare App Versions
                let oAppVer: String = onlineAppVersionComponents
                let uAppVer: String = userAppVersionComponent
                //print("Current Version2: \(uAppVer)-- onlineAppVersionVersion2: \(oAppVer)")
                if (oAppVer != uAppVer)
                {
                    needToUpdate = (uAppVer < oAppVer)
                    print(needToUpdate)
                    //print("Current Version3: \(uAppVer)-- onlineAppVersionVersion3: \(oAppVer)")
                    break;
                }
            }
            if (needToUpdate) {
                print("need to updated")
                UpdateAlert("New Version", message: "Newer version Available for download !")
            }
        } // onlineAppVersion equal to 0
    }
    // Pop-up Update ALert
    func UpdateAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let cancelAction = UIAlertAction(title: "Next-time", style: .Cancel, handler: nil)
        let updateAction = UIAlertAction(title: "Update", style: .Default){ action in
            self.openLink("AppleStoreReview")
        }
        alert.addAction(cancelAction)
        alert.addAction(updateAction)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    // link to Apple Store
    func openLink(toUrl: String) {
        let Link : String
        if toUrl == "AppleStoreReview" {
            //*********************************************
            // Reaplce With Your Apple Store URL and App)ID
            //*********************************************
            Link = "itms-apps://itunes.apple.com/hk/app/my-public-ip/id1093560803"
        } else {
            Link = "http://minka.comlu.com/"
        }
        UIApplication.sharedApplication().openURL(NSURL (string: Link)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
