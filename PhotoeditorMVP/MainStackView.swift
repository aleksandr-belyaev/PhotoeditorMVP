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
    
    var imageView: UIImageView!
    var buttonStack: UIStackView!
    var rotateButton: CustomButton!
    var bwButton: CustomButton!
    var mirrorButton: CustomButton!
    var imageCollection: CollectionView!
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
        
        configAlert()
    }
    
    func configAlert() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        tapGesture.delegate = self
        self.imageView.addGestureRecognizer(tapGesture)
        let imageTapAlert = UIAlertController(title: "Выберите действие", message: nil, preferredStyle: .alert)
        self.imageTapAlert = imageTapAlert
        let clearImageAlertAction = UIAlertAction(title: "Очистить", style: .default) {
            (_) in
            self.clearImageHandler?()
        }
        let setImageAlertAction = UIAlertAction (title: "Поставить дефолтное", style: .default) {
            (_) in
            self.setImageHandler?()
        }
        let saveImageAlertAction = UIAlertAction (title: "Сохранить", style: .default) {
            (_) in
            self.saveImageHandler?()
        }
        
        imageTapAlert.addAction(clearImageAlertAction)
        imageTapAlert.addAction(setImageAlertAction)
        imageTapAlert.addAction(saveImageAlertAction)
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
}
