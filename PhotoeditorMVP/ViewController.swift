//
//  ViewController.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 13.02.2021.
//

import UIKit

class ViewController: UIViewController, PresentEditorView, UIGestureRecognizerDelegate {
    
    weak var mainStackView: MainStackView!
    lazy var presenter = Presenter(editorView: self)
    //TODO: возможно, стоит переделать на опционал
    var changeImageAlert = UIAlertController()
    var myCollectionView:UICollectionView?
    var data = Model()
    
    override func loadView() {
        super.loadView()
        let mainStackView = MainStackView()
        
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mainStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            mainStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
        self.mainStackView = mainStackView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainStackView.rotateButton.addTarget(self, action: #selector(rotateImageButtonTapped), for: .touchUpInside)
        self.mainStackView.bwButton.addTarget(self, action: #selector(bwImageButtonTapped), for: .touchUpInside)
        self.mainStackView.mirrorButton.addTarget(self, action: #selector(mirrorImageButtonTapped), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        tapGesture.delegate = self
        self.mainStackView.imageView.addGestureRecognizer(tapGesture)
        self.mainStackView.imageCollection.data = data
        self.mainStackView.imageCollection.reloadData()
    }
    
    @objc func rotateImageButtonTapped(_ sender: UIButton) {
        presenter.rotateButtonTapped()
    }
    
    @objc func bwImageButtonTapped(_ sender: UIButton) {
        presenter.bwButtonTapped()
    }
    
    @objc func mirrorImageButtonTapped(_ sender: UIButton) {
        presenter.mirrorImageButtonTapped()
    }
    
    @objc func imageTapped(_ gesture: UIGestureRecognizer) {
        changeImageAlert = UIAlertController(title: "Выберите действие", message: nil, preferredStyle: .alert)
        
        let clearImageAlertAction = UIAlertAction(title: "Очистить", style: .default) {
            (_) in
            self.presenter.clearImageButtonTapped()
        }
        let setImageAlertAction = UIAlertAction (title: "Поставить дефолтное", style: .default) {
            (_) in
            self.presenter.setImageButtonTapped()
        }
        let saveImageAlertAction = UIAlertAction (title: "wip Сохранить", style: .default) {
            (_) in
            self.presenter.saveImageButtonTapped()
        }
        
        changeImageAlert.addAction(clearImageAlertAction)
        changeImageAlert.addAction(setImageAlertAction)
        changeImageAlert.addAction(saveImageAlertAction)
        present(changeImageAlert, animated: true, completion: nil)
    }
    
    func rotateImage() {
        self.mainStackView.rotateImage()
    }
    
    func makeImageBW() {
        self.mainStackView.makeImageBW()
    }
    
    func mirrorImage() {
        self.mainStackView.mirrorImage()
    }
    
    func clearImage() {
        self.mainStackView.clearImage()
    }
    
    func setImage() {
        self.mainStackView.setImage()
    }
    
    func saveImage() {
        if let image = self.mainStackView.saveImage() {
            data.addImage(image: image)
            self.mainStackView.imageCollection.reloadData()
        }
    }
}
