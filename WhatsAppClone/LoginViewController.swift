//
//  LoginViewController.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 13/11/24.
//

import UIKit

class LoginViewController: UIViewController{
  
  
  @IBOutlet weak var txtUsername: UITextField!
  
  @IBOutlet weak var txtPassword: UITextField!
  
  @IBOutlet weak var txtRepeatPassword: UITextField!
  
  @IBOutlet weak var btnForgotPassword: UIButton!
  
  @IBOutlet weak var btnLogin: UIButton!
  
  @IBOutlet weak var btnRegister: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  
  @IBAction func forgotPressed(_ sender: Any) {
    print("forgot Tapped")
  }
  
  @IBAction func loginPressed(_ sender: Any) {
    print("login Tapped")
  }
  
  @IBAction func registerPressed(_ sender: Any) {
    print("register Tapped")
  }
  
  
}
