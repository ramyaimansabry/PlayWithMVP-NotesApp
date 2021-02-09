//
//  CreateNoteVCPresenter.swift
//  Notiz
//
//  Created by Ramy Sabry on 08/02/2021.
//

import Foundation


protocol CreateNoteVCView: BaseViewProtocol {
    func dismissView()
    func setDateLabel(to text: String)
    var delegate: CreateNoteDelegate? { get }
}

class CreateNoteVCPresenter {
    private weak var view: CreateNoteVCView?
    private let interactor = CreateNoteVCInteractor()
    private lazy var noteCreationDate: String = DateFormatterManager.getFormattedStringDateFromISOdate(dateOutputFormate: "MMM dd, yyyy - hh:mm a", outputType: .NormalStringDate)
    
    init(view: CreateNoteVCView) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.setDateLabel(to: noteCreationDate)
    }
    
    // MARK:- Saving Note
    func saveNoteActionFied(note: String) {
        view?.showLoadingIndicator()
        let createNewNoteModel = CreateNoteModel(note: note, creationDate: noteCreationDate)
        interactor.saveNewNote(with: createNewNoteModel) { [weak self] (error, newDocumentId) in
            
            guard let self = self else { return }
            self.view?.hideLoadingIndicator()
            if let error = error {
                self.view?.presentAlert(title: "Error", message: error)
            }
            else {
                if let newDocumentId = newDocumentId {
                    let newNoteModel = NoteModel(id: newDocumentId, note: note, creationDate: self.noteCreationDate)
                    self.view?.delegate?.onAddingNewNote(note: newNoteModel)
                }
                self.view?.dismissView()
            }
        }
    }
    
    // MARK:- Actions
    func backButtonActionFired() {
        view?.dismissView()
    }
}
