//
//  ConfirmViewController.swift
//  Farah
//
//  Created by Tman on 5/8/19.
//  Copyright © 2019 Tman. All rights reserved.
//

import UIKit

class ConfirmViewController: UIViewController {

    @IBOutlet private weak var backHomeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func backHomeAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(
            vc, animated: true)
    }
}
