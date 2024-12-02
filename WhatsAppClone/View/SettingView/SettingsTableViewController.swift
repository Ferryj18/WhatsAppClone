//
//  SettingsTableViewController.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 14/11/24.
//

import Foundation
import UIKit
import FirebaseAuth


class SettingsTableViewController: UITableViewController{
  //MARK: - IBOoutlets
  
  @IBOutlet weak var imgAvatar: UIImageView!
  
  @IBOutlet weak var lblUsername: UILabel!
  
  @IBOutlet weak var lblStatus: UILabel!
  // Mark: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    fetchUserInfo()
  }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    if indexPath.section == 0 && indexPath.row == 0 {
      performSegue(withIdentifier: "editProfileSeque", sender: self)
    }
  }
  
  @IBAction func btnTellAFriendPressed(_ sender: Any) {
    print("tell a friend")
  }
  
  @IBAction func btnLogOutPressed(_ sender: Any) {
    FirebaseUserListener.shared.logoutUser { error in
      if error == nil {
        let loginView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginView")
        
        DispatchQueue.main.async {
          loginView.modalPresentationStyle = .fullScreen
          self.present(loginView, animated: true, completion: nil)
        }
      }
    }
  }
  
  private func fetchUserInfo() {
    if let user = User.currentUser {
      lblUsername.text = user.username
      lblStatus.text = user.status
      
      if user.avatar != "" {
        if let avatar = User.currentUser?.avatar{
          FirebaseStorageHelper.downloadImage(url: avatar){ image in
            self.imgAvatar.image = image?.circleMasked
          }
          
        }
      }
    }
  }
}
