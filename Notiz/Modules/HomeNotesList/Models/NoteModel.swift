//
//  NoteModel.swift
//  Notiz
//
//  Created by Ramy Sabry on 08/02/2021.
//

import Foundation
import FirebaseFirestoreSwift


class NoteModel: Codable {
    @DocumentID var id: String?
    var note: String
    var creationDate: String
    
    init(id: String?, note: String, creationDate: String) {
        self.note = note
        self.id = id
        self.creationDate = creationDate
    }
}



