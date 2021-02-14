//
//  CollectionView.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 14.02.2021.
//

import UIKit

class CollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        
        register(CollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        backgroundColor = .red
        
        dataSource = self
        delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        myCell.backgroundColor = UIColor.blue
        return myCell
    }
    
}
