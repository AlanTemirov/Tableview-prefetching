//
//  ImageService.swift
//  PrefetchTableView
//
//  Created by Alan on 10/12/2019.
//  Copyright © 2019 Alan. All rights reserved.
//

import UIKit

protocol ImageServiceProtocol: class {
    func loadImage(url: URL, completion: @escaping (Data?, Error?) -> Void)
    func cancelDownloadingImage(url: URL)
}

final class ImageService: ImageServiceProtocol {
    private var imageTasks = [URLSessionTask]()
    
    func loadImage(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        guard imageTasks.firstIndex(where: { $0.originalRequest?.url == url }) == nil else {
            // Already downloading the image.
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async { 
                if let data = data {
                    completion(data, nil)
                } else {
                    completion(nil, error)
                }
            }
        }
        
        task.resume()
        imageTasks.append(task)
    }
    
    func cancelDownloadingImage(url: URL) {
        guard let taskIndex = imageTasks.firstIndex(where: { $0.originalRequest?.url == url }) else {
            return
        }
        let task = imageTasks[taskIndex]
        task.cancel()
        imageTasks.remove(at: taskIndex)
    }
    
}
