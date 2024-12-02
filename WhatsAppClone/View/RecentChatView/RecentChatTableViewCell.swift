//
//  RecentChatTableViewCell.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 21/11/24.
//

import UIKit

class RecentChatTableViewCell: UITableViewCell {
  
  @IBOutlet weak var imgAvatarRecentChat: UIImageView!
  @IBOutlet weak var lblUsernamRecentChat: UILabel!
  @IBOutlet weak var lblMessageRecent: UILabel!
  @IBOutlet weak var lblDate: UILabel!
  @IBOutlet weak var lblUnreadCounter: UILabel!
  @IBOutlet weak var vwUnreadCounter: UIView!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
 
    vwUnreadCounter.layer.cornerRadius = vwUnreadCounter.frame.width / 2
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  func configure(recent: RecentChat) {
    lblUsernamRecentChat.text = recent.receiverName
    lblUsernamRecentChat.adjustsFontSizeToFitWidth = true
    lblUsernamRecentChat.minimumScaleFactor = 0.5
    
    lblMessageRecent.text = recent.lastMessage
    lblMessageRecent.adjustsFontSizeToFitWidth = true
    lblMessageRecent.numberOfLines = 2
    lblMessageRecent.minimumScaleFactor = 0.9
    
    if recent.unreadCounter != 0{
      print("Unread Counter: \(recent.unreadCounter)")

      self.lblUnreadCounter.text = "\(recent.unreadCounter)"
      self.vwUnreadCounter.isHidden = false
    }else{
      self.vwUnreadCounter.isHidden = true
    }
    setAvatar(avatar: recent.avatar)
          if let date = recent.date {
          lblDate.isHidden = false
          lblDate.text = timeElapsed(date: date)
//            lblDate.layoutIfNeeded()
//            lblDate.textColor = .red
//            lblDate.text = "Test Teks"

          } else {
            lblDate.isHidden = true
          }
    lblDate.adjustsFontSizeToFitWidth = false
  }
  private func setAvatar(avatar: String){
    guard avatar != "" else { return }
    
    FirebaseStorageHelper.downloadImage(url: avatar) { image in
      self.imgAvatarRecentChat.image = image?.circleMasked
    }
  }
}
