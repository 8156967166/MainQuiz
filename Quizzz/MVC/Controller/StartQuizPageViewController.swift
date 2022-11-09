//
//  StartQuizPageViewController.swift
//  Quizzz
//
//  Created by Bimal@AppStation on 10/06/22.

import UIKit

class StartQuizPageViewController: UIViewController {
    @IBOutlet weak var buttonStart: UIButton!
    var getNameStartQuiz = String()
    var receivedImageInStartQuiz: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
//        NotificationCenter.default.addObserver(self, selector: #selector(notify(notification:)), name: Notification.Name(rawValue: "Clicked"), object: nil)
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setGradientBackground()
    }
    
    func setStyle() {
        buttonStart.layer.borderWidth = 1
        buttonStart.layer.cornerRadius = 10
        buttonStart.layer.borderColor = UIColor.white.cgColor
    }
    func setGradientBackground() {
        
        let colorTop =  UIColor(red: 170.0/255.0, green: 67.0/255.0, blue: 233.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 79.0/255.0, green: 84.0/255.0, blue: 217.0/255.0, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    @IBAction func buttonActionArrow(sender: UIButton) {
//        self.dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonActionStart(sender: UIButton) {
        self.performSegue(withIdentifier: "QuizViewController", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? QuizViewController {
            vc.getNameQuiz = getNameStartQuiz
            vc.receivedImageInQuiz = receivedImageInStartQuiz
        }
    }
}


//let colorTop =  UIColor(red: 255.0/255.0, green: 5.0/255.0, blue: 27.0/255.0, alpha: 1.0).cgColor
//let colorBottom = UIColor(red: 34.0/255.0, green: 25.0/255.0, blue: 34.0/255.0, alpha: 1.0).cgColor
