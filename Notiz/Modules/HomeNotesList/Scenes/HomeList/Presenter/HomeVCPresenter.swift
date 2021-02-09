//
//  HomeVCPresenter.swift
//  Notiz
//
//  Created by Ramy Sabry on 08/02/2021.
//

import Foundation


protocol HomeVCView: BaseViewProtocol {
    func presentCreateNewNoteScreen()
    func reloadListTableView()
    func changeEmptyNotesApperance(hidden: Bool)
}

protocol NoteCellViewProtocol {
    func displayData(note: String)
}

class HomeVCPresenter {
    weak var view: HomeVCView?
    private let interactor = HomeVCInteractor()
    private var notes = [NoteModel]()
    
    init(view: HomeVCView) {
        self.view = view
    }
    
    func viewDidLoad() {
        fetchNotes()
    }
    
    private func fetchNotes() {
        view?.showLoadingIndicator()
        interactor.fetchNotes { [weak self] (error, notes) in
            
            guard let self = self else { return }
            self.view?.hideLoadingIndicator()
            if let error = error {
                self.view?.presentAlert(title: "Error", message: error)
            }
            else {
                self.notes.append(contentsOf: notes)
                self.view?.reloadListTableView()
                self.checkNotesCount()
            }
        }
    }
    
    func newNoteCreated(note: NoteModel) {
        notes.insert(note, at: 0)
        view?.reloadListTableView()
        checkNotesCount()
    }
    
    func deleteNote(with indexPath: IndexPath) {
        let note = notes[indexPath.row]
        if let noteId: String = note.id {
            view?.showLoadingIndicator()
            interactor.deleteNote(with: noteId) { [weak self] (error) in
                
                guard let self = self else { return }
                self.view?.hideLoadingIndicator()
                if let error = error {
                    self.view?.presentAlert(title: "Error", message: error)
                }
                else {
                    self.notes.remove(at: indexPath.row)
                    self.view?.reloadListTableView()
                    self.checkNotesCount()
                }
            }
        }
    }
    
    private func checkNotesCount() {
        let isEmptyNotes: Bool = (notes.count != 0)
        view?.changeEmptyNotesApperance(hidden: isEmptyNotes)
    }
    
    func getNotesCount() -> Int {
        notes.count
    }
    
    func cellConfingure(_ cell: NoteCellViewProtocol, for indexPath: IndexPath) {
        let noteObject: NoteModel = notes[indexPath.row]
        cell.displayData(note: noteObject.note)
    }
    
    func createNewNoteButtonActionFired() {
        view?.presentCreateNewNoteScreen()
    }
}


