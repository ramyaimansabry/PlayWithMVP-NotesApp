//
//  HomeVCInteractor.swift
//  Notiz
//
//  Created by Ramy Sabry on 08/02/2021.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


class HomeVCInteractor {
    func fetchNotes(completion: @escaping(_ error: String?,_ notes: [NoteModel]) -> ()) {
        guard let userUid = Auth.auth().currentUser?.uid else {
            completion("Unexpected error happend, please call customer support", [])
            return
        }
        let db = Firestore.firestore()
        db.collection("notes")
            .document(userUid)
            .collection("stringNotes")
            .getDocuments { (result, error) in
            
            if let error = error {
                completion(error.localizedDescription, [])
            }
            else {
                var notesArray = [NoteModel]()
                notesArray = result!.documents.compactMap({ (queryDocumentSnapshot) -> NoteModel? in
                    return try? queryDocumentSnapshot.data(as: NoteModel.self)
                })
                completion(nil, notesArray)
            }
        }
    }
    
    func deleteNote(with id: String, completion: @escaping(_ error: String?) -> ()) {
        guard let userUid = Auth.auth().currentUser?.uid else {
            completion("Unexpected error happend, please call customer support")
            return
        }
        let db = Firestore.firestore()
        db.collection("notes")
            .document(userUid)
            .collection("stringNotes")
            .document(id).delete { (error) in
                
                completion(error?.localizedDescription)
            }
    }
}
