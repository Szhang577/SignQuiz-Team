//
//  Question_generator.swift
//  SignQuizTests
//
//  Created by 孙钰仁 on 2019/10/19.
//  Copyright © 2019 Siyuan. All rights reserved.
//

import Foundation

class Question{
    var answer: String
    var aslPath: String //path to directory asl images
    
    init(aslPath: String, wordType: String, dic: Dictionary) {
        // set the aslpath to the filepath
        // randomly generate an answer
        self.aslPath = aslPath
        self.answer = dic.get_word(type: wordType)
    }
     
    func get_question(picBank: PictureBank) -> String{
        return self.answer
    }
    
    func check(input: String) -> Bool {
        return input == answer
    }
    
}
