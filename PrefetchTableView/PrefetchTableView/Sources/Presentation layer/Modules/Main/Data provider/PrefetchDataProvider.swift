//
//  PrefetchDataProvider.swift
//  PrefetchTableView
//
//  Created by Alan on 10/12/2019.
//  Copyright © 2019 Alan. All rights reserved.
//

import UIKit

class PrefetchDataProvider: NSObject {
    
    var prefetchProvider: PrefetchDataSource!
    
}

extension PrefetchDataProvider: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}

extension PrefetchDataProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prefetchProvider.imagesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PrefetchCell.reuseId, for: indexPath) as! PrefetchCell
        cell.numberLabel.text = String(indexPath.row)
        
        if let image = prefetchProvider.image(at: indexPath.row)?.image {
            cell.updateAppearanceFor(image)
        } else {
            prefetchProvider.downloadImage(forItemAtIndex: indexPath.row)
        }
        
        return cell
    }
    
}

extension PrefetchDataProvider: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        debugPrint("Prefetch at: \(indexPaths)")
        indexPaths.forEach { prefetchProvider.downloadImage(forItemAtIndex: $0.row) }
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        debugPrint("Cancel prefetching at: \(indexPaths)")
        indexPaths.forEach { prefetchProvider.cancelDownloadingImage(forItemAtIndex: $0.row) }
    }
    
}
