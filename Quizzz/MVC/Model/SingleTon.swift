//
//  SingleTon.swift
//  Quizzz
//
//  Created by Bimal@AppStation on 28/06/22.
//

import Foundation
class SingleTonClass {
    static let shared = SingleTonClass()
    var sharedUser = userObject()
    var locationGranted: Bool?
    private init() {
        
    }
    func requestForuser() -> userObject {
        return self.sharedUser
    }
}
class userObject {
    var fname = ""
    
}
