//
//  StartQuizViewController.swift
//  SignQuiz
//
//  Created by Yuren Sun, Harry Zhao, Siyuan Zhang on 10/19/19.
//  Copyright © 2019 Yuren Sun, Harry Zhao, Siyuan Zhang
//

import UIKit

class StartQuizViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)

        // Do any additional setup after loading the view.
    }
    
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer){
        if recognizer.state == .recognized{
            recognizer.state = .ended
            performSegue(withIdentifier: "backToHome", sender: self)
        }
    }
    
    //MARK: Actions
    @IBAction func easyButton(_ sender: UIButton) {
        variables.level = "easy"
        performSegue(withIdentifier: "quiz", sender: self)
    }
    
    @IBAction func normalButton(_ sender: UIButton) {
        variables.level = "normal"
//        performSegue(withIdentifier: "quiz", sender: self)
    }
    
    
    @IBAction func hardButton(_ sender: UIButton) {
        variables.level = "hard"
        performSegue(withIdentifier: "quiz", sender: self)
    }
    
    
    @IBAction func evilButton(_ sender: UIButton) {
        variables.level = "evil"
        performSegue(withIdentifier: "quiz", sender: self)
    }
    
    @IBAction func backToHomeButton(_ sender: UIButton) {
        performSegue(withIdentifier: "backToHome", sender: self)
        //self.dismiss(animated: false, completion: nil)
        
    }
    
   

}
