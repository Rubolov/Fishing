//
//  FishViewControllerTwo.swift
//  CatchTheFish
//
//  Created by Yuriy Yakimenko on 27.12.2022.
//

import UIKit

class FishViewControllerTwo: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupSubviews()
        addConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(mainImageView)
        view.addSubview(nameLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            mainImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            mainImageView.widthAnchor.constraint(equalToConstant: 200),
            mainImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            nameLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

