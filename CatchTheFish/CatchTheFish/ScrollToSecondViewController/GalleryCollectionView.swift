//
//  GalleryCollectionView.swift
//  CatchTheFish
//
//  Created by Yuriy Yakimenko on 25.12.2022.
//

import UIKit

class GalleryCollectionView: UICollectionView, UICollectionViewDataSource  {
     
     static let reuseId = "GalleryCollectionView"
    
    var cells = [FishModel]()
     
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        
        backgroundColor = .clear
        dataSource = self
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseId)
        
        layout.itemSize = CGSize(width: 100, height: 100)

       translatesAutoresizingMaskIntoConstraints = false
       layout.minimumLineSpacing = 15
        
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
 
     func set(cells: [FishModel]) {
         self.cells = cells
     }
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return cells.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.reuseId, for: indexPath) as! GalleryCollectionViewCell
        cell.mainImageView.image = cells[indexPath.row].mainImage
        cell.nameLabel.text = cells[indexPath.row].fishName
      //   cell.description.text = cells[indexPath.row].description
        return cell
     }
    
     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}
