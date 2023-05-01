//
//  FishModel.swift
//  CatchTheFish
//
//  Created by Yuriy Yakimenko on 25.12.2022.
//



import UIKit

struct FishModel {
    var mainImage: UIImage
    var fishName: String

    var description: String
   

    
    
    static func nameFish() -> [FishModel] {
        
        let firstItem = FishModel(mainImage: UIImage(named: "0")!,
                                  fishName: "Pike",
                                  description: "1 - 28kg")
                               
        let secondItem = FishModel(mainImage: UIImage(named: "1")!,
                                    fishName: "Bass",
                                   description: "1 - 11kg")
        
        let thirdItem = FishModel(mainImage: UIImage(named: "2")!,
                                   fishName: "CatFish",
                                  description: "1 - 100kg")
        
        let fouthItem = FishModel(mainImage: UIImage(named: "3")!,
                                   fishName: "Carp",
                                  description: "1 - 20kg")
        
        let fiveItem = FishModel(mainImage: UIImage(named: "4")!,
                                  fishName: "Zander",
                             description: "1 - 15kg")
        
        let sixItem = FishModel(mainImage: UIImage(named: "5")!,
                                    fishName: "Bream",
                            description: "1 - 6kg")
        
        let sevenItem = FishModel(mainImage: UIImage(named: "6")!,
                                   fishName: "Sturgeon",
                              description: "1 - 360 kg")
        
        let eightItem = FishModel(mainImage: UIImage(named: "7")!,
                                   fishName: "Paddlefish",
                              description: "1 - 72 kg")
        
        let firstItem1 = FishModel(mainImage: UIImage(named: "8")!,
                               fishName: "Stingray",
                                   description: "1 - 580 kg")
                               
        let secondItem2 = FishModel(mainImage: UIImage(named: "9")!,
                                    fishName: "Shark",
                                   description: "1 - 200kg")
                                    
        let thirdItem3 = FishModel(mainImage: UIImage(named: "10")!,
                                   fishName: "Marlin",
                                  description: "1 - 580kg")
        
        let fouthItem4 = FishModel(mainImage: UIImage(named: "11")!,
                                   fishName: "Fish Moon",
                                  description: "1 - 2000kg")
        
        let fiveItem5 = FishModel(mainImage: UIImage(named: "12")!,
                                   fishName: "Whale",
                                  description: "1 - 100000kg")
        
        let sixItem6 = FishModel(mainImage: UIImage(named: "13")!,
                                    fishName: "Dolphin",
                                  description: "1 - 180kg")
        
        let sevenItem7 = FishModel(mainImage: UIImage(named: "14")!,
                                   fishName: "Grouper",
                                  description: "1 - 450kg")
        
        let eightItem8 = FishModel(mainImage: UIImage(named: "15")!,
                                   fishName: "Arapaima",
                                  description: "1 - 180kg")
        
        _ = FishModel(mainImage: UIImage(named: "16")!,
                                   fishName: "Fish Guard",
                                  description: "")
        
        _ = FishModel(mainImage: UIImage(named: "17")!,
                                   fishName: "Tin",
                                  description: "")
        
        _ = FishModel(mainImage: UIImage(named: "18")!,
                                   fishName: "Torn Shoe",
                                  description: "")
        
        return [firstItem, secondItem, thirdItem, fouthItem, fiveItem, sixItem, sevenItem, eightItem, firstItem1, secondItem2, thirdItem3, fouthItem4, fiveItem5, sixItem6, sevenItem7, eightItem8]
    }
    


struct ConstantsTwo {
    static let leftDistanceToView: CGFloat = 40
    static let rightDistanceToView: CGFloat = 40
    static let galleryMinimumLineSpacing: CGFloat = 2
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 2)) / 2

}}
