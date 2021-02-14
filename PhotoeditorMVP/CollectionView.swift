//
//  CollectionView.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 14.02.2021.
//

import UIKit

class CollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    let data = Model()
    
    init() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.register(CollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        self.backgroundColor = .none
        self.dataSource = self
        self.delegate = self
        self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5//data.savedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CollectionViewCell
        
        let image = UIImage(named: "hate")!//data.savedImages[indexPath.row].image
        cell.setImage(image: image)
        cell.backgroundColor = .black
        return cell
    }
    
}
