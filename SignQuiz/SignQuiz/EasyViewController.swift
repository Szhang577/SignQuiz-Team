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
    
    
    //MARK: Properities
    @IBOutlet weak var levelLabel: UILabel?
    @IBOutlet weak var quizImages: UIImageView!
    
    @IBOutlet weak var userAnswer: UITextField!
    
    @IBOutlet weak var answerStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //levelLabel?.text = variables.level
        levelLabel?.text = question.answer
        set_image()
    }
    
    
    //MARK: Actions
    @IBAction func checkAnswerButton(_ sender: UIButton) {
        if question.check(input: userAnswer.text!){
            answerStatus.text = "You are correct"
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
    }
    
    func set_image(){
        var picBank = PictureBank(questionString: question.get_question())
        print(picBank.toImagesFile()[0])
        quizImages.image = UIImage(named: picBank.toImagesFile()[0])
    }
    
    func reset(){
        set_image()
        question = Question(wordType: variables.level, dic: variables.dictionary)
        viewDidLoad()
        userAnswer.text = "Please Enter:"
    }
    
}
