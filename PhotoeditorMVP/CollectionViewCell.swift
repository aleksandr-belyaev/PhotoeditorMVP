//
//  CollectionViewCell.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 14.02.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var cellImage: UIImageView!
    
    func cellDeleteImageAction() {
    }
    
    func cellSaveImageAction() {
    }
    
    func setImage(image: UIImage) {
        
        let imageView = UIImageView(frame: .zero)
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        
        self.cellImage = imageView
        self.addSubview(cellImage)
    }
}
