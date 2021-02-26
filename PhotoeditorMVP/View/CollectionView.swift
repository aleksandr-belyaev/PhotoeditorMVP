//
//  CollectionView.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 14.02.2021.
//

import UIKit

class CollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    var images: [UIImage]?
    
    init() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.register(CollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        self.backgroundColor = .none
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if images != nil {
            return images!.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CollectionViewCell
        if let image = images?[indexPath.row] {
            cell.setImage(image: image)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }
    
}


