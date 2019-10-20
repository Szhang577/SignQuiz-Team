//
//  ReviewViewController.swift
//  SignQuiz
//
//  Created by 张斯媛 on 10/19/19.
//  Copyright © 2019 Siyuan. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    var revQue = variables.reviewWords.randomElement()
    var timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
    
    // MARK: properties
    @IBOutlet weak var reviewImages: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if revQue == nil {
            
        }else{
            timer.schedule(deadline: .now(), repeating: .milliseconds(500))
            image_flow()
        }
    }

    // MARK: Actions
    @IBAction func infoButton(_ sender: UIButton) {
    }
    @IBAction func removeButton(_ sender: UIButton) {
    }
    @IBAction func repeatButton(_ sender: UIButton) {
    }
    
    func image_flow(){
        print(revQue)
        //change image every second
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
