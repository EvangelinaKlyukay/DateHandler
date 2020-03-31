//
//  NetworkImage.swift
//  DateHandler
//
//  Created by Евангелина Клюкай on 30.03.2020.
//  Copyright © 2020 Евангелина Клюкай. All rights reserved.
//

import Foundation
import UIKit

class ImageManager {
    
    private var imageQueue = OperationQueue()
    private var imageCache = NSCache<AnyObject, UIImage>()
    
    func downloadImageWithUrl(imageUrl: String, cacheKey: String, completionBlock: @escaping (_ image: UIImage?)-> Void) {
        
        let downloadedImage = imageCache.object(forKey: cacheKey as AnyObject)
    
        if let img = downloadedImage {
            completionBlock(img)
            return;
        }
        
        let blockOperation = BlockOperation()
        
        blockOperation.addExecutionBlock({
            let url = URL(string: imageUrl)
            
            do {
                let data = try Data(contentsOf: url!)
                if let newImage = UIImage(data: data) {
                    self.imageCache.setObject(newImage, forKey: cacheKey as AnyObject)
                    self.runOnMainThread {
                        completionBlock(newImage)
                    }
                } else {
                    completionBlock(nil)
                }
            } catch {
                completionBlock(nil)
            }
        })
        
        self.imageQueue.addOperation(blockOperation)
        blockOperation.completionBlock = {
            print("Image downloaded \(cacheKey)")
        }
    }
}

extension ImageManager {
    fileprivate func runOnMainThread(block:@escaping ()->Void) {
        if Thread.isMainThread {
            block()
        } else {
            let mainQueue = OperationQueue.main
            mainQueue.addOperation({
                block()
            })
        }
    }
}
