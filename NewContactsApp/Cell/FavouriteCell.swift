//
//  FavouriteCell.swift
//  NewContactsApp
//
//  Created by ruslan on 19.07.2021.
//

import UIKit

class FavouriteCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "FavouriteCell"
    
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let phoneImageView = UIImageView()
    let videoImageView = UIImageView()
    let mailImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
                
    }
    
    func configure(with user: ContactsModel.User) {
        
        backgroundColor = .secondarySystemBackground
        
        imageView.image = UIImage(named: user.imageString)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        
        nameLabel.text = user.fullname
        nameLabel.font = UIFont.sfProRounded(ofSize: 14, weight: .medium)
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
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            stackVIew.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackVIew.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7)
        ])
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
