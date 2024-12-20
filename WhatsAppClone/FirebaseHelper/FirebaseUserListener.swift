//
//  FirebaseUserListener.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 14/11/24.
//

import Foundation
import Firebase

class FirebaseUserListener{
  static let shared = FirebaseUserListener()
  
  private init() {}
  func loginUser(email: String, password: String, completion: @escaping (_ error: Error?, _ isEmailVerified: Bool) -> Void) {
    // Call firebase function for authentication (login)
    Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
      // check for error
      if let e = error {
        completion(e, false)
        return
      }
      
      // get the auth data result
      // safely check with guard
      guard let user = authDataResult?.user else {
        completion(NSError(), false)
        return
      }
      
      // Download user data
      FirebaseUserListener.shared.downloadUserFromFirestore(userId: user.uid, email: email)
      
      // Call completion
      completion(nil, user.isEmailVerified)
    }
    
  }
  func registerUserWith(email: String, password: String, completion: @escaping (_ error: Error?) -> Void) {
    // Call firebase function for authentication (register)
    Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
      // check for error
      if let e = error {
        completion(e)
        return
      }
      
      // get the auth data result
      // safely check with guard
      guard let user = authDataResult?.user else {
        completion(NSError())
        return
      }
      
      // Send email verification
      self.sendEmailVerificationTo(user)
      // Save user info to UserDefaults
      self.saveUser(email: email, uid: user.uid)
      
      completion(nil)
      
      
    }
  }
  func resetPassword(email: String, completion: @escaping (_ error: Error?) -> Void) {
    // Firebase Auth
    Auth.auth().sendPasswordReset(withEmail: email) { error in
      completion(error)
    }
  }
  private func sendEmailVerificationTo(_ user: FirebaseAuth.User) {
    user.sendEmailVerification { error in
      if let e = error {
        print("Error sending email verification: ", e.localizedDescription)
      } else {
        print("Success sent email verification")
      }
    }
  }
  private func saveUser(email: String, uid: String) {
    // Create object of User
    let user = User(id: uid, username: email, status: "Available", email: email, avatar: "", firstName: "", lastName: "")
    
    // Save user to UserDefaults
    saveUserLocally(user)
    
    // Save Firestore
    saveUserToFirestore(user)
  }
  func saveUserToFirestore(_ user: User) {
    do {
      try FirebaseReference(.User).document(user.id).setData(from: user)
    } catch {
      print("Error save user to firestore ", error.localizedDescription)
    }
  }
  
  // MARK: - Download
  func getUser(by userId: String, completion: @escaping (_ user: User?) -> Void) {
    FirebaseReference(.User).document(userId).getDocument { snapshot, error in
      
      guard let document = snapshot else {
        print("No document found")
        return
      }
      
      // Download data
      let result = Result {
        try? document.data(as: User.self)
      }
      
      switch result {
      case .success(let userObj):
        if let user = userObj {
          completion(user)
        } else {
          print("No User found")
          completion(nil)
        }
      case .failure(let error):
        completion(nil)
        print("Error encoding User data, ", error.localizedDescription)
      }
    }
  }
  func downloadUserFromFirestore(userId: String, email: String? = nil) {
    // Call firebase function to download user data
    FirebaseReference(.User).document(userId).getDocument { snapshot, error in
      
      guard let document = snapshot else {
        print("No document found")
        return
      }
      
      // Download data
      let result = Result {
        try? document.data(as: User.self)
      }
      
      switch result {
      case .success(let userObj):
        if let user = userObj {
          // Save user data to UserDefaults
          saveUserLocally(user)
        } else {
          print("No User found")
        }
      case .failure(let error):
        print("Error encoding User data, ", error.localizedDescription)
      }
    }
  }
  func downloadAllUsersFromFirestore(completion: @escaping (_ allUsers: [User]) -> Void) {
          var users: [User] = []
          
          FirebaseReference(.User).limit(to: kLimitDownload).getDocuments { snapshot, error in
              guard let document = snapshot?.documents else {
                  print("No documents in database")
                  return
              }
              
              let allUsers = document.compactMap { querySnapshot in
                  return try? querySnapshot.data(as: User.self)
              }
              
              for user in allUsers {
                  if User.currentID != user.id {
                      users.append(user)
                  }
              }
              completion(users)
          }
      }
  func downloadUsersFromFirestore(withIds: [String], completion: @escaping (_ allUsers: [User]) -> Void) {
          var users: [User] = []
          var count = 0
          
          for id in withIds {
              FirebaseReference(.User).document(id).getDocument { snapshot, error in
                  guard let document = snapshot else {
                      print("No document found")
                      return
                  }
                  
                  let user = try? document.data(as: User.self)
                  users.append(user!)
                  count += 1
                  
                  if count == withIds.count {
                      completion(users)
                  }
              }
          }
      }
  
  func logoutUser(completion: @escaping (_ error: Error?) -> Void) {
    do {
      updateUserPushId(pushId: "")
      
      try Auth.auth().signOut()
      UserDefaults.standard.removeObject(forKey: kCurrentUser)
      UserDefaults.standard.synchronize()
      completion(nil)
    } catch let error as NSError {
      completion(error)
    }
  }
  private func updateUserPushId(pushId: String) {
    if var user = User.currentUser {
      user.pushId = pushId
      saveUserLocally(user)
      FirebaseUserListener.shared.updateUserInFirebase(user)
    }
  }
  func updateUserInFirebase(_ user: User) {
    do {
      try FirebaseReference(.User).document(user.id).setData(from: user)
    } catch {
      print("Error update user ", error.localizedDescription)
    }
  }
}
