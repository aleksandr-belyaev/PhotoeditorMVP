//
//  Presenter.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 13.02.2021.
//

import Foundation

class Presenter {
    var mainStackView: MainStackView
    var imageRedactor = ImageRedactor()
    var presentMethod: () -> Void
    var data: Model
    
    init(editorView: MainStackView, method: @escaping () -> Void) {
        self.mainStackView = editorView
        let data = Model()
        self.data = data
        self.presentMethod = method
        self.mainStackView.rotateImageButtonTapHandler = { [weak self] in
            self?.rotateImageButtonTapped()
        }
        self.mainStackView.bwImageButtonTapHandler = { [weak self] in
            self?.bwButtonTapped()
        }
        self.mainStackView.mirrorImageButtonTapHandler = { [weak self] in
            self?.mirrorImageButtonTapped()
        }
        self.mainStackView.showAlertHandler = { [weak self] in
            self?.showAlert()
        }
        self.mainStackView.clearImageHandler = { [weak self] in
            self?.clearImageButtonTapped()
        }
        self.mainStackView.setImageHandler = { [weak self] in
            self?.setImageButtonTapped()
        }
        self.mainStackView.saveImageHandler = { [weak self] in
            self?.saveImageButtonTapped()
        }
    }
    
    func rotateImageButtonTapped() {
        if let image = self.mainStackView.getImage() {
            self.mainStackView.setImage(newImage: image.rotateImage(radians: .pi/2))
        }
    }
    
    func bwButtonTapped() {
        if let image = self.mainStackView.getImage() {
            self.mainStackView.setImage(newImage: image.grayscaleImage())
        }
    }
    
    func mirrorImageButtonTapped() {
        if let image = self.mainStackView.getImage() {
            self.mainStackView.setImage(newImage: imageRedactor.mirrorImage(image: image))
        }
    }
    
    func showAlert() {
        self.presentMethod()
    }
    
    func clearImageButtonTapped() {
        self.mainStackView.setImage(newImage: nil)
    }
    
    func setImageButtonTapped() {
        self.mainStackView.setImage(newImage: imageRedactor.setDefaultImage())
    }
    
    func saveImageButtonTapped() {
        if let image = self.mainStackView.getImage() {
            data.savedImages.append(image)
            self.mainStackView.updateImageCollection(images: data.savedImages)
        }
    }
}
