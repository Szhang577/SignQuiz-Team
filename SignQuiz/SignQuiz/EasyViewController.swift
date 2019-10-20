//
//  EasyViewController.swift
//  SignQuiz
//
//  Created by 张斯媛 on 10/19/19.
//  Copyright © 2019 Siyuan. All rights reserved.
//

import UIKit

class EasyViewController: UIViewController {
    var question = Question(wordType: variables.level, dic: variables.dictionary)
    var timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
    
    //MARK: Properities
    @IBOutlet weak var levelLabel: UILabel?
    @IBOutlet weak var quizImages: UIImageView!
    
    @IBOutlet weak var userAnswer: UITextField!
    
    @IBOutlet weak var answerStatus: UILabel!
    
    @IBOutlet weak var repeatButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //levelLabel?.text = variables.level
        levelLabel?.text = question.answer
        timer.schedule(deadline: .now(), repeating: .milliseconds(500))
        image_flow()
    }
    
    
    //MARK: Actions
    @IBAction func checkAnswerButton(_ sender: UIButton) {
        if question.check(input: userAnswer.text!){
            answerStatus.text = "You are correct, please try this one"
            reset()
        }else{
            answerStatus.text = "Idiot, please try again"
        }
    }
    @IBAction func addToReview(_ sender: UIButton) {
       
        if (variables.reviewWords.firstIndex(of: question.get_question()) != nil){
            variables.reviewWords.append(question.get_question())
        }
        answerStatus.text = "Added to review, the answer is: " + question.answer
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        performSegue(withIdentifier: "backToLevel", sender: self)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        reset()
    }
    @IBAction func repeatButton(_ sender: UIButton) {
        timer.cancel()
        timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        timer.schedule(deadline: .now(), repeating: .milliseconds(500))
        image_flow()
    }
    
    func set_image(){
        var picBank = PictureBank(questionString: question.get_question())
        print(picBank.toImagesFile()[0])
        quizImages.image = UIImage(named: picBank.toImagesFile()[0])
    }
    
    func reset(){
        userAnswer.text = ""
        question = Question(wordType: variables.level, dic: variables.dictionary)
        timer.cancel()
        timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        self.viewDidLoad()

    }
    
    func image_flow(){
        //change image every second
        let picBank = PictureBank(questionString: question.get_question())
        let imgList = picBank.toImagesFile()
        var imgCount = 0
        var timeCount = imgList.count

//        let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())

        timer.setEventHandler(handler: {
            // set image to the cur img
            timeCount = timeCount - 1

            // back to main thread
            DispatchQueue.main.async {
                print(imgList[imgCount])
                self.quizImages.image = nil
                self.quizImages.image = UIImage(named: imgList[imgCount])
                imgCount = imgCount + 1
                print("-------%d",timeCount);
            }
            
            // finish showing all the images
            if timeCount <= 0 {
                self.timer.cancel()
            }
        })
        
        timer.resume()
    }
    
    
}
