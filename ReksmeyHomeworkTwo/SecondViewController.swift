//
//  SecondViewController.swift
//  ReksmeyHomeworkTwo
//
//  Created by Raksmey on 11/24/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var outPutTextField: UILabel!
    var myOutPut = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outPutTextField.text = "Welcome \(myOutPut), your account have been created"
        outPutTextField.textColor = UIColor.blue
        outPutTextField.font = UIFont.boldSystemFont(ofSize: 35.0)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
