//
//  QuestionBank.swift
//  SnapMoji
//
//  Created by Josh Baltar on 2018-11-14.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import Foundation

class QuestionBank{
    var list = [Question]()
    
    init() {
        list.append(Question(image: "happiness_emoji", questionText: "What emotion is this?", userChoiceA: "Happiness", userChoiceB: "Sadness", userChoiceC: "Anger", userChoiceD: "Surprise", answer: 1))
    }
}
