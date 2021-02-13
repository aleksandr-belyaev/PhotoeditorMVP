//
//  MainStackView.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 13.02.2021.
//

import UIKit

class EditorStackView: UIStackView {
    var imageView: UIImageView?
    var rotateButton: CustomButton?
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fill
        self.spacing = 5
        
        self.imageView = configureImageView()
        self.rotateButton = CustomButton(withTitle: "Test")
        addArrangedSubview(self.imageView!)
        addArrangedSubview(self.rotateButton!)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func rotateImage() {
        self.imageView!.transform = imageView!.transform.rotated(by: .pi/2)
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
    
}
