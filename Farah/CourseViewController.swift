//
//  CourseViewController.swift
//  Farah
//
//  Created by Tman on 5/8/19.
//  Copyright © 2019 Tman. All rights reserved.
//

import UIKit
import iOSDropDown
import FirebaseDatabase

class CourseViewController: UIViewController {

    @IBOutlet private weak var subjectTextView: DropDown!
    @IBOutlet private weak var courseNumberTextField: UITextField!
    @IBOutlet private weak var courseNextButton: UIButton!
    @IBOutlet private weak var backButton: UIButton!
    
    var ref: DatabaseReference!
    
    var mycourse : [CourseData] = []
    
    var courses: [String] = []
    var teachers: [String] = []
    var courseNOs: [String] = []
    var timings: [String] = []
    var teacher = ""
    var time = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        ref.child("AdminCourse").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? [String: Any]
            
            self.mycourse = []
            if value != nil {
                for v in value! {
                    let course = CourseData(dict: v.value as! [String : Any])
                    self.mycourse.append(course)
                }
            }

            
            for p in self.mycourse {
                self.courses.append(p.course)
                self.teachers.append(p.teacherName)
                self.courseNOs.append(p.courseNO)
                self.timings.append(p.timing)
            }
            
            self.subjectTextView.optionArray = self.courses
            print(self.mycourse.count)
            
            self.subjectTextView.didSelect{(selectedText , index ,id) in
                self.subjectTextView.text = "Selected String: \(selectedText) \n index: \(index)"
                
                self.courseNumberTextField.text = self.courseNOs[index]
                self.time = self.timings[index]
                self.teacher = self.teachers[index]
            }
            self.subjectTextView.hideOptionsWhenSelect = true
            
        }) { (error) in
            print(error.localizedDescription)
        }
    
        subjectTextView.backgroundColor = .white
        subjectTextView.selectedRowColor = .cyan
        subjectTextView.rowBackgroundColor = .white
        subjectTextView.listHeight = 500
        subjectTextView.rowHeight = 50
        subjectTextView.hideOptionsWhenSelect = true

    }
    
    @IBAction func courseNextAction(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "TimingViewController") as! TimingViewController
        vc.course = self.subjectTextView.text!
        vc.courseNO = self.courseNumberTextField.text!
        vc.teacherName = self.teacher
        vc.timingLbl = self.time
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func dropdownAction(_ sender: Any) {
        subjectTextView.showList()  // To show the Drop Down Menu
        subjectTextView.hideList()
    }
    
}
