//
//  ProfileQuizViewController.swift
//  Quizzz
//
//  Created by Bimal@AppStation on 22/06/22.
//

import UIKit

class ProfileQuizViewController: UIViewController, UITextFieldDelegate, PassDataToViewControllerDelegate {
    @IBOutlet weak var tableview: UITableView!
    let userModel: UserProfile! = UserProfile()
    var editProfile = [ProfileQuiz]()
    var validation = Validation()
    func passData(str: String, passModel: ProfileQuiz) {
        for model in editProfile {
            if model.type == passModel.type {
                print("Entered text: \(str)")
                model.enteredtext = str
            }
        }
//        DispatchQueue.main.async {
//            self.tableview.reloadData()
//        }
    }
    func showAlert(strTitle: String, strMessage: String) {
            let alertController = UIAlertController(title: strTitle, message: strMessage, preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
    }
    
    func buttonAction() {
        self.view.endEditing(true)
        for model in editProfile {
            print("loop executed")
            if model.type != .buttonSignIn {
                if model.type == .name {
                    let isValidateName = self.validation.validateName(name: model.enteredtext)
                    if(isValidateName == false) {
                        showAlert(strTitle: "Invalid", strMessage: "Enter valid Name")
                    }
                }
                if model.type == .email {
                    let isValidateEmail = self.validation.validateEmailId(emailID: model.enteredtext)
                    if(isValidateEmail == false) {
                        showAlert(strTitle: "Invalid", strMessage: "Enter Valid Email")
                    }
                }
                if model.type == .password {
                    if model.enteredtext.isEmpty {
                        showAlert(strTitle: "Invalid", strMessage: "Enter Valid Password")
                    }
                }
            }
        }
        print("button clicked")
        for model in editProfile {
            if model.type == .name {
                userModel.setName = model.enteredtext
            } else if model.type == .email {
                userModel.setEmail = model.enteredtext
            }
        }
        self.performSegue(withIdentifier: "profileSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "profileSegue") {
                if let userVC = segue.destination as? UserProfileViewController {
                    userVC.getModel = userModel
                }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setProfileGradientBackground()
//        notificationKeyboard()
        setModelQuiz()
        // Do any additional setup after loading the view.
    }
    func setProfileGradientBackground() {

        let colorTop =  UIColor(red: 31.0/255.0, green: 31.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 34.0/255.0, green: 25.0/255.0, blue: 34.0/255.0, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
//    func notificationKeyboard() {
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//    @objc func keyboardWillShow(notification: NSNotification) {
//        guard let userInfo = notification.userInfo else { return }
//           var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//           keyboardFrame = self.view.convert(keyboardFrame, from: nil)
//
//        var contentInset:UIEdgeInsets = self.tableview.contentInset
//           contentInset.bottom = keyboardFrame.size.height + 20
//           tableview.contentInset = contentInset
//    }
//    @objc func keyboardWillHide(notifiaction: NSNotification) {
//        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
//            tableview.contentInset = contentInset
//    }
    
    func setModelQuiz() {
        let nameModel = ProfileQuiz(strTitle: "Name", functionality: .name)
        let emailModel = ProfileQuiz(strTitle: "Email", functionality: .email)
        let passwordModel = ProfileQuiz(strTitle: "Password", functionality: .password)
        let buttonModel = ProfileQuiz(strTitle: "", functionality: .buttonSignIn)
        editProfile = [nameModel, emailModel, passwordModel, buttonModel]
//        DispatchQueue.main.async {
//            self.tableview.reloadData()
//        }
    }
}

extension ProfileQuizViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return editProfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = editProfile[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.identifier, for: indexPath) as! ProfileQuizTableViewCell
        cell.setModel(setProfileModel: cellModel)
        cell.delegate = self
        return cell
    }
    
    
}
