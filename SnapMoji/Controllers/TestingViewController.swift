//
//  TestingViewController.swift
//  SnapMoji
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
    
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var friendName: NSLayoutConstraint!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    //Outlet for Buttons
    @IBOutlet weak var choiceA: UIButton!
    @IBOutlet weak var choiceB: UIButton!
    @IBOutlet weak var choiceC: UIButton!
    @IBOutlet weak var choiceD: UIButton!
    
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        updateUI()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        pickedAnswer =  sender.tag
        
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
        if questionNumber < allQuestions.list.count  {
            questionImageView.image = (allQuestions.list[questionNumber].questionImage)
            questionLabel.text = allQuestions.list[questionNumber].question
            choiceA.setTitle(allQuestions.list[questionNumber].choiceA, for: UIControlState.normal)
            choiceB.setTitle(allQuestions.list[questionNumber].choiceB, for: UIControlState.normal)
            choiceC.setTitle(allQuestions.list[questionNumber].choiceC, for: UIControlState.normal)
            choiceD.setTitle(allQuestions.list[questionNumber].choiceD, for: UIControlState.normal)
            selectedAnswer = allQuestions.list[questionNumber].correctAnswer
        } else {
            let finishMessage = "You got \(score)/\(allQuestions.list.count)!"
            
            let alert = UIAlertController(title: "Nice job!", message: finishMessage, preferredStyle: .alert)
            
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
        progressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber + 1)
    }
    
    //start the quiz again when finished
    func restartQuiz(){
        score = 0
        questionNumber = 0
        updateQuestion()
        
    }
}
