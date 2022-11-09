//
//  QuizResultTableViewCell.swift
//  Quizzz
//
//  Created by Bimal@AppStation on 13/06/22.
//

import UIKit

class QuizResultTableViewCell: UITableViewCell {
    @IBOutlet weak var labelQuestionNumber: UILabel!
    @IBOutlet weak var labelSelectedAnswers: UILabel!
    var index = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setModel(setQuizRsltModel: Quiz) {
        self.labelQuestionNumber.text = setQuizRsltModel.question
        labelQuestionNumber.layer.borderWidth = 1
        labelQuestionNumber.layer.borderColor = UIColor.black.cgColor
//        self.labelSelectedAnswers.text = setQuizRsltModel.selectedAnswer
        if setQuizRsltModel.correctAnswer == 0 {
            if setQuizRsltModel.selectedAnswer == 1 {
                setCorrectedAnswersStyle()
            }
            else {
               setIncorrectedStyle()
            }
        }
        else if setQuizRsltModel.correctAnswer == 1 {
            if setQuizRsltModel.selectedAnswer == 2 {
                setCorrectedAnswersStyle()
            }
            else {
               setIncorrectedStyle()
            }
        }
        else if setQuizRsltModel.correctAnswer == 2 {
            if setQuizRsltModel.selectedAnswer == 3 {
                setCorrectedAnswersStyle()
            }
            else {
               setIncorrectedStyle()
            }
        }
        else if setQuizRsltModel.correctAnswer == 3 {
            if setQuizRsltModel.selectedAnswer == 4 {
                setCorrectedAnswersStyle()
            }
            else {
               setIncorrectedStyle()
            }
        }
        
    }
    func setCorrectedAnswersStyle() {
        labelSelectedAnswers.layer.borderWidth = 1
        labelSelectedAnswers.layer.borderColor = UIColor.green.cgColor
    }
    func setIncorrectedStyle() {
        labelSelectedAnswers.layer.borderWidth = 1
        labelSelectedAnswers.layer.borderColor = UIColor.red.cgColor
    }
}

