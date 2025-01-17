//
//  PictureBank.swift
//  SignQuiz
//
//  Created by Yuren Sun, Harry Zhao, Siyuan Zhang on 10/19/19.
//  Copyright © 2019 Yuren Sun, Harry Zhao, Siyuan Zhang
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
            images.append("Images/" + imageBank[Int((char.asciiValue)!)-97])
        }

    }
    func getString() -> String{
        return questionString
    }
    
    func getChars() -> [Character]{
        return characters
    }
    
    func toImagesFile() -> [String]{
        print(images)
        return images
    }
}
