//
//  MainStackView.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 13.02.2021.
//

import UIKit

class MainStackView: UIStackView, UIGestureRecognizerDelegate {
    
    var rotateImageButtonTapHandler: (() -> Void)?
    var bwImageButtonTapHandler: (() -> Void)?
    var mirrorImageButtonTapHandler: (() -> Void)?
    var showAlertHandler: (() -> Void)?
    var clearImageHandler: (() -> Void)?
    var setImageHandler: (() -> Void)?
    var saveImageHandler: (() -> Void)?
    
    private var imageView: UIImageView!
    private var buttonStack: UIStackView!
    private var rotateButton: CustomButton!
    private var bwButton: CustomButton!
    private var mirrorButton: CustomButton!
    private var imageCollection: CollectionView!
    var imageTapAlert: UIAlertController!
    
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
        
        self.rotateButton.addTarget(self, action: #selector(rotateImageButtonTapped), for: .touchUpInside)
        self.bwButton.addTarget(self, action: #selector(bwImageButtonTapped), for: .touchUpInside)
        self.mirrorButton.addTarget(self, action: #selector(mirrorImageButtonTapped), for: .touchUpInside)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        tapGesture.delegate = self
        self.imageView.addGestureRecognizer(tapGesture)    }
    
    func setAlertContent(alert: UIAlertController) {
        self.imageTapAlert = alert
    }
    
    @objc func imageTapped(_ gesture: UIGestureRecognizer) {
        self.showAlertHandler?()
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
    
    @objc func rotateImageButtonTapped(_ sender: UIButton) {
        self.rotateImageButtonTapHandler?()
    }
    
    @objc func bwImageButtonTapped(_ sender: UIButton) {
        self.bwImageButtonTapHandler?()
    }
    
    @objc func mirrorImageButtonTapped(_ sender: UIButton) {
        self.mirrorImageButtonTapHandler?()
    }
    
    func setImage(newImage: UIImage?) {
        self.imageView.image = newImage
    }
    
    func getImage() -> UIImage? {
        return self.imageView.image
    }
    
    func updateImageCollection(images: [UIImage]) {
        self.imageCollection.images = images
        self.imageCollection.reloadData()
    }
}
