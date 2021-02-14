//
//  Presenter.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 13.02.2021.
//

import Foundation

protocol PresentEditorView {
    func rotateImage()
    func makeImageBW()
    func mirrorImage()
    func clearImage()
    func setImage()
    func saveImage()
}

protocol PresentSavedImagesView {
    func showImage()
    func deleteImage()
}

class Presenter {
    var editorView: PresentEditorView?
    
    init(editorView: PresentEditorView) {
        self.editorView = editorView
    }
    
    func rotateButtonTapped() {
        self.editorView?.rotateImage()
    }
    
    func bwButtonTapped() {
        self.editorView?.makeImageBW()
    }
    
    func mirrorImageButtonTapped() {
        self.editorView?.mirrorImage()
    }
    
    func clearImageButtonTapped() {
        self.editorView?.clearImage()
    }
    
    func setImageButtonTapped() {
        self.editorView?.setImage()
    }
    
    func saveImageButtonTapped() {
        self.editorView?.saveImage()
    }
    
}
