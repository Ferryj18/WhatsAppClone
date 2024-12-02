//
//  AudioMessage.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 02/12/24.
//

import Foundation
import MessageKit

class AudioMessage: NSObject, AudioItem {
    var url: URL
    var duration: Float
    var size: CGSize
    
    init(duration: Float) {
        self.url = URL(fileURLWithPath: "")
        self.size = CGSize(width: 140, height: 32)
        self.duration = duration
    }
}
