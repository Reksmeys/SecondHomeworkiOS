//
//  ViewController.swift
//  ReksmeyHomeworkTwo
//
//  Created by Raksmey on 11/24/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
    @IBOutlet weak var numberTextField: UITextField!

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        numberTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        customTextField()

        
    }

    
    @IBAction func signUpButton(_ sender: UIButton) {
//        if usernameTextField.text != "" {
//            performSegue(withIdentifier: "data", sender: self)
//        }
       
    }
    func customTextField(){
        usernameTextField.borderStyle = .roundedRect
        passwordTextField.borderStyle = .roundedRect
        emailTextField.borderStyle = .roundedRect
        numberTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        
       
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if !isValidEmail(email: emailTextField.text!) {
            alert(title: "Invalid Email", message: "example@gmail.com")
            return false
        }
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondController = segue.destination as! SecondViewController
        secondController.myOutPut = (usernameTextField.text?.uppercased())!
    }
    @IBAction func unwindSegue(_ Sender: UIStoryboardSegue){
        usernameTextField.text = nil
        passwordTextField.text = nil
        numberTextField.leftView = nil
        numberTextField.text = nil
        myLabel.text = nil
        numberTextField.placeholder = "(+855) 097-444-5555"
        emailTextField.text = nil
 
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            numberTextField.becomeFirstResponder()
        case emailTextField:
            emailTextField.resignFirstResponder()
        default:
            break
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == numberTextField {
            
            myLabel.text = " (+855)"
            myLabel.font = UIFont.systemFont(ofSize: 20)
            numberTextField.leftViewMode = UITextFieldViewMode.always
            numberTextField.leftView = myLabel
            numberTextField.placeholder = "097-444-5555"
            
        }
        return true
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == numberTextField {
            //check ascii code  delete button
            let  char = string.cString(using: String.Encoding.utf8)!
            let isBackSpace = strcmp(char, "\\b")
            
            if !(isBackSpace == -92) {
                let phoneNumber = numberTextField.text?.count
                if phoneNumber == 3{
                    numberTextField.text = numberTextField.text! + "-"
                } else if phoneNumber == 7 {
                    numberTextField.text = numberTextField.text! + "-"
                } else if phoneNumber == 12 {
                    numberTextField.resignFirstResponder()
                }
            }
            
        }
        return true
    }
    func isValidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    func alert(title:String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }

 
   
}



