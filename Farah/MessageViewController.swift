//
//  MessageViewController.swift
//  Farah
//
//  Created by Tman on 5/9/19.
//  Copyright © 2019 Tman. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    var courseNo = ""
    var course = ""
    var time = ""
    var teacher = ""
    
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet private weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentLabel.text = "You are receiving this email to confirm that you have a class with " + self.teacher + " , Expert for course " + self.courseNo + " " + self.course + " " + "at" + " " + self.time + "                                      Please confirm"
    }
    
    @IBAction func confirmAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ConfirmViewController") as! ConfirmViewController
        self.navigationController?.pushViewController(
            vc, animated: true)
    }
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
