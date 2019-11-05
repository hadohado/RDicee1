//
//  AppDelegate.swift
//  Real Dicee
//
//  Created by Angela Yu on 12/07/2017.
//  Copyright © 2017 Angela Yu. All rights reserved.
//

import UIKit
import RealmSwift // I add nov-5-2019

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // I add nov-5-2019 ..............................
        print("where Realm db located for Dice Loc ",Realm.Configuration.defaultConfiguration.fileURL)
        //where Realm db located for Dice Loc  Optional
        
        //on my phone: (file:///var/mobile/Containers/Data/Application/2D2558AA-B27D-4515-BE7B-E29A5AC0A38A/Documents/default.realm)
        
        // on mac book air:  /Users/ai87/Library/Developer/CoreSimulator/Devices/1D4DBF80-E8A8-4B8A-A4CA-16B896BEE6D6/data/Containers/Data/Application/A38F7FF0-4AA0-4C6C-8B07-0B1D4D07DD58/Documents/default.realm
        
        
        do {
            _ = try Realm()
        } catch {
            print("Error initialising new realm, \(error)")
        }
        // I add nov-5-2019 ..............................
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

