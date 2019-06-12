//
//  AdminViewController.swift
//  Farah
//
//  Created by Tman on 5/10/19.
//  Copyright © 2019 Tman. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import SVProgressHUD

class AdminViewController: UIViewController {

    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var course: UITextField!
    @IBOutlet weak var timing: UITextField!
    @IBOutlet weak var addbutton: UIButton!
    @IBOutlet weak var teacherName: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addAction(_ sender: Any) {
        
        SVProgressHUD.show(withStatus: "Adding....", maskType: SVProgressHUDMaskType.clear)
        
//        guard let userID = Auth.auth().currentUser?.uid else { return }
        guard let courseNo = subject.text else { return }
        guard let course = course.text else { return }
        guard let teacherName = teacherName.text else { return }
        guard let timing = timing.text else { return }
//        if courseNo != nil||course != nil||teacherName !=nil || timing !=nil{
//
//            let data = ["courseNO": courseNo, "course": course, "teacherName": teacherName, "timing": timing] as [String : Any]
//
//            self.ref.child("AdminCourse").childByAutoId().setValue(data)
//
//            SVProgressHUD.dismiss();
//
//            let vc = storyboard?.instantiateViewController(withIdentifier: "CourseViewController") as! CourseViewController
//            self.navigationController?.pushViewController(
//                vc, animated: true)
//        }
        let data = ["courseNO": courseNo, "course": course, "teacherName": teacherName, "timing": timing] as [String : Any]
        
        self.ref.child("AdminCourse").childByAutoId().setValue(data)
        
        SVProgressHUD.dismiss();
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "CourseViewController") as! CourseViewController
        self.navigationController?.pushViewController(
            vc, animated: true)
    }
}
