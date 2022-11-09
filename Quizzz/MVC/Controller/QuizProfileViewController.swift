//
//  QuizProfileViewController.swift
//  Quizzz
//
//  Created by Bimal@AppStation on 22/06/22.
//

import UIKit

class QuizProfileViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldEmailPremium: UITextField!
    @IBOutlet weak var imagePerson: UIImageView!
    @IBOutlet weak var imageVerified: UIImageView!
    @IBOutlet weak var imageEdit: UIImageView!
    @IBOutlet weak var imageBasic: UIImageView!
    @IBOutlet weak var viewGradient: UIView!
    @IBOutlet weak var buttonGoToQuiz: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var buttonGoToPremium: UIButton!
    @IBOutlet weak var buttonBasicAccount: UIButton!
    @IBOutlet weak var viewBasicAccount: UIView!
    @IBOutlet weak var viewGoToPremium: UIView!
    @IBOutlet weak var buttonPremium: UIButton!
    var getName = String()
    var getEmail = String()
    var receviedImageInQuizProfile: UIImage!

   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setQuizProfileGradientBackground()
        
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = getName
        imagePerson.image = receviedImageInQuizProfile
        textFieldEmail.text = getEmail
        textFieldEmailPremium.text = getEmail
        scrollView.delegate = self
//        self.scrollView.isPagingEnabled = true
        buttonBasicAccount.backgroundColor = .white
        buttonGoToQuiz.layer.cornerRadius = 16
        buttonPremium.layer.cornerRadius = 6
        setViewGradientBackground()
        setImageView(tempImg: imagePerson)
        setImageView(tempImg: imageVerified)
        setImageView(tempImg: imageBasic)
        setImageView(tempImg: imageEdit)
        imagePerson.layer.borderWidth = 7
        imagePerson.layer.borderColor = UIColor.white.cgColor
        // Do any additional setup after loading the view.
    }
    func setImageView(tempImg: UIImageView) {
        tempImg.layer.cornerRadius = tempImg.frame.width/2.0
        tempImg.clipsToBounds = true
    }
    
    func setQuizProfileGradientBackground() {

        let colorTop =  UIColor(red: 170.0/255.0, green: 67.0/255.0, blue: 233.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 79.0/255.0, green: 84.0/255.0, blue: 217.0/255.0, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    func setViewGradientBackground() {

        let colorTop =  UIColor(red: 170.0/255.0, green: 67.0/255.0, blue: 233.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 79.0/255.0, green: 84.0/255.0, blue: 217.0/255.0, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.viewGradient.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    @IBAction func buttonActionEdit(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func buttonActionGoToQuiz(sender: UIButton) {
        self.performSegue(withIdentifier: "StartQuzPageViewController", sender: nil)
    }
    @IBAction func buttonActionArrow(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? StartQuizPageViewController {
            vc.getNameStartQuiz = getName
            vc.receivedImageInStartQuiz = imagePerson.image
        }
    }
    
    @IBAction func buttonActionBasicAccount(sender: UIButton) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        sender.backgroundColor = .white
        buttonGoToPremium.backgroundColor = .clear
        
    }
    @IBAction func buttonActionGoToPremium(sender: UIButton) {
        sender.backgroundColor = .white
        buttonBasicAccount.backgroundColor = .clear
        let screenSize: CGRect = UIScreen.main.bounds
        scrollView.setContentOffset(CGPoint(x: screenSize.width, y: 0), animated: true)
//        scrollView.setContentOffset(CGPoint(x: scrollView.contentSize.width, y: 0), animated: true)
    }
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)     //Getting the current page
        print("page:\(page)")
        if page == 0 {
            buttonBasicAccount.backgroundColor = .white
            buttonGoToPremium.backgroundColor = .clear
        }
        else if page == 1 {
            buttonGoToPremium.backgroundColor = .white
            buttonBasicAccount.backgroundColor = .clear
        }
    }
}



