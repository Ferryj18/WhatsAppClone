//
//  MKsender.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 24/11/24.
//

import Foundation
import MessageKit

struct MKSender: SenderType, Equatable {
    var senderId: String
    var displayName: String
}
class MKMessage: NSObject, MessageType {
    var messageId: String
    var kind: MessageKind
    var sentDate: Date
    var mkSender: MKSender
    var sender: SenderType { return mkSender }
    var senderInitial: String
    
    var status: String
    var readDate: Date
    var isIncoming: Bool
    
    var photoItem: PhotoMessage?
    var audioItem: AudioMessage?
    
    init(message: LocalMessage) {
        self.messageId = message.id
        self.kind = MessageKind.text(message.message)
        self.sentDate = message.date
        self.mkSender = MKSender(senderId: message.senderId, displayName: message.senderName)
        self.senderInitial = message.senderInitial
        self.status = message.status
        self.readDate = message.readDate
        self.isIncoming = User.currentID != mkSender.senderId
        
        switch message.type {
        case kText:
            self.kind = MessageKind.text(message.message)
        case kPhoto:
            let photoItem = PhotoMessage(path: message.photoUrl)
            self.kind = MessageKind.photo(photoItem)
            self.photoItem = photoItem
        case kAudio:
            let audioItem = AudioMessage(duration: Float(message.audioDuration))
            self.kind = MessageKind.audio(audioItem)
            self.audioItem = audioItem
        default:
            self.kind = MessageKind.text(message.message)
        }
    }
}
    
//    init(message: LocalMessage) {
//        self.messageId = message.id
//        self.kind = MessageKind.text(message.message)
//        self.sentDate = message.date
//        self.mkSender = MKSender(senderId: message.senderId, displayName: message.senderName)
//        self.senderInitial = message.senderInitial
//        self.status = message.status
//        self.readDate = message.readDate
//        self.isIncoming = User.currentID != mkSender.senderId
//        
//        switch message.type {
//        case kText:
//            self.kind = MessageKind.text(message.message)
//        case kPhoto:
//            let photoItem = PhotoMessage(path: message.photoUrl)
//            self.kind = MessageKind.photo(photoItem)
//            self.photoItem = photoItem
//        case kAudio:
//            let audioItem = AudioMessage(duration: Float(message.audioDuration))
//            self.kind = MessageKind.audio(audioItem)
//            self.audioItem = audioItem
//        default:
//            self.kind = MessageKind.text(message.message)
//        }
//    }
//}
