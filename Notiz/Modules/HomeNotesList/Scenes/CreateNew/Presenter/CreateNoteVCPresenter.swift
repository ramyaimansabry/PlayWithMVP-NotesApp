//
//  CreateNoteVCPresenter.swift
//  Notiz
//
//  Created by Ramy Sabry on 08/02/2021.
//

import Foundation


protocol CreateNoteVCView: BaseViewProtocol {
    func dismissView()
    var delegate: CreateNoteDelegate? { get }
}

class CreateNoteVCPresenter {
    private weak var view: CreateNoteVCView?
    private let interactor = CreateNoteVCInteractor()
    
    init(view: CreateNoteVCView) {
        self.view = view
    }
    
    // MARK:- Saving Note
    func saveNoteActionFied(note: String) {
        view?.showLoadingIndicator()
        interactor.saveNewNote(note: note) { [weak self] (error) in
            
            guard let self = self else { return }
            self.view?.hideLoadingIndicator()
            if let error = error {
                self.view?.presentAlert(title: "Error", message: error)
            }
            else {
                self.view?.delegate?.onAddingNewNote(note: note)
                self.view?.dismissView()
            }
        }
    }
    
    // MARK:- Actions
    func backButtonActionFired() {
        view?.dismissView()
    }
}
