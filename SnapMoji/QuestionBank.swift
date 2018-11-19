//
//  QuestionBank.swift
//  SnapMoji
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

var friendsFiltered = Array<String>()

class QuestionBank {
    var list = [Question]()
    
    var friend = "" //get friends from firebase or core data
    let sample = "Sample"
    let emotions = ["happiness", "sadness", "anger", "surprise", "disgust", "fear", "contempt", "neutral"]
    var emotion = "happiness"
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
                
                
                list.append(Question(image: image, questionText: "What emotion is this?", userChoiceA: randChoices[0], userChoiceB: randChoices[1], userChoiceC: randChoices[2], userChoiceD: randChoices[3], answer: randAnswer, chosenDifficulty: difficulty))
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
                
                list.append(Question(image: image, questionText: "What emotion is this?", userChoiceA: randChoices[0], userChoiceB: randChoices[1], userChoiceC: randChoices[2], userChoiceD: randChoices[3], answer: randAnswer, chosenDifficulty: difficulty))
            }
        }
        //list.append(Question(image: randAns2, questionText: "What emotion is this?", userChoiceA: "happiness", userChoiceB: randEmotion[1], userChoiceC: "anger", userChoiceD: "surprise", answer: 2, chosenDifficulty: difficulty))
        //list.append(Question(image: randAns3, questionText: "What emotion is this?", userChoiceA: "happiness", userChoiceB: randEmotion[2], userChoiceC: "anger", userChoiceD: "surprise", answer: 2, chosenDifficulty: difficulty))
        //list.append(Question(image: randAns4, questionText: "What emotion is this?", userChoiceA: "happiness", userChoiceB: "anger", userChoiceC: randEmotion[3], userChoiceD: "surprise", answer: 3, chosenDifficulty: difficulty))
        //list.append(Question(image: randAns5, questionText: "What emotion is this?", userChoiceA: "happiness", userChoiceB: "contempt", userChoiceC: "anger", userChoiceD: randEmotion[4], answer: 4, chosenDifficulty: difficulty))
        
        
    }
}

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
