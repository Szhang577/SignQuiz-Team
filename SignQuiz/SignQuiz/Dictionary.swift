//
//  word_dic.swift
//  SignQuiz
//
//  Created by 孙钰仁 on 2019/10/19.
//  Copyright © 2019 Siyuan. All rights reserved.
//

import Foundation

class Dictionary{
    var easyWords: [String]
    var normalWords: [String]
    var hardWords: [String]
    var evilWords: [String]
    
    init() {
//        read the word in txt files and initialize the word lists
        if let filepath = Bundle.main.path(forResource: "words/easy", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                print(contents)
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
    }
}

