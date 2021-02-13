//
//  ViewController.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 13.02.2021.
//

import UIKit

class ViewController: UIViewController, PresentEditorView {
    
    weak var sourceImageView: UIImageView!
    weak var rotateButton: CustomButton!
    lazy var presenter = Presenter(editorView: self)

    override func loadView() {
        super.loadView()
        
        let rotateButton = CustomButton(withTitle: "Повернуть")
        rotateButton.addTarget(self, action: #selector(rotateImageButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(rotateButton)
        
        NSLayoutConstraint.activate([
            rotateButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            rotateButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        ])
        
        self.rotateButton = rotateButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //PresentEditorView Protocols
    @objc func rotateImageButtonTapped(_ sender: UIButton) {
        presenter.rotateButtonTapped()
    }
    
    func rotateImage() {
        self.sourceImageView.transform = sourceImageView.transform.rotated(by: .pi/2)
    }


}

