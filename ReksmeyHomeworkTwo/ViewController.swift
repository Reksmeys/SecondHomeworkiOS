//
//  ViewController.swift
//  ReksmeyHomeworkTwo
//
//  Created by Raksmey on 11/24/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    
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
        if usernameTextField.text != "" {
            performSegue(withIdentifier: "data", sender: self)
        }
    }
    func customTextField(){
        usernameTextField.borderStyle = .roundedRect
        passwordTextField.borderStyle = .roundedRect
        emailTextField.borderStyle = .roundedRect
        numberTextField.borderStyle = .roundedRect
       
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondController = segue.destination as! SecondViewController
        secondController.myOutPut = usernameTextField.text!
    }
    @IBAction func unwindSegue(_ Sender: UIStoryboardSegue){
        
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
            let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
            myLabel.text = " (+855)"
            myLabel.font = UIFont.systemFont(ofSize: 20)
            numberTextField.leftViewMode = UITextFieldViewMode.always
            numberTextField.leftView = myLabel
            numberTextField.placeholder = "097-444-5555"
        }
        return true
        
    }

    
}

