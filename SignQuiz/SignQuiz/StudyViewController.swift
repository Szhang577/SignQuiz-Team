//
//  StudyViewController.swift
//  WiSign
//
//  Created by 张斯媛 on 10/19/19.
//  Copyright © 2019 Siyuan. All rights reserved.
//

import UIKit

class StudyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    // MARK: Actions
    
    @IBAction func studyButton(_ sender: UIButton) {
        performSegue(withIdentifier: "charList", sender: self)
    }
    
    @IBAction func forReviewButton(_ sender: UIButton) {
        performSegue(withIdentifier: "reviewList", sender: self)
    }
    
}
