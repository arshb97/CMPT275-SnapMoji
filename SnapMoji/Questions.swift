//
//  Questions.swift
//  SnapMoji - Team 10 
//

//  Description of Questions:
//  Structure set up to compile a set for each question
//  Includes the question, an image, a label, 4 choices, the correct answer and the level of difficulty
//
//  Worked on by: Josh Baltar and Merna Zaki
//
//  Changelog:
//  1.0 - Initial commit of class with all variables needed
//  2.0 - changed image in class from String to UIImage
//  3.0 - Adapted to work for descriptions test as well
//
//  Known bugs:
//  No known bugs for this class
//
//  Created by Josh Baltar on 2018-11-14.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import Foundation


class Question {
    //Initializing variables of Question class
    var difficulty: Int
    let questionImage: UIImage
    let questionTextDesc: String
    //let sampleImage: String
    let question: String
    let choiceA: String
    let choiceB: String
    let choiceC: String
    let choiceD: String
    let correctAnswer: Int
    
    //initialize question with values given when instantiated
    init(text: String, image: UIImage, questionText: String, userChoiceA: String, userChoiceB: String, userChoiceC: String, userChoiceD: String, answer: Int, chosenDifficulty: Int) {
        questionTextDesc = text
        questionImage = image
        question = questionText
        choiceA = userChoiceA
        choiceB = userChoiceB
        choiceC = userChoiceC
        choiceD = userChoiceD
        correctAnswer = answer
        difficulty = chosenDifficulty
    }
}
