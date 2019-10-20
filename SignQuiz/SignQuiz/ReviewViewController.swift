//
//  ReviewViewController.swift
//  SignQuiz
//
//  Created by 张斯媛 on 10/19/19.
//  Copyright © 2019 Siyuan. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    var revQue = variables.reviewWords.first
    var timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
    var colorChange : Bool = false
    
    // MARK: properties
    @IBOutlet weak var reviewImages: UIImageView!
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    
    @IBOutlet weak var noReviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer.schedule(deadline: .now(), repeating: .milliseconds(500))
        if revQue == nil {
            self.reviewImages.image = nil
            noReviewLabel.text = "There are no questions for review, \n please take quiz first :)"
            removeButton.setTitle("", for: .normal)
            answerButton.setTitle("", for: .normal)
        }else{
            removeButton.setTitle("Remove", for: .normal)
            answerButton.setTitle("Click to see Answer", for: .normal)
            image_flow()
            
        }
    }

    // MARK: Actions
    @IBAction func infoButton(_ sender: UIButton) {
        if (answerButton.currentTitle == "Click to see Answer" && revQue != nil){
            answerButton.setTitle(revQue, for: .normal)
        }
    }
    
    @IBAction func removeButton(_ sender: UIButton) {
        if (removeButton.currentTitle == "Remove"){
            if (revQue != nil && variables.reviewWords.contains(revQue!)){
                variables.reviewWords.removeFirst()
                removeButton.setTitle("Put it back", for: .normal)
            }
        }else if (removeButton.currentTitle == "Put it back"){
            if (revQue != nil && !(variables.reviewWords.contains(revQue!))){
                variables.reviewWords.append(revQue!)
                removeButton.setTitle("Remove", for: .normal)
            }
        }
    }
    
    @IBAction func repeatButton(_ sender: UIButton) {
        if revQue != nil {
            timer.cancel()
            timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
            timer.schedule(deadline: .now(), repeating: .milliseconds(500))
            image_flow()
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
//        performSegue(withIdentifier: "backToReview", sender: self)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        if revQue != nil {
            revQue = variables.reviewWords.first
            timer.cancel()
            timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
            self.viewDidLoad()
        }
    }
    
    func image_flow(){
        //change image every 0.5 second
        print(revQue!)
        let picBank = PictureBank(questionString: revQue!)
        let imgList = picBank.toImagesFile()
        var imgCount = 0
        var timeCount = imgList.count


        timer.setEventHandler(handler: {
            // set image to the cur img
            timeCount = timeCount - 1

            // back to main thread
            DispatchQueue.main.async {
                self.reviewImages.image = nil
                self.reviewImages.image = UIImage(named: imgList[imgCount])
                imgCount = imgCount + 1
                
                // change the background color
                if (self.colorChange){
                    self.view.backgroundColor = UIColor(red: CGFloat(234.0/255), green:  CGFloat(222.0/255), blue: CGFloat(191.0/255), alpha:  CGFloat(1))
                    self.colorChange = !self.colorChange
                } else {
                    self.view.backgroundColor = UIColor(red: CGFloat(234.0/255), green:  CGFloat(213.0/255), blue:  CGFloat(191.0/255), alpha:  CGFloat(1))
                    self.colorChange = !self.colorChange
                }
            }
            
            // finish showing all the images
            if timeCount <= 0 {
                self.timer.cancel()
            }
        })
        timer.resume()
    }
    
}
