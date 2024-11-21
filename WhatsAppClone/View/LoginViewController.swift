//
//  LoginViewController.swift
//  WhatsAppClone
//
//  Created by Ferry jati on 13/11/24.
//

import UIKit
import ProgressHUD

class LoginViewController: UIViewController{
  
  
  @IBOutlet weak var txtUsername: UITextField!
  
  @IBOutlet weak var txtPassword: UITextField!
  
  @IBOutlet weak var txtRepeatPassword: UITextField!
  
  @IBOutlet weak var btnForgotPassword: UIButton!
  
  @IBOutlet weak var btnLogin: UIButton!
  
  @IBOutlet weak var lblAccount: UILabel!
  @IBOutlet weak var btnRegister: UIButton!
  var isLogin: Bool = true
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI(isLogin: true)
  }
  
  
  @IBAction func forgotPressed(_ sender: Any) {
    forgotPassword()
    print("forgot Tapped")
  }
  
  @IBAction func loginPressed(_ sender: Any) {
    guard isValidForm(isLogin: isLogin)
           else { return ProgressHUD.failed("All fields are required") }
           isLogin ? login() : register()
  }
  
  @IBAction func registerPressed(_ sender: UIButton) {
    setupUI(isLogin: sender.titleLabel?.text == "Login")
    isLogin.toggle()
  }
  private func setupUI(isLogin: Bool) {
    txtRepeatPassword.isHidden = isLogin
    btnForgotPassword.isHidden = !isLogin
    btnLogin.setTitle(isLogin ? "Login" : "Register", for: .normal)
    lblAccount.text = isLogin ? "Don't have an account?" : "Have an account?"
    btnRegister.setTitle(isLogin ? "Register" : "Login", for: .normal)
     }
  private func isValidForm(isLogin: Bool) -> Bool {
         if (isLogin) {
           return txtUsername.text != "" && txtPassword.text != ""
         }
    return txtUsername.text != "" && txtPassword.text != "" && txtRepeatPassword.text != ""
     }
  private func login(){
    print(txtUsername.text ?? "")
    print(txtPassword.text ?? "")
    
    FirebaseUserListener.shared.loginUser(email: txtUsername.text!, password: txtPassword.text!) { error, isEmailVerified in
                if error == nil {
                  ProgressHUD.success("Login Success")
                    self.navigateToMainScreen()
//                                    if !isEmailVerified {
//                                        ProgressHUD.failed("Verify your email first")
//                                    } else {
//                                        ProgressHUD.success("Login Success")
//                                    }
                } else {
                    ProgressHUD.failed("Login error: " + error!.localizedDescription)
                }
            }
        }
  private func register(){
    
    if txtPassword.text! == txtRepeatPassword.text! {
      FirebaseUserListener.shared.registerUserWith(email: txtUsername.text!, password: txtPassword.text!) { error in
                   if error == nil {
                       ProgressHUD.success("Registration successful")
                   } else {
                       ProgressHUD.failed("Failed to register " + error!.localizedDescription)
                   }
               }
           } else {
               ProgressHUD.failed("Password doesn't match")
           }
  }
  private func forgotPassword(){
    FirebaseUserListener.shared.resetPassword(email: txtUsername.text!) { error in
              if error == nil {
                  ProgressHUD.success("Reset link sent to your email")
              } else {
                  ProgressHUD.failed("Reset password error: " + error!.localizedDescription)
              }
          }
     
  }
  private func navigateToMainScreen(){
    let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainView") as! UITabBarController
      
      mainView.modalPresentationStyle = .fullScreen
      self.present(mainView, animated: true, completion: nil)
  }
  
}
