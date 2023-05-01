//
//  GalleryCollectionViewCell.swift
//  CatchTheFish
//
//  Created by Yuriy Yakimenko on 25.12.2022.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "GalleryCollectionViewCell"
    
    let mainImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
            
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mainImageView)
        addSubview(nameLabel)
        
        
        backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            mainImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            mainImageView.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 0),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 9
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 3, height: 3)
        
//        self.clipsToBounds = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


