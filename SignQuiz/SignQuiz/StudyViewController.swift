//
//  StudyViewController.swift
//  WiSign
//
//  Created by Yuren Sun, Harry Zhao, Siyuan Zhang on 10/19/19.
//  Copyright © 2019 Yuren Sun, Harry Zhao, Siyuan Zhang
//

import UIKit

class StudyViewController: UIViewController {

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
            performSegue(withIdentifier: "backToOriginalHome", sender: self)
        }
    }
    


    // MARK: Actions
    
    @IBAction func studyButton(_ sender: UIButton) {
        performSegue(withIdentifier: "charList", sender: self)
    }
    
    @IBAction func forReviewButton(_ sender: UIButton) {
//        performSegue(withIdentifier: "reviewList", sender: self)
    }
    @IBAction func backToHomeButton(_ sender: UIButton) {
    }
    
}
