//
//  FIRFirestoreService.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 4/18/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class FIRFirestoreService {
    
    
    private init() {}
    static let shared = FIRFirestoreService()
    
    func configure() {
        FirebaseApp.configure()
        
    }
    
    public func reference(to collectionReference:FIRCollectionReference) -> CollectionReference{
        return Firestore.firestore().collection(collectionReference.rawValue)
    }
    
    let userID = Auth.auth().currentUser!.uid
    
    public func getUserID() -> String{
        
        let auth = Auth.auth().currentUser
        
        return auth!.uid
    }
    
    public func getUserName() -> String{
        
        let auth = Auth.auth().currentUser
        
        return auth!.displayName!
    }
    
    public func getUserEmail() -> String{
        
        let auth = Auth.auth().currentUser
        
        return auth!.email!
    }
    
    
    
    
    
    
    
    
    
}
