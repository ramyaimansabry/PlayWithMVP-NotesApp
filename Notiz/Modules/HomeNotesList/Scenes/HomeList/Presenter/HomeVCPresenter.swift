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
}

protocol NoteCellViewProtocol {
    func displayData(note: String)
}

class HomeVCPresenter {
    weak var view: HomeVCView?
    private let interactor = HomeVCInteractor()
    private var notes: [NoteModel] = [NoteModel(note: "First Note First Note First Note"), NoteModel(note: "First Note"), NoteModel(note: "First Note"), NoteModel(note: "First Note First Note First Note First Note First Note First Note First Note First Note"), NoteModel(note: "First Note")]
    
    init(view: HomeVCView) {
        self.view = view
    }
    
    func viewDidLoad() {
        fetchNotes()
    }
    
    private func fetchNotes() {
        
    }
    
    func newNoteCreated(note: String) {
        let noteObject: NoteModel = NoteModel(note: note)
        notes.insert(noteObject, at: 0)
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


