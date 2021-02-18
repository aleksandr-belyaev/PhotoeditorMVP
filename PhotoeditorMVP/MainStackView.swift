//
//  MainStackView.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 13.02.2021.
//

import UIKit

class MainStackView: UIStackView  {
    
    var imageView: UIImageView!
    var buttonStack: UIStackView!
    var rotateButton: CustomButton!
    var bwButton: CustomButton!
    var mirrorButton: CustomButton!
    var imageCollection: CollectionView!
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .fill
        distribution = .fill
        spacing = 5
        
        configureImageView()
        configureButtonsStack()
        configureImageCollectionView()
        
        addArrangedSubview(self.imageView)
        addArrangedSubview(self.buttonStack)
        addArrangedSubview(self.imageCollection)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "nice")
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        self.imageView = imageView
    }
    
    func configureButtonsStack() {
        let buttonStack = UIStackView(frame: .zero)
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.axis = .horizontal
        buttonStack.alignment = .fill
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 2
        
        let rotateButton = CustomButton(withTitle: "Повернуть")
        let bwButton = CustomButton(withTitle: "ЧБ")
        let mirrorButton = CustomButton(withTitle: "Отзеркалить")
        buttonStack.addArrangedSubview(rotateButton)
        buttonStack.addArrangedSubview(bwButton)
        buttonStack.addArrangedSubview(mirrorButton)
        
        self.buttonStack = buttonStack
        self.rotateButton = rotateButton
        self.bwButton = bwButton
        self.mirrorButton = mirrorButton
    }
    
    func configureImageCollectionView() {
        let imageCollection = CollectionView()
        imageCollection.translatesAutoresizingMaskIntoConstraints = false
        imageCollection.layoutIfNeeded()
        self.imageCollection = imageCollection
    }
}
