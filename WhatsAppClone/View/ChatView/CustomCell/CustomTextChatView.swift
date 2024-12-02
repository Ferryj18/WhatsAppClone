//
//  CustomTextChatView.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 26/11/24.
//

import Foundation
import MessageKit

class CustomTextChatView: MessageContentCell{
  
  @IBOutlet weak var vwLeftBubble: UIView!
  
  
  @IBOutlet weak var vwRightBubble: UIView!
  
  @IBOutlet weak var lblMessage: UILabel!
  
  @IBOutlet weak var lblInfo: UILabel!
  
  @IBOutlet weak var vwBubble: UIView!
  
  static let chatViewFont = UIFont.systemFont(ofSize: 14)
  static let chatViewInset = UIEdgeInsets(top: 12, left: 12, bottom: 32, right: 12)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUI()
  }
  private func setupUI() {
    let nib = UINib(nibName: "CustomTextChatView", bundle: nil)
    guard let contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
    
    contentView.frame = self.messageContainerView.bounds
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    self.messageContainerView.addSubview(contentView)
    
  }
  override func configure(with message: any MessageType, at indexPath: IndexPath, and messagesCollectionView: MessagesCollectionView) {
    guard let mkMessage = message as? MKMessage else { return }
    switch message.kind {
    case .text(let text):
      lblMessage.text = text
      lblInfo.text = self.getInfoText(mkMessage: mkMessage)
    default:
      break
    }
    
    if (messagesCollectionView.messagesDataSource?.isFromCurrentSender(message: message) ?? true) {
      // Outgoing message
      vwLeftBubble.isHidden = true
      vwRightBubble.isHidden = false
      vwBubble.backgroundColor = UIColor(named: "chat_outgoing")
      vwRightBubble.backgroundColor = UIColor(named: "chat_outgoing")
      vwLeftBubble.backgroundColor = UIColor(named: "chat_outgoing")
      lblMessage.textColor = UIColor.black
    } else {
      // incoming message
      vwLeftBubble.isHidden = false
      vwRightBubble.isHidden = true
      vwBubble.backgroundColor = UIColor(named: "chat_incoming")
      vwRightBubble.backgroundColor = UIColor(named: "chat_incoming")
      vwLeftBubble.backgroundColor = UIColor(named: "chat_incoming")
    }
  }
  private func getInfoText(mkMessage: MKMessage) -> String {
    if mkMessage.mkSender.senderId == User.currentID {
      if mkMessage.status == kSent {
        return "\(mkMessage.sentDate.time()) · Sent"
      }
      if mkMessage.status == kRead {
        return "\(mkMessage.readDate.time()) · Read"
      }
    }
    return mkMessage.readDate.time()
  }
}
