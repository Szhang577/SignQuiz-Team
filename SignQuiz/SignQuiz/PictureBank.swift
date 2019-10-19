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
    var images = [String]()
    let imageBank : [String] = ["a.jpg","b.jpg","c.jpg","d.jpg","e.jpg","f.jpg","g.jpg","h.jpg","i.jpg","j.jpg","k.jpg","l.jpg","m.jpg","n.jpg","o.jpg","p.jpg","q.jpg","r.jpg","s.jpg","t.jpg","u.jpg","v.jpg","w.jpg","x.jpg","y.jpg","z.jpg"]
    init(questionString:String) {
        self.questionString = questionString
        characters = Array(questionString.lowercased())
        for char in characters{
            images.append(imageBank[Int((char.asciiValue)!)-97])
        }
    // comment
    }
    func getString() -> String{
        return questionString
    }
    
    func getChars() -> [Character]{
        return characters
    }
    
    func toImagesFile() -> [String]{
        return images
    }
}
