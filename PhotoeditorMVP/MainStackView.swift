//
//  MainStackView.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 13.02.2021.
//

import UIKit

class EditorStackView: UIStackView {
    var imageView: UIImageView?
    var buttonStack: UIStackView?
    var rotateButton: CustomButton?
    var bwButton: CustomButton?
    var mirrorButton: CustomButton?
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fill
        self.spacing = 5
        
        self.imageView = configureImageView()
        self.buttonStack = configureButtonsStack()
        
        let rotateButton = CustomButton(withTitle: "Повернуть")
        let bwButton = CustomButton(withTitle: "ЧБ")
        let mirrorButton = CustomButton(withTitle: "Отзеркалить")
        
        self.rotateButton = rotateButton
        self.bwButton = bwButton
        self.mirrorButton = mirrorButton
        
        addArrangedSubview(self.imageView!)
        addArrangedSubview(self.buttonStack!)
        self.buttonStack!.addArrangedSubview(rotateButton)
        self.buttonStack!.addArrangedSubview(bwButton)
        self.buttonStack!.addArrangedSubview(mirrorButton)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() -> UIImageView {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "nice")
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        
        return imageView
    }
    
    func configureButtonsStack() -> UIStackView {
        let buttonStack = UIStackView(frame: .zero)
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.axis = .horizontal
        buttonStack.alignment = .fill
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 2
        
        return buttonStack
    }
    
    func rotateImage() {
        self.imageView!.transform = imageView!.transform.rotated(by: .pi/2)
    }
    
    func makeImageBW() {
        if let image = imageView!.image {
            self.imageView!.image = image.grayscaleImage()
        }
    }
    
    func mirrorImage() {
        if let image = imageView!.image {
            self.imageView!.image = image.withHorizontallyFlippedOrientation()
        }
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

