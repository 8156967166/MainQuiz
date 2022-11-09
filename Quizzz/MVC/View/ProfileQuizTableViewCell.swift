//
//  ProfileQuizTableViewCell.swift
//  Quizzz
//
//  Created by Bimal@AppStation on 22/06/22.
//

import UIKit

protocol PassDataToViewControllerDelegate {
    func passData(str: String, passModel: ProfileQuiz)
    func buttonAction()
}

class ProfileQuizTableViewCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var labelTitle: UILabel?
    @IBOutlet weak var txtfield: UITextField?
    @IBOutlet weak var buttonSignIn: UIButton?
    var delegate: PassDataToViewControllerDelegate?
    var model: ProfileQuiz!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setModel(setProfileModel: ProfileQuiz) {
        self.labelTitle?.text = setProfileModel.title
        txtfield?.text = setProfileModel.enteredtext
        txtfield?.delegate = self
        model = setProfileModel
        setPlaceholderKeyboardtype()
        setStyle()
    }
    func setPlaceholderKeyboardtype() {
        if model.type == .name {
            txtfield?.placeholder = "name"
            txtfield?.keyboardType = .asciiCapable
        } else if model.type == .email {
            txtfield?.placeholder = "email"
            txtfield?.keyboardType = .asciiCapable
        } else if model.type == .password {
            txtfield?.placeholder = "password"
            txtfield?.keyboardType = .asciiCapable
        }
    }
    func setStyle() {
        buttonSignIn?.layer.borderWidth = 1
        buttonSignIn?.layer.borderColor = #colorLiteral(red: 0.8731591702, green: 0.8731591702, blue: 0.8731591702, alpha: 1)
        buttonSignIn?.layer.cornerRadius = 6
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
//        print("text entered: \(txtfield?.text ?? "")")
        delegate?.passData(str: txtfield?.text ?? "", passModel: model)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.endEditing(true)
        return true;
    }
    @IBAction func buttonActionUpdate(sender: UIButton) {
        delegate?.buttonAction()
    }
    func addDoneButtonOnKeyboard(){
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default

            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()
            txtfield?.inputAccessoryView = doneToolbar
    }
        @objc func doneButtonAction(){
            txtfield?.resignFirstResponder()
        }

}
