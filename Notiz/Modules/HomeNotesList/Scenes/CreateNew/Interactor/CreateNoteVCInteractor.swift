//
//  CreateNoteVCInteractor.swift
//  Notiz
//
//  Created by Ramy Sabry on 08/02/2021.
//

import Foundation
import Firebase


class CreateNoteVCInteractor {
    func saveNewNote(with createNoteObject: CreateNoteModel, completion: @escaping(_ error: String?, _ newDocumentId: String?) -> ()) {
        guard let userUid = Auth.auth().currentUser?.uid else {
            completion("Unexpected error happend, please call customer support", nil)
            return
        }
        guard let dateDic: [String: Any] = createNoteObject.dict else { return }
        let db = Firestore.firestore()
        let newDocument = db.collection("notes").document(userUid).collection("stringNotes").document()
        newDocument.setData(dateDic, merge: false) { (error) in
            
            if let error = error {
                completion(error.localizedDescription, nil)
            }
            else {
                completion(nil, newDocument.documentID)
            }
        }
    }
}
