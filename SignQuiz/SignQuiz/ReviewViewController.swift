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
    
    // MARK: properties
    @IBOutlet weak var reviewImages: UIImageView!
    
    @IBOutlet weak var noReviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if revQue == nil {
            noReviewLabel.text = "There are no questions for review, \n please take quiz first :)"
        }else{
            timer.schedule(deadline: .now(), repeating: .milliseconds(500))
            image_flow()
        }
    }

    // MARK: Actions
    @IBAction func infoButton(_ sender: UIButton) {
    }
    
    @IBAction func removeButton(_ sender: UIButton) {
        if (revQue != nil && variables.reviewWords.contains(revQue!)){
            variables.reviewWords.removeFirst()
        }
    }
    
    @IBAction func repeatButton(_ sender: UIButton) {
        timer.cancel()
        timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        timer.schedule(deadline: .now(), repeating: .milliseconds(500))
        image_flow()
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
            }
            
            // finish showing all the images
            if timeCount <= 0 {
                self.timer.cancel()
            }
        })
        timer.resume()
    }
    
}
