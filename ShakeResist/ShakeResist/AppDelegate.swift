//
//  AppDelegate.swift
//  ShakeResist
//
//  Created by Malkiel Asher on 5/4/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//


/**
# Step 1: Models:
• What are the primary types of data that the app will work with?
    The types of data that my app will primarily work with are Strings and Int.
• What data will the user input into the app?
    The user will input text data which they would like to be presented on the main screen.
•  What data will your app display?
    My app will display the data that the user entered in the step before and on another screen it will display a scrollView of the history of items the user has entered previously.
•  Where will the app get the data?
    The app will get its data from the user and the plist stored on the device
•  What APIs or frameworks will the app access?
    I will be using the accelerometer and gyroscope so I will utilize the Core Motion framework.
•  How does the data relate to other data?
    For my project the data doesn't neccesarily relate to other data.
•  How will you persist, or save, the data?
    As mentioned above, I will have the data saved to the device's storage using plist
•  If you have two types of related data, consider their relationship. How can you access all the data you need from the data you already have? For example, if you were to build a simple shopping app, you may want to view the order history of a particular customer.
    I don't have related data.
**/


import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

