//
//  ImageModel.swift
//  PrefetchTableView
//
//  Created by Alan on 10/12/2019.
//  Copyright © 2019 Alan. All rights reserved.
//

import UIKit

class ImageModel {
    
    let urlString: String
    var image: UIImage?
    
    lazy var url: URL = {
        return URL(string: urlString)!
    }()
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    // public API
    private static let imagesURL = "https://picsum.photos/id/"
    
    static func getImages() -> [ImageModel] {
        return (1...200).map { ImageModel(urlString: imagesURL + "\($0)" + "/500/500") }
    }
    
}
