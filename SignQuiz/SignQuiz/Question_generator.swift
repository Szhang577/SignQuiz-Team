//
//  Question_generator.swift
//  SignQuizTests
//
//  Created by 孙钰仁 on 2019/10/19.
//  Copyright © 2019 Siyuan. All rights reserved.
//

import Foundation

class Question_generator{
    var answer: String;
    var aslPath: String; //path to directory asl images
    
    init(aslPath: String, wordMin: Int, wordMax: Int) {
        // set the aslpath to the filepath
        // randomly generate an answer
        self.aslPath = aslPath;
        self.answer = Randoms.randomString(ofLength: Randoms.randomInt(wordMin,wordMax));
    }
    
    func get_question(){

        
    }
}
