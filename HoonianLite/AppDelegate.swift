//
//  AppDelegate.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 18/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SVProgressHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController: UINavigationController?
    var loginViewController: LoginViewController?
    var navArrayMenu = [UINavigationController]()
    var tabBarController = UITabBarController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
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

    func goToHome() {
        guard let window = UIApplication.shared.keyWindow else{
            return
            
        }
        window.frame = UIScreen.main.bounds
        window.backgroundColor = .white
        
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let purchaseViewController = PurchaseViewController(nibName: "PurchaseViewController", bundle: nil)
        let contactsViewController = ContactsViewController(nibName: "ContactsViewController", bundle: nil)
        let scanARViewController = ScanARViewController(nibName: "ScanARViewController", bundle: nil)
        
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.3933430612, green: 0.5921664834, blue: 0.6682108641, alpha: 1)
        
        let home = UINavigationController(rootViewController: homeViewController)
        
        ACRequest.GET_PURCHASED_LIST(agentId: ACData.LOGINDATA.agent.id,successCompletion: { (getPurchaseModel) in
            ACData.PURCHASELISTMODEL = getPurchaseModel
            SVProgressHUD.dismiss()
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        }
        
        let purchase = UINavigationController(rootViewController: purchaseViewController)
        let contacts = UINavigationController(rootViewController: contactsViewController)
        let scanAR = UINavigationController(rootViewController: scanARViewController)
        
        let menuDictionary: [Int: UINavigationController] = [
            1: home,
            2: purchase,
            3: contacts,
            4: scanAR]
        
        var menuName: [Int: String] = [:]
        for menuItem in ACData.LOGINDATA.menuNavBar {
            let menu = menuItem.mobileMenuId
            guard let menuNav = menuDictionary[menu] else {
                return
            }
            menuName[menuItem.mobileMenuId] = menuItem.mobileMenuname
            navArrayMenu.append(menuNav)
        }
        
        let homeTab = UITabBarItem(title: "Home", image: .checkmark, selectedImage: .add)
        homeViewController.tabBarItem = homeTab
        
        let purchaseTab = UITabBarItem(title: "Purchase", image: .checkmark, selectedImage: .add)
        purchaseViewController.tabBarItem = purchaseTab
        
        let contactsTab = UITabBarItem(title: "Contacts", image: .checkmark, selectedImage: .add)
        contactsViewController.tabBarItem = contactsTab
        
        let scanARTab = UITabBarItem(title: "Scan AR", image: .checkmark, selectedImage: .add)
        scanARViewController.tabBarItem = scanARTab
        
        tabBarController.viewControllers = navArrayMenu
        tabBarController.selectedIndex = 0
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
}

