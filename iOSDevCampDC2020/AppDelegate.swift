//
//  AppDelegate.swift
//  iOSDevCampDC2020
//
//  Created by Stephen Shaw on 10/25/20.
//  Copyright © 2020 Stephen Shaw. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        appLaunchSequence()
        
        return true
    }
    
    func appLaunchSequence() {
        setLoadingViewControllerAsRoot()
        
        RemoteConfigManager.shared.fetchCloudValues { [weak self] success in
            guard let `self` = self else { return }
            
            if success {
                if self.maintenanceEnabled() {
                    DispatchQueue.main.async {
                        self.showMaintenanceAlert()
                    }
                } else {
                    DispatchQueue.main.async {
                        self.configureTabs()
                    }
                }
            }
        }
    }
    
    func setLoadingViewControllerAsRoot() {
        let loadingVC = LoadingViewController()
        window?.rootViewController = loadingVC
    }
    
    func maintenanceEnabled() -> Bool {
        guard let maintenance = RemoteConfigManager.shared.getMaintenance() else {
            return false
        }
        
        return maintenance.enabled
    }
    
    func showMaintenanceAlert() {
        guard let maintenance = RemoteConfigManager.shared.getMaintenance() else {
            return
        }
        
        let maintenanceAlert = UIAlertController(title: maintenance.title, message: maintenance.message, preferredStyle: .alert)
        self.window?.rootViewController?.present(maintenanceAlert, animated: true, completion: nil)
        
    }
    
    func configureTabs() {
        let tabBarController = UITabBarController()
        let tabs = RemoteConfigManager.shared.getTabs()
        
        if tabs.isEmpty {
            self.setBackupTabBarController()
            return
        }
        
        var viewControllers: [UIViewController] = []
        for tab in tabs {
            guard let tabViewController = tab.viewController else { return }
            
            tabViewController.tabBarItem = UITabBarItem(title: tab.title, image: tab.image, selectedImage: tab.image)
            viewControllers.append(tabViewController)
        }
        tabBarController.viewControllers = viewControllers
        
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
    }
    
    func setBackupTabBarController() {
        let tabBarController = UITabBarController()
        
        let vc1 = DefaultViewController()
        vc1.tabBarItem = UITabBarItem(title: "Tab 1", image: UIImage(systemName: "star"), selectedImage: nil)
        
        let vc2 = DefaultViewController()
        vc2.tabBarItem = UITabBarItem(title: "Tab 2", image: UIImage(systemName: "gear"), selectedImage: nil)
        
        tabBarController.viewControllers = [vc1, vc2]
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
    }
}
