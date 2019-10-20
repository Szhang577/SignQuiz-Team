//
//  SettingViewController.swift
//  WiSign
//
//  Created by Yuren Sun, Harry Zhao, Siyuan Zhang on 10/19/19.
//  Copyright © 2019 Yuren Sun, Harry Zhao, Siyuan Zhang
//

import UIKit

class SettingViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var versionLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var contactLabel: UILabel!
    
    @IBOutlet weak var copyrightLabel: UILabel!
    
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
    @IBAction func backToHomeButton(_ sender: UIButton) {
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
