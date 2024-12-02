//
//  CustomImageChatView.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 28/11/24.
//

import Foundation
import MessageKit
class CustomImageChatView: MessageContentCell{
  
  
  @IBOutlet weak var lblLeftBubble: UIView!
  
  @IBOutlet weak var lblRightBubble: UIView!
  
  @IBOutlet weak var vwCustomChat: UIView!
  
  @IBOutlet weak var imgView: UIImageView!
  
  @IBOutlet weak var lblInfo: UILabel!
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUI()
  }
  private func setupUI() {
    let nib = UINib(nibName: "CustomImageChatView", bundle: nil)
    guard let contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
    
    contentView.frame = self.messageContainerView.bounds
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    self.messageContainerView.addSubview(contentView)
    
  }
  override func configure(with message: any MessageType, at indexPath: IndexPath, and messagesCollectionView: MessagesCollectionView) {
    delegate = messagesCollectionView.messageCellDelegate
    guard let mkMessage = message as? MKMessage else { return }
    switch message.kind {
    case .photo(let photo):
      // Set image
      imgView.image = photo.image
      lblInfo.text = self.getInfoText(mkMessage: mkMessage)
    default:
      break
    }
    
    if (messagesCollectionView.messagesDataSource?.isFromCurrentSender(message: message) ?? true) {
      // Outgoing message
      lblLeftBubble.isHidden = true
      lblRightBubble.isHidden = false
      vwCustomChat.backgroundColor = UIColor(named: "chat_outgoing")
      lblRightBubble.backgroundColor = UIColor(named: "chat_outgoing")
      lblLeftBubble.backgroundColor = UIColor(named: "chat_outgoing")
    } else {
      // incoming message
      lblLeftBubble.isHidden = false
      lblRightBubble.isHidden = true
      vwCustomChat.backgroundColor = UIColor(named: "chat_incoming")
      lblLeftBubble.backgroundColor = UIColor(named: "chat_incoming")
      lblRightBubble.backgroundColor = UIColor(named: "chat_incoming")
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
  override func handleTapGesture(_ gesture: UIGestureRecognizer) {
         delegate?.didTapImage(in: self)
     }
  
}
  open class CustomMediaMessageSizeCalculator: MediaMessageSizeCalculator {
      open override func messageContainerSize(for message: MessageType) -> CGSize {
          let maxWidth = messageContainerMaxWidth(for: message)
          let sizeForMediaItem = { (maxWidth: CGFloat, item: MediaItem) -> CGSize in
              let width = (item.image?.size.width ?? 10) > maxWidth - 42 ? maxWidth - 42 : (item.image?.size.width ?? 10)
            let height = (width / (item.image?.size.width ?? 10)) * (item.image?.size.height ?? 10)
              return CGSize(width: width + 24, height: height + 24 + 32)
          }
          
          switch message.kind {
          case .photo(let item):
              return sizeForMediaItem(maxWidth, item)
          default:
              fatalError("unhandled media size \(message.kind)")
          }
      }
  }
  
