//
//  QuizViewController.swift
//  Quizzz
//
//  Created by Bimal@AppStation on 10/06/22.
//

import UIKit
class Quiz {
    let id: String
    var question: String
    let options: [String]
    let correctAnswer: Int
    var selectedAnswer: Int?
//    var counter = 10
    init(strId: String, strQuestion: String, strOption: [String], setCorrect: Int) {
        self.id = strId
        self.question = strQuestion
        self.options = strOption
        self.correctAnswer = setCorrect
//        self.selectedAnswer = -1
    }
}
class QuizViewController: UIViewController {
    
    @IBOutlet weak var labelFirstOption: UILabel!
    @IBOutlet weak var labelSecondOption: UILabel!
    @IBOutlet weak var labelThirdOption: UILabel!
    @IBOutlet weak var labelFourthOption: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var buttonFirstOption: UIButton!
    @IBOutlet weak var buttonSecondOption: UIButton!
    @IBOutlet weak var buttonThirdOption: UIButton!
    @IBOutlet weak var buttonFourthOption: UIButton!
    @IBOutlet weak var viewFirstOption: UIView!
    @IBOutlet weak var viewSecondOption: UIView!
    @IBOutlet weak var viewThirdOPtion: UIView!
    @IBOutlet weak var viewFourthOption: UIView!
    @IBOutlet weak var buttonPrevious: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var labelAttendQuestion: UILabel!
    @IBOutlet weak var labelTimer: UILabel!
    var getNameQuiz = String()
    var receivedImageInQuiz: UIImage!
    let quizResultModel: QuizResult! = QuizResult()
    var counter = 10
    var timer = Timer()
    var questionIndex: Int = 0
    var currentQuestionIndex: Int = 0
    var arrayFirstAnswer: [String] = []
    var arrayQusAnsModel: [String] = []
    var quizArray = [Quiz]()
    var index: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuizModel()
        setButtonsStyle()
        setTimer()
        
//        labelTimer.layer.borderWidth = 1
//        labelTimer.layer.borderColor = UIColor.white.cgColor
//        labelTimer.layer.cornerRadius = 8
//        timer.invalidate()
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 44) {
//            self.performSegue(withIdentifier: "QuizResultViewController", sender: self)
//        }
        // Do any additional setup after loading the view.
    }
    func setTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    @objc func timerAction() {
        
        setButtonsEnable()
        labelTimer.text = "Timer:\(String(describing: counter))"
        counter -= 1
//        else if counter >= 0 {
        if counter == 0 {
            //   timer.invalidate()
            // labelTimer.text = "Time Out"
            if currentQuestionIndex != 9 {
                currentQuestionIndex += 1
               
            }
            else if currentQuestionIndex == 9 {
                timer.invalidate()
                labelTimer.text = "Time Out"
                self.performSegue(withIdentifier: "QuizResultViewController", sender: nil)
                
               
            }
            counter += 10
            setQuestionAnswers()
        }
//        }
    }
    
    func setQuizModel() {
        let quiz1 = Quiz(strId: "1", strQuestion: "What is the highest mountain in the world?", strOption: ["Mount K2", "Mount Lhotse", "Mount Everest", "Mount Cho Oyu"], setCorrect: 2)
        let quiz2 = Quiz(strId: "2", strQuestion: " In which year did World War II end?", strOption: ["1935", "1945", "1955", "1994"], setCorrect: 1)
//        quizArray.append(Quiz(question: , options: , correctAnser: ))
        let quiz3 = Quiz(strId: "3", strQuestion: "How many months of the year have exactly 31 days?", strOption: ["5","6", "7", "10"], setCorrect: 2)
        let quiz4 = Quiz(strId: "4", strQuestion: " In which century was the year 1275?", strOption: ["12th century", "13th century", "14th century", "11th century"], setCorrect: 1)
        let quiz5 = Quiz(strId: "5", strQuestion: "What is the largest country in the world by area?", strOption: ["The United States of America", "Canada", "Russia", "India"], setCorrect: 2)
        let quiz6 = Quiz(strId: "6", strQuestion: "How many valves are there in the heart?", strOption: ["3","4", "5", "6"], setCorrect: 1)
        let quiz7 = Quiz(strId: "7", strQuestion: "What do we call a baby rabbit?", strOption: ["A cub", "A kit", "A fawn", "A Calf"], setCorrect: 1)
        let quiz8 = Quiz(strId: "8", strQuestion: "What is the speed of light?", strOption: ["186,000 miles per second", "186,000 miles per minute", "186,000 miles per hour", "186,00 miles per second"], setCorrect: 0)
        let quiz9 = Quiz(strId: "9", strQuestion: "Which substance has the chemical formula H2O?", strOption: ["Salt", "Vinegar", "water", "Ammonia"], setCorrect: 2)
        let quest10 = Quiz(strId: "10", strQuestion: "How many letters are there in the modern English alphabet?", strOption: ["26", "32", "20", "24"], setCorrect: 0)
        
        quizArray = [quiz1,quiz2,quiz3, quiz4, quiz5, quiz6, quiz7, quiz8, quiz9, quest10]
        setQuestionAnswers()
    }
    func setQuestionAnswers() {
        let model = quizArray[self.currentQuestionIndex]
        labelQuestion.text = model.question
        labelFirstOption.text = model.options[0]
        labelSecondOption.text = model.options[1]
        labelThirdOption.text = model.options[2]
        labelFourthOption.text = model.options[3]
        labelAttendQuestion.text = "\(self.currentQuestionIndex+1)/10"
        setButtonsStyle()
    }
    @IBAction func buttonActionNext(sender: UIButton) {
        counter = 10
        setTimer()
        
        if currentQuestionIndex == 9 {
            timer.invalidate()
        }
//        currentQuestionIndex += 1
//        setQuestionAnswers()
        setButtonsEnable()
            if currentQuestionIndex == 9 {
                self.performSegue(withIdentifier: "QuizResultViewController", sender: nil)
            }
       else {
           currentQuestionIndex += 1
           setQuestionAnswers()
           setFirstButtons()
           setSecondButtons()
           setThirdButtons()
           setFourthButtons()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? QuizResultViewController {
            vc.getQuizResultModel = quizArray
            vc.getNameQuizResult = getNameQuiz
            vc.receivedImageInQuizResult = receivedImageInQuiz
        }
    }

    func setViewFirstStyle() {
        viewSecondOption.layer.borderColor = UIColor.gray.cgColor
        viewThirdOPtion.layer.borderColor = UIColor.gray.cgColor
        viewFourthOption.layer.borderColor = UIColor.gray.cgColor
    }
    func setViewSecondStyle() {
        viewFirstOption.layer.borderColor = UIColor.gray.cgColor
        viewThirdOPtion.layer.borderColor = UIColor.gray.cgColor
        viewFourthOption.layer.borderColor = UIColor.gray.cgColor
    }
    func setViewThirdStyle() {
        viewFirstOption.layer.borderColor = UIColor.gray.cgColor
        viewSecondOption.layer.borderColor = UIColor.gray.cgColor
        viewFourthOption.layer.borderColor = UIColor.gray.cgColor
    }
    func setViewFourthStyle() {
        viewFirstOption.layer.borderColor = UIColor.gray.cgColor
        viewSecondOption.layer.borderColor = UIColor.gray.cgColor
        viewThirdOPtion.layer.borderColor = UIColor.gray.cgColor
    }
    
    @IBAction func buttonActionOptions(sender: UIButton) {
        let model = quizArray[self.currentQuestionIndex]
        model.selectedAnswer = 1
        if sender.tag == 1 {
        if model.correctAnswer == 0 {
            viewFirstOption.layer.backgroundColor = UIColor.green.cgColor
            setViewFirstStyle()
            setButtonsDissable()
            }
            else {
                viewFirstOption.layer.backgroundColor = UIColor.red.cgColor
                setViewFirstStyle()
                setButtonsDissable()
            }
        }
        else if sender.tag == 2 {
            model.selectedAnswer = 2
           if model.correctAnswer == 1 {
            viewSecondOption.layer.backgroundColor = UIColor.green.cgColor
            setViewSecondStyle()
            setButtonsDissable()
            }
            else {
                viewSecondOption.layer.backgroundColor = UIColor.red.cgColor
                setViewSecondStyle()
                setButtonsDissable()
            }
        }
        else  if sender.tag == 3 {
            model.selectedAnswer = 3
           if model.correctAnswer == 2 {
            viewThirdOPtion.layer.backgroundColor = UIColor.green.cgColor
            setViewThirdStyle()
            setButtonsDissable()
            }
            else {
                viewThirdOPtion.layer.backgroundColor = UIColor.red.cgColor
                setViewThirdStyle()
                setButtonsDissable()
            }
        }
        else if sender.tag == 4 {
          model.selectedAnswer = 4
           if model.correctAnswer == 3 {
            viewFourthOption.layer.backgroundColor = UIColor.green.cgColor
            setViewFourthStyle()
            setButtonsDissable()
            }
            else {
                viewFourthOption.layer.backgroundColor = UIColor.red.cgColor
                setViewFourthStyle()
                setButtonsDissable()
            }
        }
        
//        print(sender.tag)
    }
    
    @IBAction func buttonActonPrevious(sender: UIButton) {
//        setButtonsEnable()
        
        if currentQuestionIndex == 0 {
            navigationController?.popToRootViewController(animated: true)
        }
        else {
            currentQuestionIndex -= 1
            setQuestionAnswers()
            setButtonsDissable()
            setFirstButtons()
            setSecondButtons()
            setThirdButtons()
            setFourthButtons()
        }
    }
    
    func setFirstButtons() {
        let model = quizArray[self.currentQuestionIndex]
        if model.selectedAnswer == 1 {
            if model.correctAnswer == 0 {
                viewFirstOption.layer.backgroundColor = UIColor.green.cgColor
                setViewFirstStyle()
                setButtonsDissable()
            }
            else {
                viewFirstOption.layer.backgroundColor = UIColor.red.cgColor
                setViewFirstStyle()
                setButtonsDissable()
            }
        }
    }
    func setSecondButtons() {
        let model = quizArray[self.currentQuestionIndex]
        if model.selectedAnswer == 2 {
        if model.correctAnswer == 1 {
         viewSecondOption.layer.backgroundColor = UIColor.green.cgColor
         setViewSecondStyle()
         setButtonsDissable()
         }
         else {
             viewSecondOption.layer.backgroundColor = UIColor.red.cgColor
             setViewSecondStyle()
             setButtonsDissable()
         }
        }
    }
    func setThirdButtons() {
        let model = quizArray[self.currentQuestionIndex]
        if model.selectedAnswer == 3 {
        if model.correctAnswer == 2 {
         viewThirdOPtion.layer.backgroundColor = UIColor.green.cgColor
         setViewThirdStyle()
         setButtonsDissable()
         }
         else {
             viewThirdOPtion.layer.backgroundColor = UIColor.red.cgColor
             setViewThirdStyle()
             setButtonsDissable()
         }
        }

    }
    func setFourthButtons() {
        let model = quizArray[self.currentQuestionIndex]
        if model.selectedAnswer == 4 {
        if model.correctAnswer == 3 {
         viewFourthOption.layer.backgroundColor = UIColor.green.cgColor
         setViewFourthStyle()
         setButtonsDissable()
         }
         else {
             viewFourthOption.layer.backgroundColor = UIColor.red.cgColor
             setViewFourthStyle()
             setButtonsDissable()
         }
    }
}
    
//    @IBAction func buttonActionFirstOption(sender: UIButton) {
//        let model = quizArray[self.currentQuestionIndex]
//        model.selectedAnswer = 1
//        if model.correctAnswer == 0 {
//            viewFirstOption.layer.backgroundColor = UIColor.green.cgColor
//            setViewFirstStyle()
//            setButtonsDissable()
//
//        }
//        else {
//            viewFirstOption.layer.backgroundColor = UIColor.red.cgColor
//            setViewFirstStyle()
//            setButtonsDissable()
//        }
//    }
//    @IBAction func buttonActionSecondOption(sender: UIButton) {
//        let model = quizArray[self.currentQuestionIndex]
//        model.selectedAnswer = 2
//        if model.correctAnswer == 1 {
//            viewSecondOption.layer.backgroundColor = UIColor.green.cgColor
//            setViewSecondStyle()
//            setButtonsDissable()
//        }
//        else {
//            viewSecondOption.layer.backgroundColor = UIColor.red.cgColor
//            setViewSecondStyle()
//            setButtonsDissable()
//        }
//    }
//    @IBAction func buttonActionThirdOption(sender: UIButton) {
//        let model = quizArray[self.currentQuestionIndex]
//        model.selectedAnswer = 3
//        if model.correctAnswer == 2 {
//            viewThirdOPtion.layer.backgroundColor = UIColor.green.cgColor
//            setViewThirdStyle()
//            setButtonsDissable()
//        }
//        else {
//            viewThirdOPtion.layer.backgroundColor = UIColor.red.cgColor
//            setViewThirdStyle()
//            setButtonsDissable()
//        }
//    }
//    @IBAction func buttonActionFourthOption(sender: UIButton) {
//        let model = quizArray[self.currentQuestionIndex]
//        model.selectedAnswer = 4
//        if model.correctAnswer == 3 {
//            viewFourthOption.layer.backgroundColor = UIColor.green.cgColor
//            setViewFourthStyle()
//            setButtonsDissable()
//        }
//        else {
//            viewFourthOption.layer.backgroundColor = UIColor.red.cgColor
//            setViewFourthStyle()
//            setButtonsDissable()
//        }
//    }
    
    func setButtonsDissable() {
        buttonFirstOption.isEnabled = false
        buttonSecondOption.isEnabled = false
        buttonThirdOption.isEnabled = false
        buttonFourthOption.isEnabled = false
    }
    func setButtonsEnable() {
        buttonFirstOption.isEnabled = true
        buttonSecondOption.isEnabled = true
        buttonThirdOption.isEnabled = true
        buttonFourthOption.isEnabled = true
    }
    func setButtonActions(tempButton: UIButton) {
        let model = quizArray[self.currentQuestionIndex]
        if model.correctAnswer == 0 {
            tempButton.layer.backgroundColor = UIColor.green.cgColor
        }
        else {
            tempButton.layer.backgroundColor = UIColor.red.cgColor
        }
    }
    func setButtonsStyle() {
        setButtonStyle(tempView: viewFirstOption)
        setButtonStyle(tempView: viewSecondOption)
        setButtonStyle(tempView: viewThirdOPtion)
        setButtonStyle(tempView: viewFourthOption)
        buttonNext.layer.borderWidth = 1
        buttonNext.layer.borderColor = UIColor.black.cgColor
        buttonNext.layer.cornerRadius = 6
        buttonPrevious.layer.borderWidth = 1
        buttonPrevious.layer.borderColor = UIColor.black.cgColor
        buttonPrevious.layer.cornerRadius = 6
    }
    func setButtonStyle(tempView: UIView) {
        tempView.layer.borderWidth = 1
        tempView.layer.borderColor = UIColor.white.cgColor
        tempView.layer.cornerRadius = 6
        tempView.layer.backgroundColor = UIColor.clear.cgColor
    }
}


