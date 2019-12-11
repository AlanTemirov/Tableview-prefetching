//
//  AppDelegate.swift
//  PrefetchTableView
//
//  Created by Alan on 10/12/2019.
//  Copyright © 2019 Alan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appRouter = AppRouter()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let rootVC = ApplicationAssembly().assemblyRootVC()
        appRouter.root(&window, rootViewController: rootVC)
        
        return true
    }

}

