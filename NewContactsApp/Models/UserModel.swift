//
//  UserModel.swift
//  NewContactsApp
//
//  Created by ruslan on 19.07.2021.
//

import UIKit

class ContactsModel {
    
    enum CornersDirections: Int, Codable {
        case top, all, bottom, nope
    }
    
    struct User: Hashable, Decodable {
        var fullname: String
        var imageString: String
        var firstCharacter: String
        var id: Int
        var direction: CornersDirections?
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
        
    enum SectionType: Int {
        case profile
        case favourites
        case contacts
    }
    
    struct UserCollection: Hashable {
        var type: SectionType
        var header: String?
        var users: [User]
        var id = UUID()
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
    
    var collections: [UserCollection] {
        return _collection
    }
    
    init() {
        generateCollections()
    }
    
    fileprivate var _collection = [UserCollection]()
}

extension ContactsModel {
    
    fileprivate func generateCollections() {
        
        let profile = User(fullname: "Alex Richards", imageString: "human1", firstCharacter: "A", id: 20)
        let favouriteUsers = Bundle.main.decode([User].self, from: "favouriteUsers.json")
        let contactUsers = Bundle.main.decode([User].self, from: "contactUsers.json")
        
        _collection = [
            UserCollection(type: .profile, header: nil, users: [profile]),
            UserCollection(type: .favourites, header: nil, users: favouriteUsers)
        ]
        
        var dict: [String:[User]] = [:]
        contactUsers.forEach { user in
            if dict[user.firstCharacter] == nil {
                dict[user.firstCharacter] = [user]
            } else {
                if dict[user.firstCharacter]?.first?.firstCharacter == user.firstCharacter {
                    dict[user.firstCharacter]?.append(user)
                }
            }
        }
        
        dict.forEach { key, users in
            _collection.append(UserCollection(type: .contacts, header: key, users: users))
        }
    }
}
