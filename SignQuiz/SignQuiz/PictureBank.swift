//
//  PictureBank.swift
//  SignQuiz
//
//  Created by Lingkai Zhao on 10/19/19.
//  Copyright © 2019 Siyuan. All rights reserved.
//

import Foundation

class PictureBank{
    var questionString: String
    var characters = [Character]()
    init(questionString:String) {
        self.questionString = questionString
        characters = Array(questionString);
    }
    
    func getChars() -> [Character]{
        return characters
    }
    
    func toPicture(){
        
    }
}
