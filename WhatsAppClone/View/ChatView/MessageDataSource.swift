//
//  MessageDataSource.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 24/11/24.
//

import Foundation
import MessageKit

extension ChatViewController: MessagesDataSource {
  func currentSender() -> any MessageKit.SenderType {
    return currentUser
    
  }
  
  func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> any MessageKit.MessageType {
    return mkMessages[indexPath.section]
  }
  
  func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
    return mkMessages.count
  }
  
  //    func currentSender() -> any MessageKit.SenderType {
  //        return currentUser
  //    }
  //
  //    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> any MessageKit.MessageType {
  //        return mkMessages[indexPath.section]
  //    }
  //
  //    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
  //        return mkMessages.count
  //    }
  //
      func textCell(for message: any MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UICollectionViewCell? {
          let cell = messagesCollectionView.dequeueReusableCell(CustomTextChatView.self, for: indexPath)
          cell.configure(with: mkMessages[indexPath.section], at: indexPath, and: messagesCollectionView)
          return cell
      }
  //
      func photoCell(for message: any MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UICollectionViewCell? {
          let cell = messagesCollectionView.dequeueReusableCell(CustomImageChatView.self, for: indexPath)
          cell.configure(with: message, at: indexPath, and: messagesCollectionView)
          return cell
      }
  //
      func audioCell(for message: any MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UICollectionViewCell? {
          let cell = messagesCollectionView.dequeueReusableCell(CustomVoiceChatView.self, for: indexPath)
          cell.configure(with: message, at: indexPath, and: messagesCollectionView)
          return cell
      }
}
