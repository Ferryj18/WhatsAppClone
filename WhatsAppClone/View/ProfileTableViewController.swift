//
//  ProfileTableViewController.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 21/11/24.
//

import UIKit

class ProfileTableViewController: UITableViewController {
  
  @IBOutlet weak var imgAvatarProfile: UIImageView!
  
  @IBOutlet weak var lblusernameProfile: UILabel!
  
  
  @IBOutlet weak var lblStatusProfile: UILabel!
  //  mark var
  var user: User?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.separatorStyle = .none
    navigationItem.largeTitleDisplayMode = .never
    tableView.tableHeaderView = UIView()
    tableView.tableFooterView = UIView()
    tableView.separatorStyle = .none
    setupUI()
  }
  
  // MARK: - Table view data source
  
  // MARK: - Table view Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Navigate to chat screen
        if indexPath.section == 1 {
          guard let currentUser = User.currentUser else {return}
          guard let user = user else {return}
          print("navigate to screen")
          let chatRoomid = StartChatHelper.shared.startChat(user1: User.currentUser!, user2: user)
//            viewModel.navigateToChatVC { chatVC in
//                self.navigationController?.pushViewController(chatVC, animated: true)
            }
        }
  private func setupUI() {
    imgAvatarProfile.layer.cornerRadius = imgAvatarProfile.frame.width / 2
    guard let user = self.user else {return }
    lblusernameProfile.text = user.username
    lblStatusProfile.text = user.status
    if user.avatar != "" {
      FirebaseStorageHelper.downloadImage(url: user.avatar) { image in
        self.imgAvatarProfile.image = image
        
        
        //         viewModel.fetchAvatarImage { avatar in
        //             self.avatarImageView.image = avatar
      }
    }
  }
}
