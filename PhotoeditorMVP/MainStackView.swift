//
//  MainStackView.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 13.02.2021.
//

import UIKit

class MainStackView: UIStackView {
    var imageView: UIImageView!
    var buttonStack: UIStackView!
    var rotateButton: CustomButton!
    var bwButton: CustomButton!
    var mirrorButton: CustomButton!
    var imageCollection: CollectionView!
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fill
        self.spacing = 5
        
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
        self.imageCollection = imageCollection
    }
    
    func rotateImage() {
        self.imageView.transform = imageView!.transform.rotated(by: .pi/2)
    }
    
    func makeImageBW() {
        if let image = imageView.image {
            self.imageView.image = image.grayscaleImage()
        }
    }
    
    func mirrorImage() {
        if let image = imageView!.image {
            self.imageView.image = image.withHorizontallyFlippedOrientation()
        }
    }
    
    func clearImage() {
        self.imageView.image = nil
    }
    
    func setImage() {
        self.imageView.image = UIImage(named: "nice")
    }
    
    func saveImage() {
        //TODO: сохранять изображение в коллекшн вью
    }
}

extension UIImage {
    func grayscaleImage() -> UIImage {
        if let ciImage = CoreImage.CIImage(image: self, options: nil) {
            let paramsColor: [String : AnyObject] = [ kCIInputSaturationKey: NSNumber(value: 0.0) ]
            
            let grayscale = ciImage.applyingFilter("CIColorControls", parameters: paramsColor)
            
            if let processedCGImage = CIContext().createCGImage(grayscale, from: grayscale.extent) {
                return UIImage(cgImage: processedCGImage, scale: self.scale, orientation: self.imageOrientation)
            }
        }
        return UIImage()
    }
}

