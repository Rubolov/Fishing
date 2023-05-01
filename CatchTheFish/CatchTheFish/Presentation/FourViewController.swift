//
//  FourViewController.swift
//  CatchTheFish
//
//  Created by Yuriy Yakimenko on 26.12.2022.
//

import UIKit

class FourViewController: UIViewController {
    
    let backgroundView = UIImageView()
    let scrollView = UIScrollView()
    let contentView = UIView()
    let titleLabel: UILabel = {
           let label = UILabel()
           label.text = "This is a small artificial lake in north Ukraine. The lake has dark water color and a muddy bottom. The only deeper area in the lake is an old riverbed. In the summertime the place is used extensively to grow different types of fish. The lake is a source of unexplained phenomena, as the lake contains quite rare fish that do not live in these regions. This lake is under the protection of fish guard. Fishing on the lake is strictly prohibited."
           label.numberOfLines = 0
           label.sizeToFit()
           label.textColor = .white
           label.font = label.font.withSize(25)
           return label
       }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Place has not been popular in fishing, so there is no reliable information about the fish - only hoaxes. In the summertime some fishermen had lost a few lures with a beast. In the midwinter fish activity can be low time to time - reason is low oxygen level."
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = .white
        label.font = label.font.withSize(25)
        return label
    }()
        
    private func setupScrollView() {
        scrollView.backgroundColor = .clear
        scrollView.layer.cornerRadius = 50
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            scrollView.widthAnchor.constraint(equalToConstant: 300),
            scrollView.heightAnchor.constraint(equalToConstant: 200),
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4)
        ])
        
        NSLayoutConstraint.activate([
            subtitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            subtitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4),
            subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
        
    let backgroundImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "backgroundInfo"))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private var galleryCollectionView = GalleryCollectionView()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .black
        setupSubviews()
        galleryCollectionView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupContentView()
        setupViews()
        
        view.addSubview(galleryCollectionView)
            
                NSLayoutConstraint.activate([
            galleryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            galleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            galleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            galleryCollectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
                
        galleryCollectionView.set(cells: FishModel.nameFish())
    }
    
    private func setupSubviews() {
        view.addSubview(backgroundImage)
    }
}

extension FourViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = FishViewController()
                
        vc.mainImageView.image = galleryCollectionView.cells[indexPath.row].mainImage
        vc.nameLabel.text = galleryCollectionView.cells[indexPath.row].description
        present(vc, animated: true)
    }
}
