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
    
    @IBOutlet weak var userAnswer: UITextField!
    
    @IBOutlet weak var answerStatus: UILabel!
    
    override func viewDidLoad() {
//        let vc = StartQuizViewController(nibName: "StartQuizViewCotnroller" , bundle: nil)
        super.viewDidLoad()
//        self.quizType = StartQuizViewController.get_quiz_type()
        
        // Do quizTypeany additional setup after loading the view.
        levelLabel?.text = variables.level
    }
    
    //MARK: Actions
    @IBAction func checkAnswerButton(_ sender: UIButton) {
    }
    @IBAction func addToReview(_ sender: UIButton) {
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        performSegue(withIdentifier: "backToLevel", sender: self)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
    }
    @IBAction func repeatButton(_ sender: UIButton) {
    }
    
}
