//
//  ViewController.swift
//  Quiz
//
//  Created by rohan verma on 05/11/19.
//  Copyright © 2019 rohan verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressview: UIView!
    @IBOutlet weak var flagview: UIImageView!
    @IBOutlet weak var questionlabel: UILabel!
    //outlets for buttons
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    let allquestion = QuestionBank()
    var QuestionNumber = 0
    var ScoreNumber = 0
    var SelectedAnswer = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
         updateUI()
        // Do any additional setup after loading the view.
    }
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag ==  SelectedAnswer{
            print("correct")
            ScoreNumber += 1
        }
        else {
            print("wrong")
        }
         QuestionNumber += 1
        updateQuestion()
        
    }
    func updateQuestion(){
        
        if QuestionNumber <= allquestion.list.count - 1{
            
     flagview.image = UIImage(named: allquestion.list[QuestionNumber].questionImage)
     questionlabel.text = allquestion.list[QuestionNumber].question
     optionA.setTitle(allquestion.list[QuestionNumber].optionA, for: UIControl.State.normal)
     optionB.setTitle(allquestion.list[QuestionNumber].optionB, for: UIControl.State.normal)
     optionC.setTitle(allquestion.list[QuestionNumber].optionC, for: UIControl.State.normal)
     optionD.setTitle(allquestion.list[QuestionNumber].optionD, for: UIControl.State.normal)
     SelectedAnswer = allquestion.list[QuestionNumber].correctAnswer
        }
        
    
        else{
            let alert = UIAlertController(title: "Awesome", message: "end of quiz, want to start again?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartQuiz()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        updateUI()
    }
    func updateUI(){
        scoreLabel.text = "Score: \(ScoreNumber)"
        questionCounter.text = " \(QuestionNumber + 1)/ \(allquestion.list.count)"
        progressview.frame.size.width = (view.frame.size.width / CGFloat(allquestion.list.count)) * CGFloat(QuestionNumber + 1)
       }
    func restartQuiz(){
        ScoreNumber = 0
        QuestionNumber = 0
        updateQuestion()
    }
}

