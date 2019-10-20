//
//  EasyViewController.swift
//  SignQuiz
//
//  Created by 张斯媛 on 10/19/19.
//  Copyright © 2019 Siyuan. All rights reserved.
//

import UIKit

class EasyViewController: UIViewController {
    var colorChange : Bool = false
    var question = Question(wordType: variables.level, dic: variables.dictionary)
    var timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
    
    //MARK: Properities
    @IBOutlet weak var levelLabel: UILabel?
    @IBOutlet weak var quizImages: UIImageView!
    @IBOutlet weak var userAnswer: UITextField!
    @IBOutlet weak var answerStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)
        
        levelLabel?.text = variables.level.capitalized
        timer.schedule(deadline: .now(), repeating: .milliseconds(500))
        image_flow()
        
        
    }
    
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer){
        if recognizer.state == .recognized{
            recognizer.state = .ended
            performSegue(withIdentifier: "backToLevel", sender: self)
        }
    }
    
    
    //MARK: Actions
    @IBAction func checkAnswerButton(_ sender: UIButton) {
        if question.check(input: userAnswer.text!){
            answerStatus.text = "You are correct, \n please try this one"
            reset()
        }else{
            answerStatus.text = "That's wrong, \n please try again"
            // add to review word list
            if !(variables.reviewWords.contains(question.get_question())){
                variables.reviewWords.append(question.get_question())
            }
            userAnswer.text = ""
        }
    }
    @IBAction func addToReview(_ sender: UIButton) {
       
        if (!(variables.reviewWords.contains(question.get_question()))){
            variables.reviewWords.append(question.get_question())
        }
        answerStatus.text = "Added to review, the answer is: " + question.answer
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        timer.cancel()
        self.dismiss(animated: false, completion: nil)
//        performSegue(withIdentifier: "backToLevel", sender: self)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
            answerStatus.text = ""
        reset()
    }
    @IBAction func repeatButton(_ sender: UIButton) {
        timer.cancel()
        timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        timer.schedule(deadline: .now(), repeating: .milliseconds(500))
        image_flow()
    }
    
    func set_image(){
        let picBank = PictureBank(questionString: question.get_question())
        print(picBank.toImagesFile()[0])
        quizImages.image = UIImage(named: picBank.toImagesFile()[0])
    }
    
    func reset(){
        userAnswer.text = ""
        //answerStatus.text = ""
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
        print(question.get_question())

        timer.setEventHandler(handler: {
            // set image to the cur img
            timeCount = timeCount - 1

            // back to main thread
            DispatchQueue.main.async {
                self.quizImages.image = nil
                self.quizImages.image = UIImage(named: imgList[imgCount])
                imgCount = imgCount + 1
                
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
