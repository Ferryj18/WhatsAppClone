//
//  FirebaseRecentChatListener.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 22/11/24.
//

import Foundation

class FirebaseRecentChatListener {
  static let shared = FirebaseRecentChatListener()
  
  private init() {}
  
  func saveRecentChat(_ recentChat: RecentChat) {
    do {
      try FirebaseReference(.Recent).document(recentChat.id).setData(from: recentChat)
    } catch {
      print("Error save recent chat ", error.localizedDescription)
    }
  }
  // MARK: - Download Recent Chats
     func downloadRecentChatsFromFirestore(completion: @escaping (_ recentChats: [RecentChat]) -> Void) {
         FirebaseReference(.Recent).whereField(kSenderId, isEqualTo: User.currentID).addSnapshotListener { snapshot, error in
             var recentChats: [RecentChat] = []
             
             guard let documents = snapshot?.documents else {
                 print("No documents")
                 completion(recentChats)
                 return
             }
             
             let allRecentChats = documents.compactMap { document in
                 return try? document.data(as: RecentChat.self)
             }
             
             for recent in allRecentChats {
                 if !recent.lastMessage.isEmpty {
                     recentChats.append(recent)
                 }
             }
             
             completion(recentChats)
         }
     }
  func clearUnreadCounter(recentChat: RecentChat) {
          var newRecentChat = recentChat
          newRecentChat.unreadCounter = 0
          self.saveRecentChat(newRecentChat)
      }
  func delete(recentChat: RecentChat) {
        FirebaseReference(.Recent).document(recentChat.id).delete()
    }
}
  
