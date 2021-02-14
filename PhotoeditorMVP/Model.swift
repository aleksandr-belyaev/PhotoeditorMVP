//
//  Model.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 14.02.2021.
//

import Foundation
import UIKit

class Item {
    var image: UIImage
    
    init(image: UIImage) {
        self.image = image
    }
}

class Model {
    
    var savedImages: [Item] = [
        Item(image: UIImage(named: "nice")!),
        Item(image: UIImage(named: "hate")!)
    ]
    
    func addImage() {
        
    }
    
    func removeImage(at index: Int) {
        
    }
    
    func saveImage() {
        
    }
}
