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
  var viewModel: ProfileViewModel!
  
  
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
      
      
      viewModel.navigateToChatVC { chatVC in
        self.navigationController?.pushViewController(chatVC, animated: true)
      }
    }
  }
  private func setupUI() {
    lblusernameProfile.text = viewModel.userName
    lblStatusProfile.text = viewModel.status
        
                 viewModel.fetchAvatarImage { avatar in
                   self.imgAvatarProfile.image = avatar
      }
    }
  }
