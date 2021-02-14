//
//  ViewController.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 13.02.2021.
//

import UIKit

class ViewController: UIViewController, PresentEditorView, UIGestureRecognizerDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    weak var mainStackView: MainStackView!
    lazy var presenter = Presenter(editorView: self)
    //TODO: возможно, стоит переделать на опционал
    var changeImageAlert = UIAlertController()
    var myCollectionView:UICollectionView?
    
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
        //TODO: Понять, почему нельзя назначить жест самому imageView. Возможно, так нельзя потому, что он не объявлен в самом VC и если бы я назначал жест во вьюхе, то было бы ок.
        self.mainStackView.addGestureRecognizer(tapGesture)
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
        self.mainStackView.saveImage()
    }
}

extension ViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9 // How many cells to display
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        myCell.backgroundColor = UIColor.blue
        return myCell
    }
}
extension ViewController {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row)")
    }
}

