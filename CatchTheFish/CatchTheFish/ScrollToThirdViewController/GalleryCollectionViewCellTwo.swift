//
//  GalleryCollectionViewCellTwo.swift
//  CatchTheFish
//
//  Created by Yuriy Yakimenko on 26.12.2022.
//

import UIKit

class GalleryCollectionViewCellTwo: UICollectionViewCell {
    
    static let reuseId = "GalleryCollectionViewCell"
    
    let mainImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
//    let likeImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "like")
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mainImageView)
        addSubview(nameLabel)
   //     addSubview(likeImageView)
        
        
        
        backgroundColor = .clear
        
        
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
        
        
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 10).isActive = true
        
        
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 9
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 3, height: 3)
        
        self.clipsToBounds = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


