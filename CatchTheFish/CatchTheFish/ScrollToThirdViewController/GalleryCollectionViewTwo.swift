//
//  GalleryCollectionViewTwo.swift
//  CatchTheFish
//
//  Created by Yuriy Yakimenko on 26.12.2022.
//

import UIKit

 class GalleryCollectionViewTwo: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
     
     static let reuseId = "GalleryCollectionViewTwo"
    
    var cells = [FishModelTwo]()
     
     init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        delegate = self
        dataSource = self
        register(GalleryCollectionViewCellTwo.self, forCellWithReuseIdentifier: GalleryCollectionViewCellTwo.reuseId)
     
     
         
         
         
       translatesAutoresizingMaskIntoConstraints = false
       layout.minimumLineSpacing = Constants.galleryMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
        
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
 
     func set(cells: [FishModelTwo]) {
         self.cells = cells
     }
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return cells.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCellTwo.reuseId, for: indexPath) as! GalleryCollectionViewCellTwo
        cell.mainImageView.image = cells[indexPath.row].mainImage
         cell.nameLabel.text = cells[indexPath.row].fishName
         return cell
     }
     
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: Constants.galleryItemWidth, height: frame.height * 0.6)
     }
     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
   

    }
