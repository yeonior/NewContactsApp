//
//  SelfConfiguringCell.swift
//  NewContactsApp
//
//  Created by ruslan on 19.07.2021.
//

import UIKit

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure(with user: ContactsModel.User)
}
