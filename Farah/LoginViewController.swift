//
//  ViewController.swift
//  Farah
//
//  Created by Tman on 5/8/19.
//  Copyright © 2019 Tman. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD

class LoginViewController: UIViewController {

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var registerButton: UIButton!
    
    class func fromStoryboard() -> LoginViewController {
        let viewController = UIStoryboard (name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as! LoginViewController
        return viewController
    }
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var ref: DatabaseReference!
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        
        guard validateAllFields() else {
            return
        }
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "CourseViewController") as! CourseViewController
        let adminVc = storyboard?.instantiateViewController(withIdentifier: "AdminViewController") as! AdminViewController
//        self.navigationController?.pushViewController(vc, animated:
//            true)
        SVProgressHUD.show(withStatus: "SignIn....", maskType: SVProgressHUDMaskType.clear)
        // Sign in user with Firebase
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            let userEmail = Auth.auth().currentUser?.email
            if user != nil{
                if email != "Admin@hct.ac"{
                
                    SVProgressHUD.dismiss(); self.navigationController?.pushViewController(vc, animated: true)
                    
                }else{
                    SVProgressHUD.dismiss(); self.navigationController?.pushViewController(adminVc, animated: true)
                }
            }
            else {
                
                SVProgressHUD.showError(withStatus: error?.localizedDescription)
//                let alert = UIAlertController(title: "Failed", message: "Incorrect Email or Password.", preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
            }
    
        }
    
    }
    
    @IBAction func registerAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(vc, animated:
            true)
    }
    
}

extension LoginViewController {
    
    func validateAllFields() -> Bool {
        let email = emailTextField.text?.trim()
        let password = passwordTextField.text?.trim()
        
        if email != nil, (email?.count)! <= 0 {
            
            let alert = UIAlertController(title: "Failed", message: "Please provide your email.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return false
        } else if password != nil, (password?.count)! <= 0 {
            
            let alert = UIAlertController(title: "Failed", message: "Please provide your password.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return false
        } else {
            return true
        }
    }
}
