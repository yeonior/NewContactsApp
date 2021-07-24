//
//  ProfileCell.swift
//  NewContactsApp
//
//  Created by ruslan on 19.07.2021.
//

import UIKit

class ProfileCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "ProfileCell"
    
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let cardLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func configure(with user: ContactsModel.User) {
        
        backgroundColor = .systemBackground
        
        imageView.image = UIImage(named: user.imageString)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 29

        nameLabel.text = user.fullname
        nameLabel.font = UIFont.sfProRounded(ofSize: 28, weight: .semibold)
        nameLabel.textAlignment = .left

        cardLabel.text = "My card"
        cardLabel.font = UIFont.sfProRounded(ofSize: 16, weight: .regular)
        cardLabel.textAlignment = .left
        cardLabel.textColor = #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1)

        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(cardLabel)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 58),
            imageView.heightAnchor.constraint(equalToConstant: 58)
        ])

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            cardLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            cardLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
