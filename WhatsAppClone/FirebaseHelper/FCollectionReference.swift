//
//  FCollectionReference.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 14/11/24.
//

import Foundation
import Firebase


enum FCollectionReference: String{
  case User
  case Recent
  case Message
  case Typing
}
func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
  return Firestore.firestore().collection(collectionReference.rawValue)
}
