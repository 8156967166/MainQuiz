//
//  UserProfile.swift
//  Quizzz
//
//  Created by Bimal@AppStation on 22/06/22.
//

import Foundation
class UserProfile {
    var setName: String?
    var setEmail: String?
    
    init()
    {
        
    }
    init(strName: String, strEmail: String) {
        self.setName = strName
        self.setEmail = strEmail
    }
}
