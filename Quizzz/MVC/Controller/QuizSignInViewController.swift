//
//  QuizProfilePageViewController.swift
//  Quizzz
//
//  Created by Bimal@AppStation on 22/06/22.
//

import UIKit

class QuizSignInViewController: UIViewController,UITextFieldDelegate, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var buttonSignIn: UIButton!
    @IBOutlet weak var imagePerson: UIImageView!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageCamera: UIImageView!
    var validation = Validation()
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSignIn.layer.cornerRadius = 16
//        imagePerson.layer.cornerRadius = 20
        
        self.imagePerson.layer.cornerRadius = self.imagePerson.frame.width/2.0
        self.imagePerson.clipsToBounds = true
        imagePerson.layer.borderWidth = 4
        imagePerson.layer.borderColor = UIColor.white.cgColor
        imageCamera.layer.cornerRadius = 15
        
        notificationKeyboard()
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setQuizSignInGradientBackground()
    }
    
    func setQuizSignInGradientBackground() {

        let colorTop =  UIColor(red: 170.0/255.0, green: 67.0/255.0, blue: 233.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 79.0/255.0, green: 84.0/255.0, blue: 217.0/255.0, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    func showAlert(strTitle: String, strMessage: String) {
        let alertController = UIAlertController(title: strTitle, message: strMessage, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
        return
    }
    
    @IBAction func buttonActionSignIn(sender: UIButton) {
        guard let name = textFieldName.text, let email = textFieldEmail.text
        else {
            return
        }
        let isValidateName = self.validation.validateName(name: name)
        if(isValidateName == false) {
            showAlert(strTitle: "Invalid", strMessage: "Enter valid Name")
        }
        let isValidateEmail = self.validation.validateEmailId(emailID: email)
        if(isValidateEmail == false) {
            showAlert(strTitle: "Invalid", strMessage: "Enter valid email")
        }
        if let passwordText = textFieldPassword.text, passwordText.isEmpty {
            showAlert(strTitle: "Empty", strMessage: "Enter Password")
        }
       
        self.performSegue(withIdentifier: "QuizProfileViewController", sender: nil)
    }
    
    @IBAction func actionSheetProfileCamera(sender: Any) {
        self.showAlert()
    }
    func showAlert() {
        let alertController = UIAlertController(title: "Selection Process", message: "Choose Any Option", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(_ action: UIAlertAction) in
            self.getImage(fromSourceType: .camera)
        }))
        alertController.addAction(UIAlertAction(title: "Gallery", style: .default, handler: {(_ action: UIAlertAction) in
            self.getImage(fromSourceType: .photoLibrary)
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePickerConroller = UIImagePickerController()
            imagePickerConroller.delegate = self
            imagePickerConroller.sourceType = sourceType
            self.present(imagePickerConroller, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            self.dismiss(animated: true) { [weak self] in
                guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
                self?.imagePerson.image = image
            }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? QuizProfileViewController {
            vc.getName = textFieldName.text ?? ""
            vc.receviedImageInQuizProfile = imagePerson.image
            vc.getEmail = textFieldEmail.text ?? ""
        }
    }
    func notificationKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
           var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
           keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollView.contentInset
            contentInset.bottom = keyboardFrame.size.height + 20
            scrollView.contentInset = contentInset
    }
    @objc func keyboardWillHide(notifiaction: NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.view.endEditing(true)
        return true;
    }
}
