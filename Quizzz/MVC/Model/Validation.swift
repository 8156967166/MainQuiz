//
//  Validation.swift
//  Quizzz
//
//  Created by Bimal@AppStation on 22/06/22.
//

import Foundation
class Validation {
    public func validateName(name: String) ->Bool {
          // Length be 18 characters max and 3 characters minimum, you can always modify.
          let nameRegex = "[A-Za-z]{2,}"
          let trimmedString = name.trimmingCharacters(in: .whitespaces)
          let validateName = NSPredicate(format: "SELF MATCHES %@", "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$", nameRegex)
          let isValidateName = validateName.evaluate(with: trimmedString)
          return isValidateName
       }
       public func validateEmailId(emailID: String) -> Bool {
          let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
          let trimmedString = emailID.trimmingCharacters(in: .whitespaces)
          let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
          let isValidateEmail = validateEmail.evaluate(with: trimmedString)
          return isValidateEmail
       }
}
