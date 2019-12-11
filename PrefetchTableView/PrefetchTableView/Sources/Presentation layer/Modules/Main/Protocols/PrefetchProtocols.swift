//
//  PrefetchProtocols.swift
//  PrefetchTableView
//
//  Created by Alan on 10/12/2019.
//  Copyright © 2019 Alan. All rights reserved.
//

import Foundation

// MARK: - View -

protocol PrefetchViewProtocol {
    var output: PrefetchViewOutput! { get }
}

protocol PrefetchViewInput: class {
    func reloadRows(at index: Int)
}

protocol PrefetchViewOutput {    
    func onDidLoad()
    
}

// MARK: - Presenter -

protocol PrefetchPresenterProtocol {
    func fetchImages()
}

// MARK: - Data provider -

protocol PrefetchDataSource {
    var imagesCount: Int { get }
    func image(at index: Int) -> ImageModel?
    func downloadImage(forItemAtIndex index: Int)
    func cancelDownloadingImage(forItemAtIndex index: Int)    
}

// MARK: - Interactor -

protocol PrefetchInteractorProtocol: class {
    var imageService: ImageServiceProtocol! { get }
    func loadImage(url: URL, completion: @escaping (Data?, Error?) -> Void)
    func cancelDownloadingImage(url: URL)
}

extension PrefetchInteractorProtocol {
    func loadImage(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        imageService.loadImage(url: url) { (data, error) in
            if let error = error {
                completion(nil, error)
            } else {
                completion(data, error)
            }
        }
    }
    
    func cancelDownloadingImage(url: URL) {
        imageService.cancelDownloadingImage(url: url)
    }
    
}
