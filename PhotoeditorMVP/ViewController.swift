//
//  ViewController.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 13.02.2021.
//

import UIKit

class ViewController: UIViewController, PresentEditorView {
    
    weak var editorStackView: EditorStackView!
    lazy var presenter = Presenter(editorView: self)

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
        self.editorStackView.rotateButton?.addTarget(self, action: #selector(rotateImageButtonTapped), for: .touchUpInside)
        
    }
    
    //PresentEditorView Protocols
    @objc func rotateImageButtonTapped(_ sender: UIButton) {
        presenter.rotateButtonTapped()
    }
    
    func rotateImage() {
        self.editorStackView.rotateImage()
        
    }


}

