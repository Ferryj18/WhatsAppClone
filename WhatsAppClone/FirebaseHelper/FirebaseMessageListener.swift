//
//  FirebaseMessageListener.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 25/11/24.
//

import Foundation
import FirebaseFirestore

class FirebaseMessageListener {
  static let shared = FirebaseMessageListener()
  var newChatListener: ListenerRegistration!
  var updateChatListener: ListenerRegistration!
  
  private init() { }
  func listenForNewChat(_ documentId: String, collectionId: String, lastMessageDate: Date) {
          newChatListener = FirebaseReference(.Message).document(documentId).collection(collectionId).whereField(kDate, isGreaterThan: lastMessageDate).addSnapshotListener({ snapshot, error in
              guard let snapshot = snapshot else { return }
              
              for change in snapshot.documentChanges {
                  if change.type == .added {
                      let result = Result {
                          try? change.document.data(as: LocalMessage.self)
                      }
                      
                      switch result {
                      case .success(let message):
                          if let message = message {
                              if message.senderId != User.currentID {
                                  DBManager.shared.saveToRealm(message)
                              }
                          } else {
                              print("Message doesn't exist")
                          }
                      case .failure(let error):
                          print("Error decoding message: \(error.localizedDescription)")
                      }
                  }
              }
          })
      }
  func listenForReadStatus(_ documentId: String, collectionId: String, completion: @escaping (_ updatedMessage: LocalMessage) -> Void) {
          updateChatListener = FirebaseReference(.Message).document(documentId).collection(collectionId).addSnapshotListener({ snapshot, error in
              guard let snapshot = snapshot else { return }
              
              for change in snapshot.documentChanges {
                  if change.type == .modified {
                      let result = Result {
                          try? change.document.data(as: LocalMessage.self)
                      }
                      
                      switch result {
                      case .success(let message):
                          if let message = message {
                              completion(message)
                          } else {
                              print("Message doesn't exist")
                          }
                      case .failure(let error):
                          print("Error decoding message: \(error.localizedDescription)")
                      }
                  }
              }
          })
      }
  
  // MARK: Save, Update, Delete Message
  func saveMessage(_ message: LocalMessage, memberId: String) {
    do {
      try FirebaseReference(.Message).document(memberId).collection(message.chatRoomId).document(message.id).setData(from: message)
    } catch {
      print("Error when saving message to Firebase ", error.localizedDescription)
    }
  }
  
  func updateMessage(_ message: LocalMessage, memberIds: [String]) {
    let value = [kStatus : kRead, kReadDate : Date()] as [String : Any]
    
    for id in memberIds {
      FirebaseReference(.Message).document(id).collection(message.chatRoomId).document(message.id).updateData(value)
    }
  }
  // MARK: Fetch Old Message
     func fetchOldMessage(_ documentId: String, collectionId: String) {
         FirebaseReference(.Message).document(documentId).collection(collectionId).getDocuments { snapashot, error in
             guard let documents = snapashot?.documents else {
                 print("No documents found")
                 return
             }
             
             var messages = documents.compactMap { snapshot -> LocalMessage? in
                 return try? snapshot.data(as: LocalMessage.self)
             }
             
             messages.sort(by:  { $0.date < $1.date })
             
             for message in messages {
                 DBManager.shared.saveToRealm(message)
             }
         }
     }
 }
