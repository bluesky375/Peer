//
//  InvoxViewController.swift
//  Farah
//
//  Created by Tman on 5/9/19.
//  Copyright © 2019 Tman. All rights reserved.
//

import UIKit
import Toast_Swift

class InvoxViewController: UIViewController {

    var courseNo = ""
    var course = ""
    var time = ""
    var teacher = ""
    
    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "MessageViewController") as! MessageViewController
        vc.courseNo = self.courseNo
        vc.course = self.course
        vc.time = self.time
        vc.teacher = self.teacher
        self.navigationController?.pushViewController(
            vc, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let alert = UIAlertController(title: nil, message: "Course Selected Successfully ", preferredStyle: .alert)
        //        alert.view.alpha = 0.5
        
        alert.view.layer.cornerRadius = 15
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            alert.dismiss(animated: true)
        }
        
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
