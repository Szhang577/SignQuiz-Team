//
//  Question_generator.swift
//  SignQuizTests
//
//  Created by Yuren Sun, Harry Zhao, Siyuan Zhang on 10/19/19.
//  Copyright © 2019 Yuren Sun, Harry Zhao, Siyuan Zhang
//

import Foundation

class Question{
    var answer: String
    
    init(wordType: String, dic: Dictionary) {
        // set the aslpath to the filepath
        // randomly generate an answer
        self.answer = dic.get_word(type: wordType)
    }
     
    func get_question() -> String{
        return self.answer
    }
    
    func check(input: String) -> Bool {
        return input.lowercased() == answer
    }
    
}
