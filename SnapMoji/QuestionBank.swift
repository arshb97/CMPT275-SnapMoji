//
//  QuestionBank.swift
//  SnapMoji - Team 10 
//
//  Worked on by: Josh Baltar
//
//  Changelog:
//  1.0 - Initial commit layout and segues finished
//  2.0 - Easy difficulty finished; Sample test implemented
//  2.1 - All difficulties implemented
//  2.2 - Options are now unique when generated; answers are random
//  2.3 - Added filters to choose certain friends on load
//
//  Known bugs:
//  No known bugs for this class
//
//  Created by Josh Baltar on 2018-11-14.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import Foundation
import FirebaseDatabase

var friendsFiltered = Array<String>()

class QuestionBank {
    var list = [Question]()
    var labelTestQuestion = "Question"
    var friend = "" //get friends from firebase or core data
    let sample = "Sample"
    let emotions = ["happiness", "sadness", "anger", "surprise", "disgust", "fear", "contempt", "neutral"]
    let anger = ["Everyone has their own triggers for feeling this emotion, but some common ones include feeling threatened or attacked, frustrated or powerless, treated unfairly or lack of respect.", "This is a powerful emotion that people feel from time to time when someone or something frustrates or annoys them. When you feel this emotion, you will feel the need to kick and scream."]
    let contempt = ["Many things can lead you to feel this emotion but they all ultimately lead you to look down on someone. Finding a repulsive characteristic about a person will cause you to feel this emotion. ", "The feeling that a person or a thing is beneath consideration, worthless, or deserving scorn. It is a mix of anger and disgust. "]
    let disgust = ["The rejection or revulsion to something potentially contagious or something considered offensive, distasteful, or unpleasant can cause you to feel this emotion.", "This emotion is the feeling of revulsion or strong disapproval aroused by something unpleasant or offensive."]
    let fear = ["This emotion is caused by instinct: a natural reaction to pain, danger or threat.", "This a feeling induced by perceived danger or threat ultimately causing a change in behavior, such as fleeing, hiding, or freezing from perceived traumatic events. "]
    let happiness = ["When people are successful, safe, or lucky, they feel this emotion. It can also occur when you eat or exercise, someone shows affection for you or being around people you love (such as family or friends). ", "This emotion is that feeling that comes over you when you know life is good and you can't help but smile. It's the opposite of sadness and gives a sense of well-being, joy, or contentment."]
    let neutral = ["The cause of feeling this emotion varies from person to person but to list a few potential reasons: you are doing something new or challenging, you’ve had a difficult or tense conversation with someone, you are putting something off or your sleep is being disrupted.", "This is the emotion that causes you to feel flat. It can be considered as a form of depression or anxiety as you neither feel happy nor sad. "]
    let sadness = ["There are various degrees of this emotion and therefore various causes. Sadness can occur from a range of activities including, going through something stressful, being around people who are going through a tough time, having an argument with someone, problems at school/work, big life changes (such as moving to a new house), being bored, not sleeping well or not exercising enough.", "Feeling this emotion is a natural reaction to situations that cause emotional upset or pain. It is associated with, or characterized by, feelings of disadvantage, loss, despair, grief, helplessness, disappointment and sorrow."]
    let surprise = ["Any unexpected event can cause you to feel this emotion such as receiving unexpected news or someone giving you something unexpectedly. ", "This emotion is a brief mental and physiological state, experienced in response to an unexpected event."]
    var emotion = "happiness"
    let ref = Database.database().reference()
    //var difficulty = 0
    
    //use sample if less than 5 images exist
    
    init() {
        //randomly pick 5 unique emotions
        var randEmotionSet = Set<String>() //a set can can only contain unique elements
        
        while randEmotionSet.count < 5 {
            let randIndex = Int(arc4random_uniform(UInt32(emotions.count)))
            randEmotionSet.insert(emotions[randIndex])
        }
        
        //generating a random question
        if difficulty < 4 {//for image tests
        for randomEmotion in randEmotionSet {
                if friendsFiltered.count == 0 {
                    friendsFiltered = friends
                }
                let fileName = friendsFiltered.randomElement()! + randomEmotion + ".jpg"
                print(fileName + " being loaded into question")
                let imagePath: String = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(fileName)"
                let imageUrl: URL = URL(fileURLWithPath: imagePath)
            
                // check if the image is stored already
                
                if FileManager.default.fileExists(atPath: imagePath),
                    let imageData: Data = try? Data(contentsOf: imageUrl),
                    var image: UIImage = UIImage(data: imageData, scale: UIScreen.main.scale) {
                    //figure out how to change which moji button we are changing
                    
                    let rotatedImage = image.rotate(radians: .pi / 2)
                    let topHalfImage = rotatedImage.topHalf
                    let bottomHalfImage = rotatedImage.bottomHalf
                    
                    //difficulty is changed globally
                    switch difficulty {
                    case 1:
                        image = rotatedImage
                        print("Full face image set")
                    case 3:
                        image = topHalfImage!
                    case 2:
                        image = bottomHalfImage!
                        
                    default:
                        print("Difficulty not selected. Error setting image for question")
                    }
                    
                    //generate a random set of choices of emotions
                    var randChoiceSet = Set<String>()
                    var randAnswer = Int()
                    randChoiceSet.insert(randomEmotion)
                    
                    while randChoiceSet.count < 4 {
                        let randIndex = Int(arc4random_uniform(UInt32(emotions.count)))
                        randChoiceSet.insert(emotions[randIndex])
                    }
                    
                    //randomly assign solution
                    var randChoiceArray = Array(randChoiceSet)
                    var randChoices = Array<String>()
                    for i in 0 ... 3 {
                        let randIndex = Int(arc4random_uniform(UInt32(randChoiceArray.count)))
                        let upperCaseEmotion = randChoiceArray[randIndex].capitalizingFirstLetter()
                        randChoices.append(upperCaseEmotion)
                        if randChoices[i] == randomEmotion {
                            randAnswer = i + 1
                            print("Answer Set to ", randAnswer)
                        }
                        randChoiceArray.remove(at: randIndex)
                        
                    }
                    
                    //set the answer to the random set
                    
                    
                    list.append(Question(text: self.labelTestQuestion, image: image, questionText: "What emotion is this?", userChoiceA: randChoices[0], userChoiceB: randChoices[1], userChoiceC: randChoices[2], userChoiceD: randChoices[3], answer: randAnswer, chosenDifficulty: difficulty))
                    //print("Looped ", randomEmotion)
                } else {
                    //need to implement sample pictures
                    let randAns = sample + randomEmotion
                    var image: UIImage = UIImage(named: randAns)!
                    //let rotatedImage = image.rotate(radians: .pi / 2)
                    let topHalfImage = image.topHalf
                    let bottomHalfImage = image.bottomHalf
                    
                    switch difficulty {
                    case 1:
                        //image = rotatedImage
                        print("Full face image set")
                    case 3:
                        image = topHalfImage!
                    case 2:
                        image = bottomHalfImage!
                    default:
                        print("Difficulty not selected. Error setting image for question")
                    }
                    
                    //generate a random set of choices of emotions
                    var randChoiceSet = Set<String>()
                    var randAnswer = Int()
                    randChoiceSet.insert(randomEmotion)
                    
                    while randChoiceSet.count < 4 {
                        let randIndex = Int(arc4random_uniform(UInt32(emotions.count)))
                        randChoiceSet.insert(emotions[randIndex])
                    }
                    
                    //randomly assign solution
                    var randChoiceArray = Array(randChoiceSet)
                    var randChoices = Array<String>()
                    for i in 0 ... 3 {
                        let randIndex = Int(arc4random_uniform(UInt32(randChoiceArray.count)))
                        let upperCaseEmotion = randChoiceArray[randIndex]
                        //check if this emotion is the answer
                        if upperCaseEmotion == randomEmotion {
                            randAnswer = i + 1
                            print("Sample: Answer Set to ", randAnswer)
                        }
                        //set the first letter capital before storing to array
                        randChoices.append(upperCaseEmotion.capitalizingFirstLetter())
                        print(randChoiceArray[randIndex])
                        
                        randChoiceArray.remove(at: randIndex)
                        
                    }
                    
                    list.append(Question(text: self.labelTestQuestion, image: image, questionText: "What emotion is this?", userChoiceA: randChoices[0], userChoiceB: randChoices[1], userChoiceC: randChoices[2], userChoiceD: randChoices[3], answer: randAnswer, chosenDifficulty: difficulty))
                }
            }
        }else{ //for description test
            var randEmotionSet2 = Set<String>()
            
            while randEmotionSet2.count < 5 {
                let randIndex = Int(arc4random_uniform(UInt32(emotions.count)))
                randEmotionSet2.insert(emotions[randIndex])
            }
            
            for randomEmotion in randEmotionSet2 {
                //randomly pick cause (1) or description (0)
                let rand = Int(arc4random_uniform(2))
                
                //Set the Question to a description or cause
                if (randomEmotion == "happiness"){
                    self.labelTestQuestion = happiness[rand]
                }else if(randomEmotion == "neutral"){
                    self.labelTestQuestion = neutral[rand]
                }else if(randomEmotion == "fear"){
                    self.labelTestQuestion = fear[rand]
                }else if(randomEmotion == "sadness"){
                    self.labelTestQuestion = sadness[rand]
                }else if(randomEmotion == "contempt"){
                    self.labelTestQuestion = contempt[rand]
                }else if(randomEmotion == "anger"){
                    self.labelTestQuestion = anger[rand]
                }else if(randomEmotion == "surprise"){
                    self.labelTestQuestion = surprise[rand]
                }else if(randomEmotion == "disgust"){
                    self.labelTestQuestion = disgust[rand]
                }
                
                //set image to be blank
                let image: UIImage = UIImage()
                
                //generate a random set of choices of emotions
                var randChoiceSet = Array<String>()
                var randAnswer = Int()
                randChoiceSet.append(randomEmotion)
                print("randomEmotion: "+randomEmotion)
                var copyOfEmotions = emotions
                for (index, emotion) in copyOfEmotions.enumerated(){
                    if(emotion == randomEmotion){
                        copyOfEmotions.remove(at: index)
                        break
                    }
                }
                print("Added Emotion: "+randChoiceSet[0])
                while randChoiceSet.count < 4 {
                    let randIndex = Int(arc4random_uniform(UInt32(copyOfEmotions.count)))
                    randChoiceSet.append(copyOfEmotions[randIndex])
                    print("Added Emotion: "+copyOfEmotions[randIndex])
                    copyOfEmotions.remove(at: randIndex)
                }
                
                //randomly assign solution
                var randChoices = Array<String>()
                for i in 0 ... 3 {
                    let randIndex = Int(arc4random_uniform(UInt32(randChoiceSet.count)))
                    let upperCaseEmotion = randChoiceSet[randIndex].capitalizingFirstLetter()
                    randChoices.append(upperCaseEmotion)
                    print("randChoices[i]: "+randChoices[i])
                    if randChoiceSet[randIndex] == randomEmotion {
                        randAnswer = i + 1
                        print("Answer Set to ", randAnswer)
                    }
                    randChoiceSet.remove(at: randIndex)
                    
                }
                
                //set the answer to the random set
                list.append(Question(text: self.labelTestQuestion, image: image, questionText: "What emotion is this?", userChoiceA: randChoices[0], userChoiceB: randChoices[1], userChoiceC: randChoices[2], userChoiceD: randChoices[3], answer: randAnswer, chosenDifficulty: difficulty))
            }//end of for loop
        }//end of else statment
        //list.append(Question(image: randAns2, questionText: "What emotion is this?", userChoiceA: "happiness", userChoiceB: randEmotion[1], userChoiceC: "anger", userChoiceD: "surprise", answer: 2, chosenDifficulty: difficulty))
        //list.append(Question(image: randAns3, questionText: "What emotion is this?", userChoiceA: "happiness", userChoiceB: randEmotion[2], userChoiceC: "anger", userChoiceD: "surprise", answer: 2, chosenDifficulty: difficulty))
        //list.append(Question(image: randAns4, questionText: "What emotion is this?", userChoiceA: "happiness", userChoiceB: "anger", userChoiceC: randEmotion[3], userChoiceD: "surprise", answer: 3, chosenDifficulty: difficulty))
        //list.append(Question(image: randAns5, questionText: "What emotion is this?", userChoiceA: "happiness", userChoiceB: "contempt", userChoiceC: "anger", userChoiceD: randEmotion[4], answer: 4, chosenDifficulty: difficulty))
        
        
    }//end of init
}//end of class

//needed to cut image in half 
extension UIImage {
    var topHalf: UIImage? {
        guard let cgImage = cgImage, let image = cgImage.cropping(to: CGRect(origin: .zero, size: CGSize(width: size.width, height: size.height/2))) else { return nil }
        return UIImage(cgImage: image, scale: 1, orientation: imageOrientation)
    }
    var bottomHalf: UIImage? {
        guard let cgImage = cgImage, let image = cgImage.cropping(to: CGRect(origin: CGPoint(x: 0,  y: CGFloat(Int(size.height)-Int(size.height/2))), size: CGSize(width: size.width, height: CGFloat(Int(size.height) - Int(size.height/2))))) else { return nil }
        return UIImage(cgImage: image)
    }
    var leftHalf: UIImage? {
        guard let cgImage = cgImage, let image = cgImage.cropping(to: CGRect(origin: .zero, size: CGSize(width: size.width/2, height: size.height))) else { return nil }
        return UIImage(cgImage: image)
    }
    var rightHalf: UIImage? {
        guard let cgImage = cgImage, let image = cgImage.cropping(to: CGRect(origin: CGPoint(x: CGFloat(Int(size.width)-Int((size.width/2))), y: 0), size: CGSize(width: CGFloat(Int(size.width)-Int((size.width/2))), height: size.height)))
            else { return nil }
        return UIImage(cgImage: image)
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
