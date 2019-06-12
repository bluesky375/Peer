//
//  TimingViewController.swift
//  Farah
//
//  Created by Tman on 5/8/19.
//  Copyright © 2019 Tman. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class TimingViewController: UIViewController {

    var ref: DatabaseReference!
    
    @IBOutlet private weak var mainbackButton: UIButton!
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var optoinButton: UIButton!
    @IBOutlet weak var timingLabel: UILabel!
    
    var courseNO = ""
    var course = ""
    var teacherName = ""
    var timing = ""
    var timingLbl = ""
    
//    var timeoption : String? = "from 12:00 to 1:30"
//    weak var delegate: CourseViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timingLabel.text = timingLbl
        ref = Database.database().reference()
        
//        optoinButton.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        
        optoinButton.layer.cornerRadius = 0.5 * optoinButton.bounds.size.width
        optoinButton.clipsToBounds = true
//        optoinButton.backgroundColor = .clear
        optoinButton.layer.borderWidth = 1
        optoinButton.layer.borderColor = UIColor.red.cgColor
//        optoinButton.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
////        view.addSubview(optoinButton)
        // Do any additional setup after loading the view.
//        timingLabel.text = self.timeoption
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func mainbackAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func nextAction(_ sender: Any) {
        
//        guard let userID = Auth.auth().currentUser?.uid else { return }
////        guard let courseNo = subject.text else { return }
////        guard let course = course.text else { return }
////        guard let teacherName = teacherName.text else { return }
//        let data = ["courseNO": courseNO, "course": course, "teacherName": teacherName, "timing": timing,"userid": userID] as [String : Any]
//
//        ref.child("CourseData").childByAutoId().setValue(data)
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "InvoxViewController") as! InvoxViewController
        vc.courseNo = self.courseNO
        vc.course = self.course
        vc.time = self.timingLbl
        vc.teacher = self.teacherName
        self.navigationController?.pushViewController(vc, animated:
            true)
    }
    
    @IBAction func optionAction(_ sender: Any) {
        
        optoinButton.setImage(UIImage(named:"mcountico.png"), for: .normal)
        
    }
}
