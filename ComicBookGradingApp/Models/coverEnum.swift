//
//  coverEnum.swift
//  ComicBookGradingApp
//
//  Created by macuser on 2023-10-23.
//

import Foundation


enum Cover: String, CaseIterable {
    case BACK
    case FRONT

    var name: String {
        switch self {
        case .BACK: return "Back Cover"
        case .FRONT: return "Front Cover"
        }
    }
}
