//
//  User.swift
//  Yala
//
//  Created by Ankita on 03/08/18.
//  Copyright © 2018 Yala. All rights reserved.
//

import Foundation

class CourseData:NSObject{
    
    var course = ""
    var courseNO = ""
    var teacherName = ""
    var timing = ""
    
    override init() {
        super.init()
    }
    
    init(dict: [String: Any]) {
        if let val = dict["course"] as? String {
            course = val
            
        }
        
        if let val = dict["courseNO"] as? String
        {
            courseNO = val
            
        }
        if let val = dict["teacherName"] as? String
        {
            teacherName = val
            
        }
        if let val = dict["timing"] as? String
        {
            timing = val
            
        }
        
    }
}
