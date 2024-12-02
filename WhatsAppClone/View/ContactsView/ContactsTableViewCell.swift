//
//  ContactsTableViewCell.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 21/11/24.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

  
  @IBOutlet weak var lblStatus: UILabel!
  @IBOutlet weak var lblUsername: UILabel!
  
  @IBOutlet weak var imgAvatarContacts: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  func configure(user: User) {
    lblUsername.text = user.username
    lblStatus.text = user.status
        setAvatar(avatar: user.avatar)
    }
    
    private func setAvatar(avatar: String) {
        guard avatar != "" else { return }
        
        FirebaseStorageHelper.downloadImage(url: avatar) { image in
          self.imgAvatarContacts.image = image?.circleMasked
        }
    }
}

