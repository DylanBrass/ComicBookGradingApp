//
//  IssueResponse.swift
//  ComicBookGradingApp
//
//  Created by Dylan on 2023-12-09.
//

import Foundation


struct IssueResponse: Codable{
    var count: Int
    var results: [IssueResult]
}

struct IssueResult: Codable, Identifiable{
    var id: Int
    var number: String
    var issue: String
    var cover_date: String
    var image: String
    var series: IssueSeries
}

struct IssueSeries: Codable{
    var name: String
    var volume: Int
    var year_began: Int
}
