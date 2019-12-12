//
//  PrefetchPresenter.swift
//  PrefetchTableView
//
//  Created by Alan on 10/12/2019.
//  Copyright © 2019 Alan. All rights reserved.
//

import UIKit

class PrefetchPresenter: PrefetchPresenterProtocol, PrefetchInteractorProtocol {
    
    weak var prefetchView: PrefetchViewInput?
    var imageService: ImageServiceProtocol!
    
    private var images: [ImageModel] = []
    
    func fetchImages() {
        images = ImageModel.getImages()
    }
    
}

extension PrefetchPresenter: PrefetchViewOutput {
    
    func onDidLoad() {
        fetchImages()
    }
    
}

extension PrefetchPresenter: PrefetchDataSource {
    
    var imagesCount: Int {
        return images.count
    }
    
    func image(at index: Int) -> ImageModel? {
        guard images.indices.contains(index) else {
            return nil
        }
        
        return images[index]
    }
    
    func downloadImage(forItemAtIndex index: Int) {
        loadImage(url: images[index].url) { [weak self] (data, error) in
            if let data = data {
                self?.images[index].image = UIImage(data: data)
                self?.prefetchView?.reloadRows(at: index)
            }
        }
    }
    
    func cancelDownloadingImage(forItemAtIndex index: Int) {
        cancelDownloadingImage(url: images[index].url)
    }
    
}
