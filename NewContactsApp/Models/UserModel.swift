//
//  UserModel.swift
//  NewContactsApp
//
//  Created by ruslan on 19.07.2021.
//

import UIKit

struct User: Hashable, Decodable {
    var fullname: String
    var imageString: String
    var firstCharacter: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
