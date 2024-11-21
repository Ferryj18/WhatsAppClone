//
//  EditTableViewController.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 14/11/24.
//

import UIKit
import YPImagePicker

class EditTableViewController: UITableViewController {
  
  @IBOutlet weak var imgAvatarEdit: UIImageView!
  @IBOutlet weak var txtUsernameEdit: UITextField!
  @IBOutlet weak var lblStatusEdit: UILabel!
  var picker : YPImagePicker?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.tableHeaderView = UIView()
    tableView.tableHeaderView = UIView()
    imgAvatarEdit.layer.cornerRadius = imgAvatarEdit.frame.width / 2
    configureUsernameTextField()
    configureImagePicker()
    
    
    
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    fetchUserInfo()
    
  }
  
  @IBAction func btnEditPressed(_ sender: Any) {
    showPicker()
  }
  
  private func fetchUserInfo(){
    if let user = User.currentUser {
      txtUsernameEdit.text = user.username
      lblStatusEdit.text = user.status
      
      if user.avatar != "" {
        if let avatar = User.currentUser?.avatar{
          FirebaseStorageHelper.downloadImage(url: avatar){ image in
            self.imgAvatarEdit.image = image
          }
          
        }
        
      }
    }
  }
  private func configureUsernameTextField(){
    txtUsernameEdit.delegate = self
    txtUsernameEdit.clearButtonMode = .whileEditing
  }
  private func configureImagePicker(){
    var config = YPImagePickerConfiguration()
    config.showsPhotoFilters = false
    config.screens = [.library, .photo]
    config.library.maxNumberOfItems = 3
    
    picker = YPImagePicker(configuration: config)
    
  }
  private func showPicker(){
    guard let picker = picker else {return}
    picker.didFinishPicking { [unowned picker] items, canceled in
      if canceled{
        print("cancel choose image")
        
      }
      if let photo = items.singlePhoto {
        DispatchQueue.main.async{
          self.imgAvatarEdit.image = photo.image
          self.uploadImage(photo.image)
        }
        
      }
      picker.dismiss(animated: true, completion: nil)
    }
    present(picker, animated: true, completion: nil)
  }
  private func uploadImage(_ image: UIImage) {
    let directory = "Avatars/" + "_\(User.currentID)" + ".jpg"
    
    FirebaseStorageHelper.uploadImage(image, directory: directory) { imageLink in
      if var user = User.currentUser {
        user.avatar = imageLink ?? ""
        saveUserLocally(user)
        FirebaseUserListener.shared.saveUserToFirestore(user)
      }
    }
    FirebaseStorageHelper.saveFileToLocal(file: image.jpegData(compressionQuality: 1.0)! as NSData, fileName: User.currentID)
  }
  
  // MARK: - Table View Delegate
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
extension EditTableViewController: UITextFieldDelegate{
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtUsernameEdit {
          guard textField.text != "" else { return false }
          
          if var user = User.currentUser {
            user.username = textField.text!
            saveUserLocally(user)
            FirebaseUserListener.shared.saveUserToFirestore(user)
          }
        }
        
        textField.resignFirstResponder()
        return false
      }
    }
