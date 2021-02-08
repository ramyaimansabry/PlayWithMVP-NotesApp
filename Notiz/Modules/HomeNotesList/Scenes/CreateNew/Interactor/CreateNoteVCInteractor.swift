//
//  CreateNoteVCInteractor.swift
//  Notiz
//
//  Created by Ramy Sabry on 08/02/2021.
//

import Foundation
import Firebase


class CreateNoteVCInteractor {
    func saveNewNote(note: String, completion: @escaping(_ error: String?) -> ()) {
        guard let userUid = Auth.auth().currentUser?.uid else {
            completion("Unexpected error happend, please call customer support")
            return
        }
        let db = Firestore.firestore()
        
        db.collection("notes").document(userUid).collection("stringNotes").addDocument(data: ["note": note]) { (error) in
            if let error = error {
                completion(error.localizedDescription)
            }
            else {
                completion(nil)
            }
        }
    }
}
