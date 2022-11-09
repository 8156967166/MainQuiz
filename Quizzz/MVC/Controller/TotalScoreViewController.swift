//
//  TotalScoreViewController.swift
//  Quizzz
//
//  Created by Bimal@AppStation on 23/06/22.
//

import UIKit

class TotalScoreViewController: UIViewController {
    @IBOutlet weak var imageprofile: UIImageView!
    @IBOutlet weak var viewTotalScore: UIView!
    @IBOutlet weak var buttonBackToPrfile: UIButton!
    @IBOutlet weak var labelTotalScore: UILabel!
    @IBOutlet weak var labelName: UILabel!
    var getNameTotalScore = String()
    var getQuizTotalScore = Int()
    var receivedImageInTotalScore: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let user = SingleTonClass.shared.requestForuser()
//        labelName.text = user.fname
        
        labelName.text = getNameTotalScore
        imageprofile.image = receivedImageInTotalScore
        imageprofile.layer.cornerRadius = imageprofile.frame.width/2.0
        imageprofile.clipsToBounds = true
        imageprofile.layer.borderWidth = 7
        imageprofile.layer.borderColor = UIColor.white.cgColor
        viewTotalScore.layer.cornerRadius = 10
        buttonBackToPrfile.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        buttonBackToPrfile.layer.cornerRadius = 12
        self.labelTotalScore.text = "\(getQuizTotalScore) / 10"
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
         setTotalScoreGradientBackground()
    }
    func setTotalScoreGradientBackground() {

        let colorTop =  UIColor(red: 170.0/255.0, green: 67.0/255.0, blue: 233.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 79.0/255.0, green: 84.0/255.0, blue: 217.0/255.0, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    @IBAction func buttonActionBacktoProfile(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        navigationController?.popToRootViewController(animated: true)
    }

}
