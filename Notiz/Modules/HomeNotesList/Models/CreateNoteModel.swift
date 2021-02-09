//
//  CreateNoteModel.swift
//  Notiz
//
//  Created by Ramy Sabry on 09/02/2021.
//

import Foundation


class CreateNoteModel: Codable {
    var note: String
    var creationDate: String
    
    init(note: String, creationDate: String) {
        self.note = note
        self.creationDate = creationDate
    }
}
