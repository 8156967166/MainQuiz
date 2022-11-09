//
//  QuizResultViewController.swift
//  Quizzz
//
//  Created by Bimal@AppStation on 13/06/22.
//

import UIKit

class QuizResultViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var buttonBackToQuiz: UIButton!
    @IBOutlet weak var labelCorrectedAnswers: UILabel!
    @IBOutlet weak var labelIncorrectedAnswers: UILabel!
    var getNameQuizResult = String()
    var receivedImageInQuizResult: UIImage!
    var getQuizResultModel: [Quiz] = []
    var questionIndex: Int = 0
    var correctedScore = 0
    var inCorrectedScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLabelsStyle(tempLabel: labelCorrectedAnswers)
        setLabelsStyle(tempLabel: labelIncorrectedAnswers)
        setCorrectedIncorrectedCount()
    }
    func setCorrectedIncorrectedCount() {
        for model in getQuizResultModel {
           
            if let selectedAnswer = model.selectedAnswer {
                print("selectedAnswer == \(selectedAnswer) || \(model.correctAnswer)")
                if selectedAnswer == model.correctAnswer+1 {
                        correctedScore += 1
                        print("corrected Score\(correctedScore)")
                }
                else {
                    inCorrectedScore += 1
                    print("Incorrected Score\(inCorrectedScore)")
                }
                self.labelCorrectedAnswers.text = "Correct:\(correctedScore)"
                self.labelIncorrectedAnswers.text = "Incorrect:\(inCorrectedScore)"
               
            }
            else {
                print("enter")
            }
           
        }
        print("Something")
    }
    
    func setLabelsStyle(tempLabel: UILabel) {
        tempLabel.layer.borderWidth = 1
        tempLabel.layer.borderColor = UIColor.black.cgColor
        tempLabel.layer.cornerRadius = 6
    }
    @IBAction func buttonActionNext(sender: UIButton) {
        self.performSegue(withIdentifier: "TotalScoreViewController", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TotalScoreViewController {
            vc.getQuizTotalScore = correctedScore
            vc.getNameTotalScore = getNameQuizResult
            vc.receivedImageInTotalScore = receivedImageInQuizResult
//            vc.getQuizTotalScore = "\(String(describing: labelCorrectedAnswers.text))"
        }
    }
    
//    @IBAction func buttonActionBackToQuiz(sender: UIButton) {
//        buttonBackToQuiz.layer.cornerRadius = 16
//        self.dismiss(animated: true, completion: nil)
//        navigationController?.popToRootViewController(animated: true)
//    }
}

extension QuizResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getQuizResultModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cellModell = getQuizResultModel[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Table.QuizResultCell", for: indexPath) as! QuizResultTableViewCell
            cell.setModel(setQuizRsltModel: cellModell)
            let model = getQuizResultModel[indexPath.row]
            cell.labelQuestionNumber.text = "\(model.id)"
    //        getQuizResultModel[indexPath.row].selectedAnswer = model.correctAnswer
    
            if let selectedAnswer = getQuizResultModel[indexPath.row].selectedAnswer {
                cell.labelSelectedAnswers.text = "\(selectedAnswer)"
            }else {
                cell.labelSelectedAnswers.text = "Not Attended"
            }
    //        questionIndex += 1
            return cell
        }
}
