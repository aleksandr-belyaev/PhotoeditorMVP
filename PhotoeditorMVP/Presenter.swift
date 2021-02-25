//
//  Presenter.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 13.02.2021.
//

import Foundation

class Presenter {
    var mainView: MainViewProtocol
    var imageRedactor = ImageRedactor()
    var presentMethod: () -> Void
    var data: Model
    
    init(editorView: MainStackView, method: @escaping () -> Void) {
        self.mainView = editorView
        let data = Model()
        self.data = data
        self.presentMethod = method
        self.mainView.rotateImageButtonTapHandler = { [weak self] in
            self?.rotateImageButtonTapped()
        }
        self.mainView.bwImageButtonTapHandler = { [weak self] in
            self?.bwButtonTapped()
        }
        self.mainView.mirrorImageButtonTapHandler = { [weak self] in
            self?.mirrorImageButtonTapped()
        }
        self.mainView.showAlertHandler = { [weak self] in
            self?.showAlert()
        }
        let actions = [
            Actions(title: "Очистить", method: self.clearImageButtonTapped),
            Actions(title: "Поставить дефолтное", method: self.setImageButtonTapped),
            Actions(title: "Сохранить", method: self.saveImageButtonTapped)
        ]
        let alert = Alert(title: "Выберите действие", actions: actions)
        self.mainView.setAlertContent(alert: alert.alertController)
    }
    
    func rotateImageButtonTapped() {
        if let image = self.mainView.getImage() {
            self.mainView.setImage(newImage: image.rotateImage(radians: .pi/2))
        }
    }
    
    func bwButtonTapped() {
        if let image = self.mainView.getImage() {
            self.mainView.setImage(newImage: image.grayscaleImage())
        }
    }
    
    func mirrorImageButtonTapped() {
        if let image = self.mainView.getImage() {
            self.mainView.setImage(newImage: imageRedactor.mirrorImage(image: image))
        }
    }
    
    func showAlert() {
        self.presentMethod()
    }
    
    func clearImageButtonTapped() {
        self.mainView.setImage(newImage: nil)
    }
    
    func setImageButtonTapped() {
        self.mainView.setImage(newImage: imageRedactor.setDefaultImage())
    }
    
    func saveImageButtonTapped() {
        if let image = self.mainView.getImage() {
            data.savedImages.append(image)
            self.mainView.updateImageCollection(images: data.savedImages)
        }
    }
}
