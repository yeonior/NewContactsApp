//
//  ContactCell.swift
//  NewContactsApp
//
//  Created by ruslan on 19.07.2021.
//

import UIKit

class ContactCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "ContactCell"
    
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let phoneImageView = UIImageView()
    let videoImageView = UIImageView()
    let mailImageView = UIImageView()
    
    var user: ContactsModel.User?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func configure(with user: ContactsModel.User) {
        
        self.user = user
        
        backgroundColor = .secondarySystemBackground
        
        imageView.image = UIImage(named: user.imageString)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12.5
        
        nameLabel.text = user.fullname
        nameLabel.font = UIFont.sfProRounded(ofSize: 18, weight: .medium)
        nameLabel.textAlignment = .left
        
        let stackVIew = UIStackView(arrangedSubviews: [phoneImageView, videoImageView, mailImageView])
        phoneImageView.image = #imageLiteral(resourceName: "phone")
        videoImageView.image = #imageLiteral(resourceName: "solid")
        mailImageView.image = #imageLiteral(resourceName: "mail")
        
        stackVIew.axis = .horizontal
        stackVIew.distribution = .fillEqually
        stackVIew.spacing = 5
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(stackVIew)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        stackVIew.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 25),
            imageView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: stackVIew.leadingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            stackVIew.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackVIew.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
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
