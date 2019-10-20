//
//  word_dic.swift
//  SignQuiz
//  This class create a dictionary
//
//  Created by Yuren Sun, Harry Zhao, Siyuan Zhang on 10/19/19.
//  Copyright © 2019 Yuren Sun, Harry Zhao, Siyuan Zhang
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
    
    func get_word(type: String) -> String {
        //get random word according to type and return nothing when the type is in wrong format
        if type == "easy"{
            return easyWords.randomElement()!
        }else if type == "normal"{
            return normalWords.randomElement()!
        }else if type == "hard" {
            return hardWords.randomElement()!
        }else if type == "evil" {
            return evilWords.randomElement()!
        }else{
            return ""
        }
    }
}

