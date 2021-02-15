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
    
    var cellImage: UIImageView!
    
    func cellDeleteImageAction() {
        delegate?.deleteImage(cell: self)
    }
    
    func cellSaveImageAction() {
        delegate?.saveImage(cell: self)
    }
    
    func setImage(image: UIImage) {
        
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "nice")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        
        self.cellImage = imageView
        self.addSubview(cellImage)
    }
}
