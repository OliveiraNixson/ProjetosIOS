//
//  User.swift
//  MovMaker
//
//  Created by iredefbmac_30 on 02/12/25.
//

import Foundation
import SwiftData


@Model
class User: Identifiable{
    var id : UUID
    var name: String
    var email: String
    var age: Int
    var password: String
    var progress: Int = 0
    
    init( name: String, email: String, age: Int, password: String) {
        self.id = UUID()
        self.name = name
        self.email = email
        self.age = age
        self.password = password
    }
}
