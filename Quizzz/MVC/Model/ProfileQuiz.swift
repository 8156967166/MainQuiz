//
//  ProfileQuiz.swift
//  Quizzz
//
//  Created by Bimal@AppStation on 22/06/22.
//

import Foundation

enum Functionality {
    case name
    case email
    case password
    case buttonSignIn
}

class ProfileQuiz {
    var title: String?
    var type: Functionality?
    var identifier: String = ""
    var enteredtext: String = ""
    init(strTitle: String, functionality: Functionality) {
        self.title = strTitle
        self.type = functionality
        switch type {
        case .name:
            identifier = "Table.text"
        case .email:
            identifier = "Table.text"
        case .password:
            identifier = "Table.text"
        case .buttonSignIn:
            identifier = "Table.button"
        case .none:
            print("None")
        }
    }
    
}
