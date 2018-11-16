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
    
    var friend = "" //get friends from firebase
    let sample = "Sample"
    let emotions = ["happiness", "sadness", "anger", "surprise", "disgust", "fear", "contempt", "neutral"]
    
    //use sample if less than 5 images exist
        //randomly pick an emotion and mark it to exclude it from the quiz
    //var randInt1 = arc4random_uniform(8)
    //var randInt2 = arc4random_uniform(8)
    //var randInt3 = arc4random_uniform(8)
    //var randInt4 = arc4random_uniform(8)
    //var randInt5 = arc4random_uniform(8)
    
    
    
    var randAns = "noEmotion"
    
    init(randAns: String) {
        //randAns = emotions[randInt]
    }
    
    init() {
        let randEmotion1 = emotions.randomElement()!
        let randEmotion2 = emotions.randomElement()!
        let randEmotion3 = emotions.randomElement()!
        let randEmotion4 = emotions.randomElement()!
        let randEmotion5 = emotions.randomElement()!
        
        let randAns1 = sample + randEmotion1
        let randAns2 = sample + randEmotion2
        let randAns3 = sample + randEmotion3
        let randAns4 = sample + randEmotion4
        let randAns5 = sample + randEmotion5
        
        list.append(Question(image: randAns1, questionText: "What emotion is this?", userChoiceA: randEmotion1, userChoiceB: "Sadness", userChoiceC: "Anger", userChoiceD: "Surprise", answer: 1))
        list.append(Question(image: randAns2, questionText: "What emotion is this?", userChoiceA: "Happiness", userChoiceB: randEmotion2, userChoiceC: "Anger", userChoiceD: "Surprise", answer: 2))
        list.append(Question(image: randAns3, questionText: "What emotion is this?", userChoiceA: "Happiness", userChoiceB: randEmotion3, userChoiceC: "Anger", userChoiceD: "Surprise", answer: 2))
        list.append(Question(image: randAns4, questionText: "What emotion is this?", userChoiceA: "Happiness", userChoiceB: "Anger", userChoiceC: randEmotion4, userChoiceD: "Surprise", answer: 3))
        list.append(Question(image: randAns5, questionText: "What emotion is this?", userChoiceA: "Happiness", userChoiceB: "Contempt", userChoiceC: "Anger", userChoiceD: randEmotion5, answer: 4))
    }
}
