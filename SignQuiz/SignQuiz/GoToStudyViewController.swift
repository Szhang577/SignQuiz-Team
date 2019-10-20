//
//  GoToStudyViewController.swift
//  WiSign
//
//  Created by Lingkai Zhao on 10/20/19.
//  Copyright © 2019 Siyuan. All rights reserved.
//

import UIKit

class GoToStudyViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var studyImages: UIImageView!
    
    @IBOutlet weak var charLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)
        
        var display : String = (String((Array(variables.goToStudyImage!))[7]))
        charLabel.text = display.uppercased()
        studyImages.image = UIImage(named: variables.goToStudyImage!)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer){
        if recognizer.state == .recognized{
            recognizer.state = .ended
            performSegue(withIdentifier: "backToTable", sender: self)
        }
    }
    
    // MARK: Actions
    @IBAction func backToChar(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
