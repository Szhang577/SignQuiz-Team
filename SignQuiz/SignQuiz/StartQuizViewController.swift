//
//  StartQuizViewController.swift
//  SignQuiz
//
//  Created by 张斯媛 on 10/19/19.
//  Copyright © 2019 Siyuan. All rights reserved.
//

import UIKit

class StartQuizViewController: UIViewController {

 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Actions
    
   
    @IBAction func easyButton(_ sender: UIButton) {
        variables.level = "easy"
        performSegue(withIdentifier: "quiz", sender: self)
    }
    
    @IBAction func normalButton(_ sender: UIButton) {
        variables.level = "normal"
        performSegue(withIdentifier: "quiz", sender: self)
    }
    
    
    @IBAction func hardButton(_ sender: UIButton) {
        variables.level = "hard"
        performSegue(withIdentifier: "quiz", sender: self)
    }
    
    
    @IBAction func evilButton(_ sender: UIButton) {
        variables.level = "evil"
        performSegue(withIdentifier: "quiz", sender: self)
    }
    
  
   

}
