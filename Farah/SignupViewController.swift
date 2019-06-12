//
//  SignupViewController.swift
//  Farah
//
//  Created by Tman on 5/8/19.
//  Copyright © 2019 Tman. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD

class SignupViewController: UIViewController {

    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signupButton: UIButton!
    @IBOutlet private weak var signupBackButton: UIButton!
    @IBOutlet private weak var confirmTextField: UITextField!
    
    var characters = ""
    var charactersArray: [Character] = []
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

    }
    
    @IBAction func signupAction(_ sender: Any) {
        
        guard validateAllFields() else {
            return
        }
        
        
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }

        let string : String = email
        var characters = Array(string)
        
        let string1: String = "hct.ac.ae"
        let characters1 = Array(string1)
        
        var index1 = 0

        for (index, character) in string.enumerated().reversed() {

            if character == "@" {
                    index1 = index + 1;
                    break
            }
            
            print(index1)
        
        }
        
        if (characters.count - index1) != characters1.count{
            
            let alert = UIAlertController(title: "Failed", message: "Incorrect Email.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            for i in 0...characters.count - index1 - 1 {
                if characters.count - index1 == characters1.count{
                    if characters[i + index1] == characters1[i] {
                        let key = 1
                        
                        SVProgressHUD.show(withStatus: "SignUP....", maskType: SVProgressHUDMaskType.clear)
                        
                        Auth.auth().createUser(withEmail: email, password: password){ (user, error) in
                            if error == nil {
                                
                                SVProgressHUD.dismiss();
                                
                                let data = ["email": email,"password": password,"key": key] as [String : Any]
                                print(user?.user.uid)
                                self.ref.child("users").child(user!.user.uid).setValue(data)
                                
                                
                                let alertController = UIAlertController(title: "Success", message: error?.localizedDescription, preferredStyle: .alert)
                                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                
                                alertController.addAction(defaultAction)
                                self.present(alertController, animated: true, completion: nil)
                            }
                            else{
                                
                                SVProgressHUD.showError(withStatus: error?.localizedDescription)
                                
                            }
                        }
                    }
                }
                else {
                    let alert = UIAlertController(title: "Failed", message: "Incorrect Email.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
            //
        }
        
        
        
    
    }
    
    
    @IBAction func signinBackAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension SignupViewController {
    
    func validateAllFields() -> Bool {

        let email = emailTextField.text?.trim()
//        let password = passwordTextField.text?.trim()
        
        if (email != nil), (email?.count)! <= 0 {
            let alert = UIAlertController(title: "Failed", message: "Incorrect Email.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            return false
        } else if Validations.isValidEmail(email!) == false {
            let alert = UIAlertController(title: "Failed", message: "Incorrect Email or Password.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        } else if passwordTextField.text != nil, passwordTextField.text?.isEmpty == true {
            let alert = UIAlertController(title: "Failed", message: "Incorrect Email or Password.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        } else if confirmTextField.text != nil, confirmTextField.text?.isEmpty == true {
            
            let alert = UIAlertController(title: "Failed", message: "Please confirm the entered password.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
            
        } else if passwordTextField.text != confirmTextField.text {
            
            let alert = UIAlertController(title: "Failed", message: "Password and confirm password didn't match.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
            
        } else {
            return true
        }
    }
}

