//
//  word_dic.swift
//  SignQuiz
//  This class create a dictionary
//
//  Created by 孙钰仁 on 2019/10/19.
//  Copyright © 2019 Siyuan. All rights reserved.
//

import Foundation

class Dictionary{
    var easyWords: [String] = [""]
    var normalWords: [String] = [""]
    var hardWords: [String] = [""]
    var evilWords: [String] = [""]
    var answer = ""
    
    init() {
        //read the word in txt files and initialize the word lists
        if let filepath = Bundle.main.path(forResource: "words/easy", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                easyWords = contents.components(separatedBy: "\n")
            } catch {
                // contents could not be loaded
            }
        }

        if let filepath = Bundle.main.path(forResource: "words/normal", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                normalWords = contents.components(separatedBy: "\n")
            } catch {
                // contents could not be loaded
            }
        }
        
        if let filepath = Bundle.main.path(forResource: "words/hard", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                hardWords = contents.components(separatedBy: "\n")
            } catch {
                // contents could not be loaded
            }
        }
        
        if let filepath = Bundle.main.path(forResource: "words/evil", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                evilWords = contents.components(separatedBy: "\n")
            } catch {
                // contents could not be loaded
            }
        }
    
    }
    
    func set_word(type: String){
        //get random word according to type and return nothing when the type is in wrong format
        if type == "easy"{
            answer = easyWords.randomElement()!
        }else if type == "normal"{
            answer = normalWords.randomElement()!
        }else if type == "hard" {
            answer = hardWords.randomElement()!
        }else if type == "evil" {
            answer = evilWords.randomElement()!
        }
    }
        
    func get_word() -> String {
        return answer
    }

    func check(input: String) -> Bool {
        return input == answer
    }
    
    func getImgPath() -> [String] {
        let picBank = PictureBank(questionString: self.answer)
        return picBank.toImagesFile()
    }
}

