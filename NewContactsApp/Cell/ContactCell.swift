//
//  ContactCell.swift
//  NewContactsApp
//
//  Created by ruslan on 19.07.2021.
//

import UIKit

class ContactCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "ContactCell"
    
    var user: ContactsModel.User?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
    }
    
    func configure(with user: ContactsModel.User) {
        self.user = user
    }
    
    override func layoutSubviews() {
        
        switch user?.direction {
        case .top: roundCorners(corners: [.topLeft, .topRight], radius: 12.0)
        case .all: roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 12.0)
        case .bottom: roundCorners(corners: [.bottomLeft, .bottomRight], radius: 12.0)
        default: break
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}