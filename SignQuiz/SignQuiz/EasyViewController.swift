//
//  EasyViewController.swift
//  SignQuiz
//
//  Created by 张斯媛 on 10/19/19.
//  Copyright © 2019 Siyuan. All rights reserved.
//

import UIKit

class EasyViewController: UIViewController {
//    var quizType: String = "1"
    
    //MARK: Properities
    @IBOutlet weak var levelLabel: UILabel?
    @IBOutlet weak var quizImages: UIImageView!
    
    override func viewDidLoad() {
//        let vc = StartQuizViewController(nibName: "StartQuizViewCotnroller" , bundle: nil)
        super.viewDidLoad()
//        self.quizType = StartQuizViewController.get_quiz_type()
        
        // Do quizTypeany additional setup after loading the view.
        levelLabel?.text = variables.level
    }

}
