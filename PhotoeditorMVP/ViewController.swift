//
//  ViewController.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 13.02.2021.
//

import UIKit

class ViewController: UIViewController, PresentEditorView, UIGestureRecognizerDelegate {
    
    weak var editorStackView: EditorStackView!
    lazy var presenter = Presenter(editorView: self)
    //TODO: возможно, стоит переделать на опционал
    var changeImageAlert = UIAlertController()
    
    override func loadView() {
        super.loadView()
        
        let editorStackView = EditorStackView()
        
        self.view.addSubview(editorStackView)
        
        NSLayoutConstraint.activate([
            editorStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            editorStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            editorStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
        
        self.editorStackView = editorStackView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.editorStackView.rotateButton.addTarget(self, action: #selector(rotateImageButtonTapped), for: .touchUpInside)
        self.editorStackView.bwButton.addTarget(self, action: #selector(bwImageButtonTapped), for: .touchUpInside)
        self.editorStackView.mirrorButton.addTarget(self, action: #selector(mirrorImageButtonTapped), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        tapGesture.delegate = self
        //TODO: Понять, почему нельзя назначить жест самому imageView. Возможно, так нельзя потому, что он не объявлен в самом VC и если бы я назначал жест во вьюхе, то было бы ок.
        self.editorStackView.addGestureRecognizer(tapGesture)
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
        let saveImageAlertAction = UIAlertAction (title: "Сохранить", style: .default) {
            (_) in
            self.presenter.saveImageButtonTapped()
        }
        
        changeImageAlert.addAction(clearImageAlertAction)
        changeImageAlert.addAction(setImageAlertAction)
        changeImageAlert.addAction(saveImageAlertAction)
        present(changeImageAlert, animated: true, completion: nil)
    }
    
    func rotateImage() {
        self.editorStackView.rotateImage()
    }
    
    func makeImageBW() {
        self.editorStackView.makeImageBW()
    }
    
    func mirrorImage() {
        self.editorStackView.mirrorImage()
    }
    
    func clearImage() {
        self.editorStackView.clearImage()
    }
    
    func setImage() {
        self.editorStackView.setImage()
    }
    
    func saveImage() {
        self.editorStackView.saveImage()
    }
}

