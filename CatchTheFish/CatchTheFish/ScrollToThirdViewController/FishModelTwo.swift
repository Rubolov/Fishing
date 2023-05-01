//
//  FishModelTwo.swift
//  CatchTheFish
//
//  Created by Yuriy Yakimenko on 26.12.2022.
//

import UIKit

struct FishModelTwo {
    var mainImage: UIImage
    var fishName: String
    
    
    
    static func nameFish() -> [FishModelTwo] {
        let firstItem = FishModelTwo(mainImage: UIImage(named: "8")!,
                               fishName: "Stingray")
                               
        let secondItem = FishModelTwo(mainImage: UIImage(named: "9")!,
                                    fishName: "Shark")
                                    
        let thirdItem = FishModelTwo(mainImage: UIImage(named: "10")!,
                                   fishName: "Marlin")
        
        let fouthItem = FishModelTwo(mainImage: UIImage(named: "11")!,
                                   fishName: "Fish Moon")
        
        let five = FishModelTwo(mainImage: UIImage(named: "12")!,
                                   fishName: "Whale")
        
        let six = FishModelTwo(mainImage: UIImage(named: "13")!,
                                    fishName: "Dolphin")
        
        let seven = FishModelTwo(mainImage: UIImage(named: "14")!,
                                   fishName: "Grouper")
        
        let eight = FishModelTwo(mainImage: UIImage(named: "15")!,
                                   fishName: "Arapaima")
        
        
        return [firstItem, secondItem, thirdItem, fouthItem, five, six, seven, eight]
    }
}

struct Constants {
    static let leftDistanceToView: CGFloat = 40
    static let rightDistanceToView: CGFloat = 40
    static let galleryMinimumLineSpacing: CGFloat = 2
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 2)) / 2
}
