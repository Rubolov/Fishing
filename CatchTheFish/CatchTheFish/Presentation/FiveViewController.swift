//
//  FiveViewController.swift
//  CatchTheFish
//
//  Created by Yuriy Yakimenko on 26.12.2022.
//

import UIKit

class FiveViewController: UIViewController {
    
    let backgroundImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "backgroundInfo"))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private var galleryCollectionViewTwo = GalleryCollectionViewTwo()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .black
        setupSubviews()
        galleryCollectionViewTwo.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                   
        view.addSubview(galleryCollectionViewTwo)
                
        NSLayoutConstraint.activate([
            galleryCollectionViewTwo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            galleryCollectionViewTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            galleryCollectionViewTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            galleryCollectionViewTwo.heightAnchor.constraint(equalToConstant: 100)
        ])
                
        galleryCollectionViewTwo.set(cells: FishModelTwo.nameFish())
    }
    
    private func setupSubviews() {
        view.addSubview(backgroundImage)
    }
}

extension FiveViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = FishViewControllerTwo()
        vc.mainImageView.image = galleryCollectionViewTwo.cells[indexPath.row].mainImage
        vc.nameLabel.text = galleryCollectionViewTwo.cells[indexPath.row].fishName
        present(vc, animated: true)
    }
}
