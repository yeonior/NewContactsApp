//
//  FavouriteCell.swift
//  NewContactsApp
//
//  Created by ruslan on 19.07.2021.
//

import UIKit

class FavouriteCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "FavouriteCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue
    }
    
    func configure(with user: ContactsModel.User) {
        
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
