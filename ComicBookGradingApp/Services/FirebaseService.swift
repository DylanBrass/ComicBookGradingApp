//
//  FirebaseService.swift
//  ComicBookGradingApp
//
//  Created by Dylan on 2023-12-09.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirestoreManager: NSObject {
    
    static let firestoreService = FirestoreManager()
    
    private override init(){}
    
    func createComic(comic: ComicToBeGraded) {
        let db = Firestore.firestore()

        do{
            try db.collection("Comics").document(comic.id).setData(from: comic)
        }catch{
            print("Error")
        }
    }
    
    func readComic(completion: @escaping ([ComicToBeGraded]?, Error?) -> Void) {
        let db = Firestore.firestore()
        var comicsArr: [ComicToBeGraded] = []

        db.collection("Comics").getDocuments { (snapshot, error) in
            if let error = error {
                completion(nil, error)
            } else if let snapshot = snapshot {
                for document in snapshot.documents {
                    do {
                        let comic = try document.data(as: ComicToBeGraded.self)
                        comicsArr.append(comic)
                    } catch {
                        completion(nil, error)
                    }
                }
                completion(comicsArr, nil)
            }
        }
    }
    
    func updateComic(id: String, comic: ComicToBeGraded, completion: @escaping (Error?) -> Void) {
        let db = Firestore.firestore()

        do {
            let data = try Firestore.Encoder().encode(comic) // Use Firestore.Encoder to convert the struct to a dictionary
            db.collection("Comics").document(id).updateData(data) { error in
                if let error = error {
                    completion(error)
                } else {
                    completion(nil)
                }
            }
        } catch {
            completion(error)
        }
    }

    func getComic(id: String, completion: @escaping (ComicToBeGraded?, Error?) -> Void) {
        let db = Firestore.firestore()

        db.collection("Comics").document(id).getDocument { (document, error) in
            if let error = error {
                completion(nil, error)
            } else if let document = document, document.exists {
                do {
                    let comic = try document.data(as: ComicToBeGraded.self)
                    completion(comic, nil)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, nil) // Document does not exist
            }
        }
    }

    func deleteComic(id: String, completion: @escaping (Error?) -> Void) {
        let db = Firestore.firestore()

        db.collection("Comics").document(id).delete { error in
            completion(error)
        }
    }


    
   
}
