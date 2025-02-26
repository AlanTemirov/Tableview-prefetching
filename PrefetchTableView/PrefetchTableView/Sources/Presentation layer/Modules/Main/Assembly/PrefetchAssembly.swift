//
//  PrefetchAssembly.swift
//  PrefetchTableView
//
//  Created by Alan on 10/12/2019.
//  Copyright © 2019 Alan. All rights reserved.
//

import UIKit

final class PrefetchAssembly {
    
    func assembly(with prefetchView: PrefetchViewController) -> UIViewController {
        let presenter = PrefetchPresenter()
        let dataSource = PrefetchDataProvider()
        
        presenter.prefetchView = prefetchView
        presenter.imageService = ImageService()
        
        dataSource.prefetchProvider = presenter
        
        prefetchView.dataSource = dataSource
        prefetchView.output = presenter
        
        return prefetchView
    }
    
}
