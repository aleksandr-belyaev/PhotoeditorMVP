//
//  Presenter.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 13.02.2021.
//

import Foundation

class Presenter {
    var mainStackView: MainStackView!
    var imageRedactor = ImageRedactor()
    var data: Model!
    
    init(editorView: MainStackView) {
        self.mainStackView = editorView
        let data = Model()
        self.data = data
    }
    
    func rotateImageButtonTapped() {
        if let image = self.mainStackView.imageView.image {
            self.mainStackView.imageView.image = image.rotateImage(radians: .pi/2)
        }
    }
    
    func bwButtonTapped() {
        if let image = self.mainStackView.imageView.image {
            self.mainStackView.imageView.image = image.grayscaleImage()
        }
    }
    
    func mirrorImageButtonTapped() {
        if let image = self.mainStackView.imageView.image {
            self.mainStackView.imageView.image = imageRedactor.mirrorImage(image: image)
        }
    }
    
    func clearImageButtonTapped() {
        self.mainStackView.imageView.image = nil
    }
    
    func setImageButtonTapped() {
        self.mainStackView.imageView.image = imageRedactor.setDefaultImage()
    }
    
    func saveImageButtonTapped() {
        if let image = self.mainStackView.imageView.image {
            data.savedImages.append(image)
            self.mainStackView.imageCollection.images = data.savedImages
            self.mainStackView.imageCollection.reloadData()
        }
    }
}
