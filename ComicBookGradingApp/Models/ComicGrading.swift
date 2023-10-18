//
//  ComicGrading.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-18.
//

import Foundation

struct ComicToBeGraded{
    var title: String
    var number: Int?
    var company: String
    var releaseDate: Date
    var marketPriceAtNM: Double?
    var coverCondition: [Cover: Condition]
    var cornerCondition: [Corner: Condition]
    var damagedPages : [Int: Condition]?
    
    init(title: String, number: Int? = nil, company: String, releaseDate: Date, marketPriceAtNM: Double? = nil, coverCondition: [Cover : Condition], cornerCondition: [Corner : Condition], damagedPages: [Int : Condition]? = nil) {
        self.title = title
        self.number = number
        self.company = company
        self.releaseDate = releaseDate
        self.marketPriceAtNM = marketPriceAtNM
        self.coverCondition = coverCondition
        self.cornerCondition = cornerCondition
        self.damagedPages = damagedPages
    }
}


enum Condition:Int{
    case CVSL = 1
    case POOR = 2
    case FR = 3
    case FR_GD = 4
    case GD_minus = 5
    case GD = 6
}

enum Cover:String{
    case BACK
    case FRONT
}

enum Corner: String{
    case TOP_RIGHT
    case TOP_LEFT
    case BOTTOM_RIGHT
    case BOTTOM_LEFT
}

