//
//  ApplicationRouter.swift
//  PrefetchTableView
//
//  Created by Alan on 10/12/2019.
//  Copyright © 2019 Alan. All rights reserved.
//

import UIKit

final class AppRouter {
    
    func root<T: UIViewController>(_ window: inout UIWindow?, rootViewController: T) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
}
