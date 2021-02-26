//
//  Presenter.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 13.02.2021.
//

import Foundation

class Presenter {
    private var mainView: MainViewProtocol
    private var imageRedactor = ImageRedactor()
    private var presentMethod: () -> Void
    private var data: Model
    
    init(editorView: MainViewProtocol, method: @escaping () -> Void) {
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
            Action(title: "Очистить", method: self.clearImageButtonTapped),
            Action(title: "Поставить дефолтное", method: self.setImageButtonTapped),
            Action(title: "Сохранить", method: self.saveImageButtonTapped)
        ]
        self.mainView.setAlertContent(alertActions: actions, alertTitle: "Выберите действие")
    }
    
    private func rotateImageButtonTapped() {
        if let image = self.mainView.getImage() {
            self.mainView.setImage(newImage: image.rotateImage(radians: .pi/2))
        }
    }
    
    private func bwButtonTapped() {
        if let image = self.mainView.getImage() {
            self.mainView.setImage(newImage: image.grayscaleImage())
        }
    }
    
    private func mirrorImageButtonTapped() {
        if let image = self.mainView.getImage() {
            self.mainView.setImage(newImage: imageRedactor.mirrorImage(image: image))
        }
    }
    
    private func showAlert() {
        self.presentMethod()
    }
    
    private func clearImageButtonTapped() {
        self.mainView.setImage(newImage: nil)
    }
    
    private func setImageButtonTapped() {
        self.mainView.setImage(newImage: imageRedactor.setDefaultImage())
    }
    
    private func saveImageButtonTapped() {
        if let image = self.mainView.getImage() {
            data.savedImages.append(image)
            self.mainView.updateImageCollection(images: data.savedImages)
        }
    }
}
