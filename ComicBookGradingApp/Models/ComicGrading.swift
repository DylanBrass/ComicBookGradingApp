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