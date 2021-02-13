//
//  Presenter.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 13.02.2021.
//

import Foundation

protocol PresentEditorView {
//    func openImage()
//    func saveImage()
//    func clearImage()
    func rotateImage()
//    func makeImageBW()
//    func mirrorImage()
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
    
}
