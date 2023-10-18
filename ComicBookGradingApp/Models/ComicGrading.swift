//
//  ComicGrading.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-18.
//

import Foundation

enum Condition:String{
    case CVSL
    case POOR
    case FR
    case FR_GD
    case GD_minus
    case GD
}

struct ComicToBeGraded{
    var title: String
    var number: Int?
    var company: String
    var releaseDate: Date
    var marketPriceAtNM: Double?
    var coverCondition: Condition
    
    
}
