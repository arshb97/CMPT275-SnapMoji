//
//  QuestionBank.swift
//  SnapMoji
//
//  Created by Josh Baltar on 2018-11-14.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

import Foundation

class QuestionBank {
    var list = [Question]()
    
    var friend = "" //get friends from firebase or core data
    let sample = "Sample"
    let emotions = ["happiness", "sadness", "anger", "surprise", "disgust", "fear", "contempt", "neutral"]
    var emotion = "happiness"
    //var difficulty = 0
    
    //use sample if less than 5 images exist
    
    init() {
        //randomly pick an emotion and mark it to exclude it from the quiz
        let randEmotion = [emotions.randomElement()!, emotions.randomElement()!, emotions.randomElement()!, emotions.randomElement()!, emotions.randomElement()!]
        
        //make array
        
        //let randAns2 = sample + randEmotion[1]
        //let randAns3 = sample + randEmotion[2]
        //let randAns4 = sample + randEmotion[3]
        //let randAns5 = sample + randEmotion[4]
        
        //getting image
        for randomEmotion in randEmotion {
            let fileName = friends.randomElement()! + randomEmotion + ".jpg"
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
                
                switch difficulty {
                case 1:
                    image = rotatedImage
                    print("Full face image set")
                case 2:
                    image = topHalfImage!
                case 3:
                    image = bottomHalfImage!
                    
                default:
                    print("Difficulty not selected. Error setting image for question")
                }
                
                list.append(Question(image: image, questionText: "What emotion is this?", userChoiceA: randomEmotion, userChoiceB: "sadness", userChoiceC: "anger", userChoiceD: "surprise", answer: 1, chosenDifficulty: difficulty))
                print("Looped ", randomEmotion)
            } else {
                //need to implement sample pictures
                let randAns = sample + randomEmotion
                let image: UIImage = UIImage(named: randAns)!
                list.append(Question(image: image, questionText: "What emotion is this?", userChoiceA: "happiness", userChoiceB: randomEmotion, userChoiceC: "anger", userChoiceD: "surprise", answer: 2, chosenDifficulty: difficulty))
            }
        }
        //list.append(Question(image: randAns2, questionText: "What emotion is this?", userChoiceA: "happiness", userChoiceB: randEmotion[1], userChoiceC: "anger", userChoiceD: "surprise", answer: 2, chosenDifficulty: difficulty))
        //list.append(Question(image: randAns3, questionText: "What emotion is this?", userChoiceA: "happiness", userChoiceB: randEmotion[2], userChoiceC: "anger", userChoiceD: "surprise", answer: 2, chosenDifficulty: difficulty))
        //list.append(Question(image: randAns4, questionText: "What emotion is this?", userChoiceA: "happiness", userChoiceB: "anger", userChoiceC: randEmotion[3], userChoiceD: "surprise", answer: 3, chosenDifficulty: difficulty))
        //list.append(Question(image: randAns5, questionText: "What emotion is this?", userChoiceA: "happiness", userChoiceB: "contempt", userChoiceC: "anger", userChoiceD: randEmotion[4], answer: 4, chosenDifficulty: difficulty))
        
        
    }
}

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
