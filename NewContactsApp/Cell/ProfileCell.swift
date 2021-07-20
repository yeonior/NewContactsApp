//
//  ProfileCell.swift
//  NewContactsApp
//
//  Created by ruslan on 19.07.2021.
//

import UIKit

class ProfileCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "ProfileCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .orange
    }
    
    func configure(with user: ContactsModel.User) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
