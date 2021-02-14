//
//  CollectionViewCell.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 14.02.2021.
//

import UIKit

protocol CellDelegate {
    func deleteImage(cell: CollectionViewCell)
    func saveImage(cell: CollectionViewCell)
}

class CollectionViewCell: UICollectionViewCell {
    var delegate: CellDelegate?
    
    var cellImage: UIImage!
    
    func cellDeleteImageAction() {
        delegate?.deleteImage(cell: self)
    }
    
    func cellSaveImageAction() {
        delegate?.saveImage(cell: self)
    }
    
    func setImage(image: UIImage) {
        self.cellImage = image
    }
}
