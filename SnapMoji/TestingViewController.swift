//
//  TestingViewController.swift
//  SnapMoji - Team 10 
//
//  Worked on by: Josh Baltar
//
//  Changelog:
//  2.0 - Initial commit layout and segues finished
//  2.1 - Generates working quiz template
//  2.2 - Quizzes generated with sample images
//  2.3 - Quizzes generated with friends/sample images
//  2.4 - Quizzes can now have difficulties: easy, medium, hard
//  2.5 - Quizzes can now be filtered with separate array of friends
//
//  Known bugs:
//  When quiz is finished, the question counter is incremented to 6/5 instead of just 5/5
//  Does not display the name of the person the question is currently being asked on
//
//  Created by zza92 on 2018-11-08.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//
//

import UIKit

var difficulty = 0

class TestingViewController: UIViewController {

    // Initialize variables
    var pickedAnswer = 0
    
    //outlets for the test labels, score, progress etc.
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progress: UIView!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    //Outlets for choices
    @IBOutlet weak var choiceA: UIButton!
    @IBOutlet weak var choiceB: UIButton!
    @IBOutlet weak var choiceC: UIButton!
    @IBOutlet weak var choiceD: UIButton!
    
    //Outlet for the Description/Causes Questions
    @IBOutlet weak var QuestionText: UILabel!
    

    let allQuestions = QuestionBank() //instantiate a questionbank
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //start with a question
        updateQuestion()
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //select/deselect buttons by changing color of buttons + text
    //picked answer will be highlighted in blue with white text.
    //deselected answer will be white with blue text
    @IBAction func answerPressed(_ sender: UIButton) {
        pickedAnswer =  sender.tag
       
        if pickedAnswer == 1 { //choice A selected
             self.choiceA.backgroundColor = UIColor.init(displayP3Red: 0.389, green: 0.732, blue: 0.852, alpha: 1)
            self.choiceB.backgroundColor = UIColor.white
            self.choiceC.backgroundColor = UIColor.white
            self.choiceD.backgroundColor = UIColor.white
            
            choiceA.setTitleColor(UIColor.white, for: .normal)
            choiceB.setTitleColor(UIColor.init(displayP3Red: 0.241, green: 0.474, blue: 0.765, alpha: 1), for: .normal)
            choiceC.setTitleColor(UIColor.init(displayP3Red: 0.241, green: 0.474, blue: 0.765, alpha: 1), for: .normal)
            choiceD.setTitleColor(UIColor.init(displayP3Red: 0.241, green: 0.474, blue: 0.765, alpha: 1), for: .normal)
            
        } else if pickedAnswer == 2 { //choice B selected
            self.choiceB.backgroundColor = UIColor.init(displayP3Red: 0.389, green: 0.732, blue: 0.852, alpha: 1)
            self.choiceA.backgroundColor = UIColor.white
            self.choiceC.backgroundColor = UIColor.white
            self.choiceD.backgroundColor = UIColor.white
            choiceB.setTitleColor(UIColor.white, for: .normal)
            choiceA.setTitleColor(UIColor.init(displayP3Red: 0.241, green: 0.474, blue: 0.765, alpha: 1), for: .normal)
            choiceC.setTitleColor(UIColor.init(displayP3Red: 0.241, green: 0.474, blue: 0.765, alpha: 1), for: .normal)
            choiceD.setTitleColor(UIColor.init(displayP3Red: 0.241, green: 0.474, blue: 0.765, alpha: 1), for: .normal)
            
        } else if pickedAnswer == 3 { //choice C selected
            self.choiceC.backgroundColor = UIColor.init(displayP3Red: 0.389, green: 0.732, blue: 0.852, alpha: 1)
            self.choiceA.backgroundColor = UIColor.white
            self.choiceB.backgroundColor = UIColor.white
            self.choiceD.backgroundColor = UIColor.white
            choiceC.setTitleColor(UIColor.white, for: .normal)
            choiceA.setTitleColor(UIColor.init(displayP3Red: 0.241, green: 0.474, blue: 0.765, alpha: 1), for: .normal)
            choiceB.setTitleColor(UIColor.init(displayP3Red: 0.241, green: 0.474, blue: 0.765, alpha: 1), for: .normal)
            choiceD.setTitleColor(UIColor.init(displayP3Red: 0.241, green: 0.474, blue: 0.765, alpha: 1), for: .normal)
            
        } else if pickedAnswer == 4 { //choice D selected
            self.choiceD.backgroundColor = UIColor.init(displayP3Red: 0.389, green: 0.732, blue: 0.852, alpha: 1)
            self.choiceA.backgroundColor = UIColor.white
            self.choiceB.backgroundColor = UIColor.white
            self.choiceC.backgroundColor = UIColor.white
            choiceD.setTitleColor(UIColor.white, for: .normal)
            choiceA.setTitleColor(UIColor.init(displayP3Red: 0.241, green: 0.474, blue: 0.765, alpha: 1), for: .normal)
            choiceB.setTitleColor(UIColor.init(displayP3Red: 0.241, green: 0.474, blue: 0.765, alpha: 1), for: .normal)
            choiceC.setTitleColor(UIColor.init(displayP3Red: 0.241, green: 0.474, blue: 0.765, alpha: 1), for: .normal)
            
        }
        
    }
    
    //function: when next is pressed, move onto next question
    @IBAction func submitAnswer(_ sender: UIButton) {
        if pickedAnswer == selectedAnswer {
            print("correct")
            score += 1
        } else if pickedAnswer == 0 {
            print ("no answer selected")
        } else {
            print("wrong")
        }
        
        questionNumber += 1
        updateQuestion()
    }
    
    
    //changing the question when the next question is needed
    func updateQuestion(){
        //5 questions will be asked: will keep updating question as long as there are more questions
        if questionNumber < allQuestions.list.count  {
            if difficulty < 4{ //emotion questions defined for photos
            questionImageView.image = (allQuestions.list[questionNumber].questionImage)
            }else{
                QuestionText.text = (allQuestions.list[questionNumber].questionTextDesc)
            }
            questionLabel.text = allQuestions.list[questionNumber].question
            choiceA.setTitle(allQuestions.list[questionNumber].choiceA, for: UIControlState.normal)
            choiceB.setTitle(allQuestions.list[questionNumber].choiceB, for: UIControlState.normal)
            choiceC.setTitle(allQuestions.list[questionNumber].choiceC, for: UIControlState.normal)
            choiceD.setTitle(allQuestions.list[questionNumber].choiceD, for: UIControlState.normal)
            selectedAnswer = allQuestions.list[questionNumber].correctAnswer
        } else { //description test question defined
            
            insertScore(score: score, difficulty: difficulty)//store the score for statistics
            //display the score:
            let finishMessage = "You got \(score)/\(allQuestions.list.count)!"
            
            //display popup when the test is finished
            let alert = UIAlertController(title: "Nice job!", message: finishMessage, preferredStyle: .alert)
            
            //option to restart the test
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartQuiz()})
            alert.addAction(restartAction)
            present(alert, animated:true, completion: nil)
            pickedAnswer = 0 //reset choice when restarting quiz (maybe move to restart quiz func)
        }
        updateUI()
    }
    
    //update the values for when the next question is needed
    func updateUI(){
        scoreLabel.text = "Score: \(score)"
        questionCounter.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
        progress.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber + 1)
        pickedAnswer = 0 //reset the picked answer to 0 when a fresh question is displayed
        self.choiceA.backgroundColor = UIColor.white
        self.choiceB.backgroundColor = UIColor.white
        self.choiceC.backgroundColor = UIColor.white
        self.choiceD.backgroundColor = UIColor.white
        
        //reset the colors of the buttons to show that no answer is currently selected
        choiceA.setTitleColor(UIColor.init(displayP3Red: 0.241, green: 0.474, blue: 0.765, alpha: 1), for: .normal)
        choiceB.setTitleColor(UIColor.init(displayP3Red: 0.241, green: 0.474, blue: 0.765, alpha: 1), for: .normal)
        choiceC.setTitleColor(UIColor.init(displayP3Red: 0.241, green: 0.474, blue: 0.765, alpha: 1), for: .normal)
        choiceD.setTitleColor(UIColor.init(displayP3Red: 0.241, green: 0.474, blue: 0.765, alpha: 1), for: .normal)
    }
    
    //start the quiz again when finished
    func restartQuiz(){
        score = 0
        questionNumber = 0
        updateQuestion()
        
    }
    
    //function to add a new element to any of the difficulty arrays to be used for the statistics charts
    //shift past scores & sdlete
    func insertScore(score: Int, difficulty: Int) {
        if difficulty == 1 {
            for i in 0...14 { //hardcoded for loop size: replace later
                print(i)
                if i == 14 {
                    testScoreEasyArray[i] = score
                } else {
                    testScoreEasyArray[i] = testScoreEasyArray[i+1]
                }
            }
        } else if difficulty == 2 {
            for i in 0...14 {
                if i == 14 {
                    testScoreMediumArray[i] = score
                } else {
                    testScoreMediumArray[i] = testScoreMediumArray[i+1]
                }
            }
        } else if difficulty == 3 {
            for i in 0...14 {
                if i == 14 {
                    testScoreHardArray[i] = score
                } else {
                    testScoreHardArray[i] = testScoreHardArray[i+1]
                }
            }
        } else if difficulty == 4 {
            for i in 0...14 {
                if i == 14 {
                    testScoreDescriptionArray[i] = score
                } else {
                    testScoreDescriptionArray[i] = testScoreDescriptionArray[i+1]
                }
            }
        }
    }
}
