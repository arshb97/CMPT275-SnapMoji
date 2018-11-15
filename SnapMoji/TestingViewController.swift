//
//  TestingViewController.swift
//  SnapMoji
//
//  Created by zza92 on 2018-11-08.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//
//

import UIKit

class TestingViewController: UIViewController {

    
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
        if sender.tag == selectedAnswer {
            print("correct")
            score += 1
        } else {
            print("wrong")
        }
        
        questionNumber += 1
        updateQuestion()
        
    }
    
    func updateQuestion(){
        if questionNumber <= allQuestions.list.count - 1 {
            questionImageView.image = UIImage(named:(allQuestions.list[questionNumber].questionImage))
            questionLabel.text = allQuestions.list[questionNumber].question
            choiceA.setTitle(allQuestions.list[questionNumber].choiceA, for: UIControlState.normal)
            choiceB.setTitle(allQuestions.list[questionNumber].choiceB, for: UIControlState.normal)
            choiceC.setTitle(allQuestions.list[questionNumber].choiceC, for: UIControlState.normal)
            choiceD.setTitle(allQuestions.list[questionNumber].choiceD, for: UIControlState.normal)
            selectedAnswer = allQuestions.list[questionNumber].correctAnswer
        } else {
            let alert = UIAlertController(title: "Nice", message: "You have finished the quiz!", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartQuiz()})
            alert.addAction(restartAction)
            present(alert, animated:true, completion: nil)
        }
        updateUI()
    }
    
    func updateUI(){
        scoreLabel.text = "Score: \(score)"
        questionCounter.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
        progressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber + 1)
    }
    
    func restartQuiz(){
        score = 0
        questionNumber = 0
        updateQuestion()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
