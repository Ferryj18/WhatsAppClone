//
//  RecentChat.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 21/11/24.
//

import Foundation
import FirebaseFirestore

struct RecentChat: Codable {
    var id = ""
    var chatRoomId = ""
    var senderId = ""
    var senderName = ""
    var receiverID = ""
    var receiverName = ""
    @ServerTimestamp var date = Date()
    var lastMessage = ""
    var unreadCounter = 0
    var avatar = ""
}
