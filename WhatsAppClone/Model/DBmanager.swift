//
//  DBmanager.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 24/11/24.
//

import Foundation
import RealmSwift

class DBManager {
    static let shared = DBManager()
    let realm = try! Realm()
    
    private init() { }
    
    func saveToRealm<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object, update: .all)
            }
        } catch {
            print("Error while saving object to Realm ", error.localizedDescription)
        }
    }
}
