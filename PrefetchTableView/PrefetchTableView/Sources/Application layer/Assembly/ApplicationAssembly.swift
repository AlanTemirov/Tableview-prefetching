//
//  ApplicationAssembly.swift
//  PrefetchTableView
//
//  Created by Alan on 10/12/2019.
//  Copyright © 2019 Alan. All rights reserved.
//

import UIKit

final class ApplicationAssembly {
    
    func assemblyRootVC() -> UIViewController {
        let rootVC = PrefetchViewController()
        let prefetchVC = PrefetchAssembly().assembly(with: rootVC)
        
        return prefetchVC
    }
    
}
