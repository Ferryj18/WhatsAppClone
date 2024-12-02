//
//  LocalMessage.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 02/12/24.
//
import Foundation
import RealmSwift

class LocalMessage: Object, Codable {
    @objc dynamic var id = ""
    @objc dynamic var chatRoomId = ""
    @objc dynamic var date = Date()
    @objc dynamic var senderName = ""
    @objc dynamic var senderId = ""
    @objc dynamic var senderInitial = ""
    @objc dynamic var readDate = Date()
    @objc dynamic var type = ""
    @objc dynamic var status = ""
    @objc dynamic var message = ""
    @objc dynamic var photoUrl = ""
    @objc dynamic var videoUrl = ""
    @objc dynamic var audioUrl = ""
    @objc dynamic var audioDuration = 0.0
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
